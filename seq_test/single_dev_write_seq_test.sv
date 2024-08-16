class single_dev_write_sequence extends noc_base_virtual_sequence;

  `uvm_object_utils(single_dev_write_sequence)

  rand int dev_channel;

  function new (string name = "single_dev_write_sequence");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info(get_type_name(), "\n=====================STARTED=====================", UVM_LOW)

    repeat(1)begin
      dev_channel = $urandom_range(1,4);      

      randcase
      50:begin
        `uvm_do_on_with(dev_single_write_seq, 
                        p_sequencer.dev_sqrs[dev_channel-1],
                        { src_id == dev_channel;
                        })
      end
      0:begin
        `uvm_do_on_with(dev_burst_write_seq, 
                        p_sequencer.dev_sqrs[dev_channel-1],
                        { src_id == dev_channel;
                          repeat_count inside{[2:10]};
                        })
      end
      endcase
    end                    
    

    `uvm_info(get_type_name(), "\n=====================FINISHED=====================", UVM_LOW)
  endtask
endclass

class single_dev_write_test extends noc_base_test;
  `uvm_component_utils(single_dev_write_test)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_top_virtual_sequence();
    single_dev_write_sequence seq = new();
    seq.start(env.virt_sqr);
  endtask
endclass: single_dev_write_test
