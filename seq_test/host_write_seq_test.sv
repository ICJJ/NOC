
class host_write_sequence extends noc_base_virtual_sequence;

`uvm_object_utils(host_write_sequence)
int num=0;
function new (string name = "host_write_sequence");
  super.new(name);
endfunction

virtual task body();
  super.body();
  `uvm_info(get_type_name(), "\n=====================STARTED=====================", UVM_LOW)

  repeat(10)begin   
    `uvm_info("SEQ_NUM", $sformatf("[----%0d-----]",num), UVM_LOW)
    randcase
    80:begin
      `uvm_do_on_with(host_single_write_seq, 
                      p_sequencer.host_sqr,
                      { 
                      })
    end
    80:begin
      `uvm_do_on_with(host_burst_write_seq, 
                      p_sequencer.host_sqr,
                      { 
                      })
    end
    endcase
    num ++;
  end                    
  `uvm_info(get_type_name(), "\n=====================FINISHED=====================", UVM_LOW)
endtask
endclass

class host_write_test extends noc_base_test;
  `uvm_component_utils(host_write_test)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_top_virtual_sequence();
    host_write_sequence seq = new();
    seq.start(env.virt_sqr);
  endtask
endclass: host_write_test
