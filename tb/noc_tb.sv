`timescale 1ns/1ps
module noc_tb;
  parameter real noc_clk_peroid = 10ns; // 100MHz

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import noc_test_pkg::*;

  logic noc_clk;
  logic noc_reset;

  HS_QV19P_ZYNQ_ZpciFPGASceMiLayer dut(
    .io_i_in_noc_pkt_valid                  (host_if.w_host_noc_valid   ),
    .io_i_in_noc_pkt_ready                  (host_if.w_host_noc_ready   ),
    .io_i_in_noc_pkt_payload                (host_if.w_host_noc_payload ),
    .io_o_in_noc_demux_0_valid			        (dev1_if.r_device_valid   ),
    .io_o_in_noc_demux_0_ready			        (dev1_if.r_device_ready   ),
    .io_o_in_noc_demux_0_payload_last			  (dev1_if.r_device_last    ),
    .io_o_in_noc_demux_0_payload_fragment		(dev1_if.r_device_fragment),
    .io_o_in_noc_demux_1_valid		          (dev2_if.r_device_valid   ),	
    .io_o_in_noc_demux_1_ready			        (dev2_if.r_device_ready   ),
    .io_o_in_noc_demux_1_payload_last			  (dev2_if.r_device_last    ),
    .io_o_in_noc_demux_1_payload_fragment		(dev2_if.r_device_fragment),	
    .io_o_in_noc_demux_2_valid		          (dev3_if.r_device_valid   ),  	
    .io_o_in_noc_demux_2_ready			        (dev3_if.r_device_ready   ),
    .io_o_in_noc_demux_2_payload_last			  (dev3_if.r_device_last    ),
    .io_o_in_noc_demux_2_payload_fragment		(dev3_if.r_device_fragment),  	
    .io_o_in_noc_demux_3_valid			        (dev4_if.r_device_valid   ),	
    .io_o_in_noc_demux_3_ready			        (dev4_if.r_device_ready   ),
    .io_o_in_noc_demux_3_payload_last			  (dev4_if.r_device_last    ),
    .io_o_in_noc_demux_3_payload_fragment		(dev4_if.r_device_fragment),		
    .io_i_out_noc_mux_0_valid		            (dev1_if.w_device_valid   ),    	
    .io_i_out_noc_mux_0_ready			          (dev1_if.w_device_ready   ),
    .io_i_out_noc_mux_0_payload_last			  (dev1_if.w_device_last    ),
    .io_i_out_noc_mux_0_payload_fragment		(dev1_if.w_device_fragment),    	
    .io_i_out_noc_mux_1_valid			          (dev2_if.w_device_valid   ),	
    .io_i_out_noc_mux_1_ready			          (dev2_if.w_device_ready   ),
    .io_i_out_noc_mux_1_payload_last			  (dev2_if.w_device_last    ),
    .io_i_out_noc_mux_1_payload_fragment		(dev2_if.w_device_fragment),	  	
    .io_i_out_noc_mux_2_valid			          (dev3_if.w_device_valid   ),  	
    .io_i_out_noc_mux_2_ready			          (dev3_if.w_device_ready   ),
    .io_i_out_noc_mux_2_payload_last			  (dev3_if.w_device_last    ),
    .io_i_out_noc_mux_2_payload_fragment		(dev3_if.w_device_fragment),  		
    .io_i_out_noc_mux_3_valid			          (dev4_if.w_device_valid   ),	
    .io_i_out_noc_mux_3_ready			          (dev4_if.w_device_ready   ),
    .io_i_out_noc_mux_3_payload_last			  (dev4_if.w_device_last    ),
    .io_i_out_noc_mux_3_payload_fragment		(dev4_if.w_device_fragment),			
    .io_o_out_noc_pkt_valid		              (host_if.r_host_noc_valid   ),	
    .io_o_out_noc_pkt_ready			            (host_if.r_host_noc_ready   ),
    .io_o_out_noc_pkt_payload_last			    (host_if.r_host_noc_last    ),
    .io_o_out_noc_pkt_payload_fragment			(host_if.r_host_noc_fragment),
    .clk		                                (noc_clk),	
    .reset                                  (noc_reset)
  );

  initial begin 
    noc_clk <= 0;
    fork
      forever begin
        #(noc_clk_peroid/2.0) noc_clk <= !noc_clk;
      end
    join_none
  end
  
  // reset trigger
  initial begin  
    noc_reset <= 1;
    fork
      begin
        repeat(25) @(posedge noc_clk);
        noc_reset <= 0;
      end
    join_none
  end

  host_if host_if(noc_clk, noc_reset);
  dev_if dev1_if(noc_clk, noc_reset);
  dev_if dev2_if(noc_clk, noc_reset);
  dev_if dev3_if(noc_clk, noc_reset);
  dev_if dev4_if(noc_clk, noc_reset);


  initial begin 
    // do interface configuration from top tb (HW) to verification env (SW)
    uvm_config_db#(virtual host_if)::set(uvm_root::get(), "uvm_test_top.env", "host_vif", host_if);
    uvm_config_db#(virtual dev_if)::set(uvm_root::get(), "uvm_test_top.env", "dev1_vif", dev1_if);
    uvm_config_db#(virtual dev_if)::set(uvm_root::get(), "uvm_test_top.env", "dev2_vif", dev2_if);
    uvm_config_db#(virtual dev_if)::set(uvm_root::get(), "uvm_test_top.env", "dev3_vif", dev3_if);
    uvm_config_db#(virtual dev_if)::set(uvm_root::get(), "uvm_test_top.env", "dev4_vif", dev4_if);
    run_test("host_single_transaction_test");
  end

initial
begin
  //fsdb
  $fsdbDumpfile("testbench.fsdb");
  $fsdbDumpvars(0,noc_tb,"+mda");
  $fsdbDumpMDA();
end

  //ASSERT
  property w_device_onehot_ready;
    @(posedge noc_clk) (dev1_if.w_device_ready || dev2_if.w_device_ready || dev3_if.w_device_ready || dev4_if.w_device_ready) 
    |-> $onehot({dev1_if.w_device_ready, dev2_if.w_device_ready, dev3_if.w_device_ready, dev4_if.w_device_ready}); 
  endproperty
  assert property(w_device_onehot_ready) else `uvm_error("ASSERT", "Ready signals of devices are not onehot when device writing!")

  property r_device_onehot_valid;
    @(posedge noc_clk) (dev1_if.r_device_valid || dev2_if.r_device_valid || dev3_if.r_device_valid || dev4_if.r_device_valid) 
    |-> $onehot({dev1_if.r_device_valid, dev2_if.r_device_valid, dev3_if.r_device_valid, dev4_if.r_device_valid}); 
  endproperty
  assert property(r_device_onehot_valid) else `uvm_error("ASSERT", "Valid signals of devices are not onehot when host writing!")


endmodule
