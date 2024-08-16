`ifndef DEV_AGENT_SVH
`define DEV_AGENT_SVH

class dev_agent extends uvm_agent;

  dev_driver driver;
  dev_sequencer sequencer;
  dev_mst_monitor mst_monitor;
  dev_slv_monitor slv_monitor;

  virtual dev_if vif;

  `uvm_component_utils_begin(dev_agent)
  `uvm_component_utils_end

  function new(string name="dev_agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new


  function void build();
    super.build();
    // get virtual interface
    if( !uvm_config_db#(virtual dev_if)::get(this,"","vif", vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    mst_monitor = dev_mst_monitor::type_id::create("mst_monitor",this);
    slv_monitor = dev_slv_monitor::type_id::create("slv_monitor",this);
    sequencer = dev_sequencer::type_id::create("sequencer",this);
    driver = dev_driver::type_id::create("driver",this);
  endfunction : build

  function void connect();
    assign_vi(vif);
    driver.seq_item_port.connect(sequencer.seq_item_export);       
  endfunction : connect
    
  function void assign_vi(virtual dev_if vif);
    mst_monitor.vif = vif;
    slv_monitor.vif = vif;
    sequencer.vif = vif; 
    driver.vif = vif; 
  endfunction : assign_vi

endclass : dev_agent

`endif // DEV_AGENT_SVH
