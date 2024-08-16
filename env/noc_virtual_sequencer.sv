`ifndef NOC_VIRTUAL_SEQUENCER_SV
`define NOC_VIRTUAL_SEQUENCER_SV

class noc_virtual_sequencer extends uvm_sequencer;
  host_sequencer host_sqr;
  dev_sequencer  dev_sqrs[4];

  //for virtual sequence
  virtual host_if host_vif;
  virtual dev_if  dev1_vif;
  virtual dev_if  dev2_vif;
  virtual dev_if  dev3_vif;
  virtual dev_if  dev4_vif;

  `uvm_component_utils(noc_virtual_sequencer)

  function new (string name= "noc_virtual_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build();
    super.build();
    // get virtual interface
    if(!uvm_config_db#(virtual host_if)::get(this,"","host_vif", host_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev1_vif", dev1_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev2_vif", dev2_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev3_vif", dev3_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev4_vif", dev4_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
  endfunction : build

endclass

`endif // NOC_VIRTUAL_SEQUENCER_SV
