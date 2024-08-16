`ifndef DEV_WRITE_SEQ_LIB_SV
`define DEV_WRITE_SEQ_LIB_SV

//for compile flow
typedef class noc_transaction;
typedef class dev_sequencer;

class dev_write_base_sequence extends uvm_sequence #(noc_transaction);
  
  //transactor parameter
  rand int src_id = -1;
  rand int dst_id = -1;
  rand int data_length = -1;
  rand int data_type = -1;
  rand int data[];
  rand int idle_cycles = -1;
  rand int trans_source = -1;

  `uvm_declare_p_sequencer(dev_sequencer)

  //no object utils
  function new(string name="dev_write_base_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
  endtask


endclass : dev_write_base_sequence 

class dev_single_write_sequence extends dev_write_base_sequence;

  `uvm_object_utils(dev_single_write_sequence)

  function new(string name="dev_single_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting dev_single_write_sequence", UVM_HIGH)
    super.body();
    $display("local::data_length=%h",data_length);
	  `uvm_do_with(req, { local::src_id >= 0 -> src_id == local::src_id;
                        trans_source == DEVICE;
                        })
    get_response(rsp);

    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : dev_single_write_sequence

class dev_burst_write_sequence extends dev_write_base_sequence;

  rand int repeat_count;
  int num=0;
  constraint c_repeat{
    repeat_count inside {[2:10]};
  }

  `uvm_object_utils(dev_burst_write_sequence)

  function new(string name="dev_burst_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting dev_burst_write_sequence", UVM_HIGH)
    super.body();
    repeat(repeat_count)begin
      `uvm_info("SEQ_BST_NUM", $sformatf("[----%0d:%0d-----]",repeat_count,num), UVM_LOW)
	  `uvm_do_with(req, {trans_source == DEVICE;
                      local::num < local::repeat_count-1 -> idle_cycles == 0;
                      local::src_id >= 0 -> src_id == local::src_id;
                    })
      get_response(rsp);
      num++;
    end

    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : dev_burst_write_sequence

class dev_max_length_write_sequence extends dev_write_base_sequence;
  `uvm_object_utils(dev_max_length_write_sequence)

  function new(string name="dev_max_length_write_sequence"); 
    super.new(name);
  endfunction : new

  virtual task body();
    `uvm_info(get_type_name(),"Starting dev_max_length_write_sequence", UVM_HIGH)
    super.body();
	  `uvm_do_with(req, {trans_source == DEVICE;
                        data_length == 65532;
                        local::src_id >= 0 -> src_id == local::src_id;})
    get_response(rsp);
    `uvm_info(get_type_name(),$psprintf("Done sequence: %s",req.convert2string()), UVM_HIGH)
  endtask: body
endclass : dev_max_length_write_sequence


`endif // DEV_WRITE_SEQ_LIB_SV
