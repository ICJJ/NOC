
class fifo_full_sequence extends noc_base_virtual_sequence;

`uvm_object_utils(fifo_full_sequence)

function new (string name = "fifo_full_sequence");
  super.new(name);
endfunction

virtual task body();
  super.body();
  `uvm_info(get_type_name(), "\n=====================STARTED=====================", UVM_LOW)

  repeat(100)begin   

    randcase
    50:begin
      `uvm_do_on_with(host_single_write_seq, 
                      p_sequencer.host_sqr,
                      { 
                      })
    end
    40:begin
      `uvm_do_on_with(host_srcid0_write_seq, 
                      p_sequencer.host_sqr,
                      { 
                      })
    end

    endcase
  end                    
  

  `uvm_info(get_type_name(), "\n=====================FINISHED=====================", UVM_LOW)
endtask
endclass

class fifo_full_test extends noc_base_test;
  `uvm_component_utils(fifo_full_test)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_top_virtual_sequence();
    fifo_full_sequence seq = new();
    seq.start(env.virt_sqr);
  endtask
endclass: fifo_full_test
