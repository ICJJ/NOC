`ifndef DEV_SEQUENCER_SVH
`define DEV_SEQUENCER_SVH

class dev_sequencer extends uvm_sequencer #(noc_transaction);

  virtual dev_if vif;

  `uvm_component_utils(dev_sequencer)

  function new (string name="dev_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass : dev_sequencer

`endif // DEV_SEQUENCER_SVH
