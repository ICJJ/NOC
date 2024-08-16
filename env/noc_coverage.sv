 `uvm_blocking_put_imp_decl(_mst_device_cov)
 `uvm_blocking_put_imp_decl(_mst_host_cov)
  
  
  
class noc_coverage extends uvm_component;
  local virtual dev_if dev_vifs[4]; 
  local virtual host_if host_vif; 

  uvm_blocking_put_imp_mst_device_cov #(noc_transaction, noc_coverage)   mst_device_bp_imp;
  uvm_blocking_put_imp_mst_host_cov #(noc_transaction, noc_coverage)   mst_host_bp_imp;


  `uvm_component_utils(noc_coverage)

  covergroup cg_tx_host_format with function sample(int length,int type_, int dst_id);

    DATA_LENGTH: coverpoint length{
        bins len4 = {4};
        bins len65532 = {65532};
        bins len_others = default;
    }
    DATA_TYPE: coverpoint type_{
        bins scemiv1 = {'hA8};
        bins scemiv2 = {'hAC};
    }
    DST_ID: coverpoint dst_id{
        bins from_dev1 = {1};
        bins from_dev2 = {2};
        bins from_dev3 = {3};
        bins from_dev4 = {4};
    }

    HOST_FORMAT: cross DATA_LENGTH, DATA_TYPE, DST_ID;

  endgroup

  covergroup cg_tx_device_format with function sample(int length,int type_, int src_id);
    DATA_LENGTH: coverpoint length{
        bins len4 = {4};
        bins len65532 = {65532};
        bins len_others = default;
    }
    DATA_TYPE: coverpoint type_{
        bins scemiv1 = {'hA8};
        bins scemiv2 = {'hAC};
    }
    SRC_ID: coverpoint src_id{
        bins from_dev1 = {1};
        bins from_dev2 = {2};
        bins from_dev3 = {3};
        bins from_dev4 = {4};
    }

    DEVICE_FORMAT: cross DATA_LENGTH, DATA_TYPE, SRC_ID;

  endgroup


  covergroup cg_tx_channel;
    DEV1_CHANNEL: coverpoint dev_vifs[0].cb_w_device_mon.w_device_valid{
      bins invalid = {0};
      bins valid = {1};    
    }
    DEV2_CHANNEL: coverpoint dev_vifs[1].cb_w_device_mon.w_device_valid{
      bins invalid = {0};
      bins valid = {1};    
    }
    DEV3_CHANNEL: coverpoint dev_vifs[2].cb_w_device_mon.w_device_valid{
      bins invalid = {0};
      bins valid = {1};    
    }
    DEV4_CHANNEL: coverpoint dev_vifs[3].cb_w_device_mon.w_device_valid{
      bins invalid = {0};
      bins valid = {1};    
    }
    HOST_CHANNEL: coverpoint host_vif.cb_w_host_mon.w_host_noc_valid{
      bins invalid = {0};
      bins valid = {1};    
    }

    DEVICES_CHANNEL: cross DEV1_CHANNEL, DEV2_CHANNEL,DEV3_CHANNEL,DEV4_CHANNEL;
  endgroup


  function new (string name = "noc_coverage", uvm_component parent);
    super.new(name, parent);
    this.cg_tx_host_format = new();
    this.cg_tx_device_format = new();
    this.cg_tx_channel = new();

    mst_device_bp_imp = new("mst_device_bp_imp", this); 
    mst_host_bp_imp = new("mst_host_bp_imp", this); 

  endfunction

  function void build();
    super.build();
    // get virtual interface
      if(!uvm_config_db#(virtual host_if)::get(this,"","host_vif", host_vif)) begin
        `uvm_fatal("GETVIF","cannot get vif handle from config DB")
      end
      foreach(dev_vifs[i])begin
        if(!uvm_config_db#(virtual dev_if)::get(this,"",$sformatf("dev_vifs[%0d]", i), dev_vifs[i])) begin
          `uvm_fatal("GETVIF","cannot get vif handle from config DB")
        end
      end
  endfunction : build

    task do_channel_sample();
      forever begin
        @(posedge host_vif.clk iff host_vif.reset===0);
        this.cg_tx_channel.sample();
      end
    endtask

  task run_phase(uvm_phase phase);
    fork 
      this.do_channel_sample();
    join
  endtask

  function void report_phase(uvm_phase phase);
    string s;
    super.report_phase(phase);
    s = "\n---------------------------------------------------------------\n";
    s = {s, "COVERAGE SUMMARY \n"}; 
    s = {s, $sformatf("total coverage: %.1f \n", $get_coverage())}; 
    s = {s, $sformatf("  cg_tx_device_format coverage: %.1f \n", this.cg_tx_device_format.get_coverage())}; 
    s = {s, $sformatf("  cg_tx_host_format coverage: %.1f \n", this.cg_tx_host_format.get_coverage())}; 
    s = {s, $sformatf("  cg_tx_channel coverage: %.1f \n", this.cg_tx_channel.get_coverage())}; 

    s = {s, "---------------------------------------------------------------\n"};
    `uvm_info(get_type_name(), s, UVM_LOW)
  endfunction

  function void put_mst_device_cov(noc_transaction t);
    cg_tx_device_format.sample(t.data_length, t.data_type, t.src_id);
  endfunction

  function void put_mst_host_cov(noc_transaction t);
    cg_tx_host_format.sample(t.data_length, t.data_type, t.dst_id);
  endfunction

endclass
