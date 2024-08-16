
class reset_sequence extends noc_base_virtual_sequence;

multiple_dev_write_sequence dev_write_seq;
host_write_sequence host_write_seq;

`uvm_object_utils(reset_sequence)


function new (string name = "reset_sequence");
  super.new(name);
endfunction

virtual task body();
  super.body();
  `uvm_info(get_type_name(), "\n=====================STARTED=====================", UVM_LOW)


fork
    begin
      `uvm_do_with(dev_write_seq, 
                      { 
                      })
    end
    begin
      `uvm_do_with(host_write_seq, 
                      { 
                      })
    end
  join_none
  
  //
  @(dev1_vif.w_device_valid===0 && dev2_vif.w_device_valid===0 
  && dev3_vif.w_device_valid===0 && dev4_vif.w_device_valid===0
  && host_vif.w_host_noc_valid===0)

  
  

  `uvm_info(get_type_name(), "\n=====================FINISHED=====================", UVM_LOW)
endtask
endclass

class reset_test extends noc_base_test;
  `uvm_component_utils(reset_test)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_top_virtual_sequence();
    reset_sequence seq = new();
    seq.start(env.virt_sqr);
  endtask
endclass: reset_test
