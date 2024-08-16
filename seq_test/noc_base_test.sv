`ifndef NOC_BASE_TEST_SV
`define NOC_BASE_TEST_SV

virtual class noc_base_test extends uvm_test;

  noc_env env;

  function new(string name = "noc_base_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = noc_env::type_id::create("env", this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_root::get().set_report_verbosity_level_hier(UVM_HIGH);
    uvm_root::get().set_report_max_quit_count(10);
    //uvm_root::get().set_timeout(10ms);
  endfunction

  task run_phase(uvm_phase phase);
    uvm_top.print_topology();
    // NOTE:: raise objection to prevent simulation stopping
    phase.raise_objection(this);
    `uvm_info(get_type_name(),"Raise objection", UVM_HIGH)
    this.run_top_virtual_sequence();
    // NOTE:: drop objection to request simulation stopping
    phase.drop_objection(this);
    `uvm_info(get_type_name(),"Drop objection", UVM_HIGH)
  endtask

  virtual task run_top_virtual_sequence();
  `uvm_info(get_type_name(),"run_top_virtual_sequence", UVM_HIGH)
    // User to implement this task in the child tests
  endtask
endclass: noc_base_test

`endif // NOC_BASE_TEST_SV
