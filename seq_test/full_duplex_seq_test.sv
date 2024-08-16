
class full_duplex_sequence extends noc_base_virtual_sequence;

multiple_dev_write_sequence mult_dev_write_seq;
host_write_sequence host_write_seq;

`uvm_object_utils(full_duplex_sequence)


function new (string name = "full_duplex_sequence");
  super.new(name);
endfunction

virtual task body();
  super.body();
  `uvm_info(get_type_name(), "\n=====================STARTED=====================", UVM_LOW)

repeat(1)begin
fork
    begin
      `uvm_do_with(mult_dev_write_seq, 
                      { 
                      })
    end
    begin
      `uvm_do_with(host_write_seq, 
                      { 
                      })
    end
join_any   
end             
  

  `uvm_info(get_type_name(), "\n=====================FINISHED=====================", UVM_LOW)
endtask
endclass

class full_duplex_test extends noc_base_test;
  `uvm_component_utils(full_duplex_test)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_top_virtual_sequence();
    full_duplex_sequence seq = new();
    seq.start(env.virt_sqr);
  endtask
endclass: full_duplex_test
