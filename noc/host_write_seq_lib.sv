`ifndef HOST_WRITE_SEQ_LIB_SV
`define HOST_WRITE_SEQ_LIB_SV

//for compile flow
typedef class noc_transaction;
typedef class host_sequencer;

class host_write_base_sequence extends uvm_sequence #(noc_transaction);

  //transactor parameter
  rand int src_id = -1;
  rand int dst_id = -1;
  rand int data_length = -1;
  rand int data_type = -1;
  rand int data[];
  rand int idle_cycles = -1;
  rand int trans_source = -1;
    
  `uvm_declare_p_sequencer(host_sequencer)

  function new(string name="host_write_base_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
  endtask

endclass : host_write_base_sequence 

class host_single_write_sequence extends host_write_base_sequence;

  `uvm_object_utils(host_single_write_sequence)

  function new(string name="host_single_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting sequence", UVM_HIGH)
    super.body();
	  `uvm_do_with(req, {trans_source == HOST;})
    get_response(rsp);
    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : host_single_write_sequence

class host_burst_write_sequence extends host_write_base_sequence;
  rand int repeat_count;
  int num=0;
  constraint c_repeat{
    repeat_count inside {[2:10]};
  }

  `uvm_object_utils(host_burst_write_sequence)

  function new(string name="host_burst_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting sequence", UVM_HIGH)
    super.body();

    repeat(repeat_count)begin
      `uvm_info("SEQ_BST_NUM", $sformatf("[----%0d:%0d-----]",repeat_count,num), UVM_LOW)
	  `uvm_do_with(req, {trans_source == HOST;
                      local::num < local::repeat_count-1 -> idle_cycles == 0;
                      })
      get_response(rsp);
      num++;
    end
    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : host_burst_write_sequence

class host_max_length_write_sequence extends host_write_base_sequence;
  `uvm_object_utils(host_max_length_write_sequence)
  function new(string name="host_max_length_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting sequence", UVM_HIGH)
    super.body();
	  `uvm_do_with(req, {trans_source == HOST;
                      data_length == 65532;})
    get_response(rsp);
    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : host_max_length_write_sequence

class host_srcid0_write_sequence extends host_write_base_sequence;
  `uvm_object_utils(host_srcid0_write_sequence)

  function new(string name="host_srcid0_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting sequence", UVM_HIGH)
    super.body();
	  `uvm_do_with(req, {trans_source == HOST;
                        src_id == 0;})
    get_response(rsp);
    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : host_srcid0_write_sequence

`endif // HOST_WRITE_SEQ_LIB_SV
