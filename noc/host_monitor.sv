class host_mst_monitor extends uvm_monitor;

  uvm_blocking_put_port #(noc_transaction) mon_bp_port;

  `uvm_component_utils(host_mst_monitor)

  virtual host_if vif;

  function new (string name="host_mst_monitor", uvm_component parent);
    super.new(name, parent);
    mon_bp_port = new("mon_bp_port", this);
  endfunction : new

  task run_phase(uvm_phase phase);
    this.mon_trans();
  endtask

task mon_trans();
  noc_transaction m;
  string s;
  forever begin
    @(posedge vif.clk iff (vif.cb_w_host_mon.w_host_noc_valid === 'b1 
                  && vif.cb_w_host_mon.w_host_noc_ready === 'b1));
 
    m = new();
    m.src_id = vif.cb_w_host_mon.w_host_noc_payload[3:0];
    m.dst_id = vif.cb_w_host_mon.w_host_noc_payload[7:4];
    m.data_length = vif.cb_w_host_mon.w_host_noc_payload[23:8];
    m.data_type = vif.cb_w_host_mon.w_host_noc_payload[31:24];
    m.data = new[m.data_length/4];

    foreach(m.data[i]) begin
      @(posedge vif.clk iff (vif.cb_w_host_mon.w_host_noc_valid === 'b1 
      && vif.cb_w_host_mon.w_host_noc_ready === 'b1));//avoid the ready=0 due to FIFO full
      m.data[i] = vif.cb_w_host_mon.w_host_noc_payload;
    end

    //dont check dst_id=0
    if(m.dst_id !=0)
      mon_bp_port.put(m);
    s = $sformatf("\n=======================================\n");
    s = {s, $sformatf("%0t  monitored a packet: \n", $time)};
    s = {s, $sformatf("src_id = %0d: \n", m.src_id)};
    s = {s, $sformatf("dst_id = %0d: \n", m.dst_id)};
    s = {s, $sformatf("data_length = %0d: \n", m.data_length)};
    s = {s, $sformatf("data_type = %0h: \n", m.data_type)};
    s = {s, $sformatf("data[%0d] = %8x \n", 0, m.data[0])};
    s = {s, $sformatf("... \n")};
    s = {s, $sformatf("data[%0d] = %8x \n", m.data.size()-1, m.data[m.data.size()-1])};
    s = {s, $sformatf("=======================================\n")};
    `uvm_info(get_type_name(), s, UVM_HIGH)
  end
endtask


endclass : host_mst_monitor



class host_slv_monitor extends uvm_monitor;

  uvm_blocking_put_port #(noc_transaction) mon_bp_port;

  `uvm_component_utils(host_slv_monitor)

  virtual host_if vif;

  function new (string name="host_slv_monitor", uvm_component parent);
    super.new(name, parent);
    mon_bp_port = new("mon_bp_port", this);
  endfunction : new

  task run_phase(uvm_phase phase);
    this.mon_trans();
  endtask

task mon_trans();
  noc_transaction m;
  string s;
  forever begin
    @(posedge vif.clk iff (vif.cb_r_host_mon.r_host_noc_valid === 'b1 
                  && vif.cb_r_host_mon.r_host_noc_ready === 'b1));
    m = new();
    m.src_id = vif.cb_r_host_mon.r_host_noc_fragment[3:0];
    m.dst_id = vif.cb_r_host_mon.r_host_noc_fragment[7:4];
    m.data_length = vif.cb_r_host_mon.r_host_noc_fragment[23:8];
    m.data_type = vif.cb_r_host_mon.r_host_noc_fragment[31:24];
    m.data = new[m.data_length/4];

    foreach(m.data[i]) begin
      @(posedge vif.clk iff (vif.cb_r_host_mon.r_host_noc_valid === 'b1 
      && vif.cb_r_host_mon.r_host_noc_ready === 'b1));
      m.data[i] = vif.cb_r_host_mon.r_host_noc_fragment;
    end
    $display("%t monitor last data",$time);
    //check data length
    if(vif.cb_r_host_mon.r_host_noc_last !== 'b1)
    `uvm_error(get_type_name(), "monitor a packet with false length")


    mon_bp_port.put(m);
    s = $sformatf("\n=======================================\n");
    s = {s, $sformatf("%0t  monitored a packet: \n", $time)};
    s = {s, $sformatf("src_id = %0d: \n", m.src_id)};
    s = {s, $sformatf("dst_id = %0d: \n", m.dst_id)};
    s = {s, $sformatf("data_length = %0d: \n", m.data_length)};
    s = {s, $sformatf("data_type = %0h: \n", m.data_type)};
    s = {s, $sformatf("data[%0d] = %8x \n", 0, m.data[0])};
    s = {s, $sformatf("... \n")};
    s = {s, $sformatf("data[%0d] = %8x \n", m.data.size()-1, m.data[m.data.size()-1])};
    s = {s, $sformatf("=======================================\n")};
    `uvm_info(get_type_name(), s, UVM_HIGH)
  end
endtask


endclass : host_slv_monitor
