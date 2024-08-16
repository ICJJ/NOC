`ifndef HOST_AGENT_SVH
`define HOST_AGENT_SVH

class host_agent extends uvm_agent;

  host_driver driver;
  host_mst_monitor mst_monitor;
  host_slv_monitor slv_monitor;
  host_sequencer sequencer;

  virtual host_if vif;

  `uvm_component_utils_begin(host_agent)
  `uvm_component_utils_end

  function new(string name="host_agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new


  function void build();
    super.build();
    // get virtual interface
    if( !uvm_config_db#(virtual host_if)::get(this,"","vif", vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    mst_monitor = host_mst_monitor::type_id::create("mst_monitor",this);
    slv_monitor = host_slv_monitor::type_id::create("slv_monitor",this);
    sequencer = host_sequencer::type_id::create("sequencer",this);
    driver = host_driver::type_id::create("driver",this);
  endfunction : build

  function void connect();
    assign_vi(vif);
    driver.seq_item_port.connect(sequencer.seq_item_export);       
  endfunction : connect
    
  function void assign_vi(virtual host_if vif);
    mst_monitor.vif = vif;
    slv_monitor.vif = vif;
    sequencer.vif = vif; 
    driver.vif = vif; 
  endfunction : assign_vi

endclass : host_agent

`endif // HOST_AGENT_SVH
