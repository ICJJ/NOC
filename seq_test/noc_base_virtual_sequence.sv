`ifndef NOC_BASE_VIRTUAL_SEQUENCE_SV
`define NOC_BASE_VIRTUAL_SEQUENCE_SV

virtual class noc_base_virtual_sequence extends uvm_sequence;
  //env component
  virtual host_if host_vif;
  virtual dev_if dev1_vif;
  virtual dev_if dev2_vif;
  virtual dev_if dev3_vif;
  virtual dev_if dev4_vif;
  noc_env env;

  // element sequences
  host_single_write_sequence  host_single_write_seq;
  host_burst_write_sequence   host_burst_write_seq;
  host_max_length_write_sequence host_max_length_write_seq;
  host_srcid0_write_sequence host_srcid0_write_seq;

  dev_single_write_sequence  dev_single_write_seq;
  dev_burst_write_sequence   dev_burst_write_seq;
  dev_max_length_write_sequence dev_max_length_write_seq;

  //dont register virtual seq
  `uvm_declare_p_sequencer(noc_virtual_sequencer)//put to this sqr

  function new (string name = "noc_base_virtual_sequence");
    super.new(name);
  endfunction

  virtual task body();
  `uvm_info(get_type_name(), "get vif from virtual sequencer to sequence", UVM_HIGH)
    host_vif = p_sequencer.host_vif;
    dev1_vif = p_sequencer.dev1_vif;    
    dev2_vif = p_sequencer.dev2_vif;   
    dev3_vif = p_sequencer.dev3_vif;   
    dev4_vif = p_sequencer.dev4_vif; 
    void'($cast(env, p_sequencer.m_parent));

    // host_vif.wait_reset_invalid();
    // dev1_vif.wait_reset_invalid();
    // dev2_vif.wait_reset_invalid();
    // dev3_vif.wait_reset_invalid();
    // dev4_vif.wait_reset_invalid();   
  endtask

  function bit diff_value(int val1, int val2, string id = "value_compare");
    if(val1 != val2) begin
      `uvm_error("[CMPERR]", $sformatf("ERROR! %s val1 %8x != val2 %8x", id, val1, val2)) 
      return 0;
    end
    else begin
      `uvm_info("[CMPSUC]", $sformatf("SUCCESS! %s val1 %8x == val2 %8x", id, val1, val2), UVM_LOW)
      return 1;
    end
  endfunction

endclass

`endif // NOC_BASE_VIRTUAL_SEQUENCE_SV
