`ifndef HOST_SEQUENCER_SVH
`define HOST_SEQUENCER_SVH

class host_sequencer extends uvm_sequencer #(noc_transaction);

  virtual host_if vif;

  `uvm_component_utils(host_sequencer)

  function new (string name="host_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass : host_sequencer

`endif // HOST_SEQUENCER_SVH
