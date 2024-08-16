
class multiple_dev_write_sequence extends noc_base_virtual_sequence;

  `uvm_object_utils(multiple_dev_write_sequence)

  bit [3:0] dev_channel;

  function new (string name = "multiple_dev_write_sequence");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info(get_type_name(), "\n=====================STARTED=====================", UVM_LOW)

    repeat(2)begin
      dev_channel = $urandom_range(1,15);    
      `uvm_info("DEV_CHANNEL", $sformatf("[----%0d:%0d:%0d:%0d-----]",dev_channel[0],dev_channel[1],dev_channel[2],dev_channel[3]), UVM_LOW)
      fork
        begin
        if(dev_channel[0]==1)
          rand_seq(1);
        end
        begin
        if(dev_channel[1]==1)
          rand_seq(2);
        end
        begin
        if(dev_channel[2]==1)
          rand_seq(3);
        end
        begin
        if(dev_channel[3]==1)
          rand_seq(4);
        end        
      join
    end

    `uvm_info(get_type_name(), "\n=====================FINISHED=====================", UVM_LOW)
  endtask

  task rand_seq(int dev_channel);
    randcase
    80:begin : short_single_write
      `uvm_do_on_with(dev_single_write_seq, 
                      p_sequencer.dev_sqrs[dev_channel-1],
                      { src_id == dev_channel;
                      })
    end
    20:begin
      `uvm_do_on_with(dev_burst_write_seq, 
                      p_sequencer.dev_sqrs[dev_channel-1],
                      { src_id == dev_channel;
                      })
    end
    endcase 
      
  endtask

endclass

class multiple_dev_write_test extends noc_base_test;
  `uvm_component_utils(multiple_dev_write_test)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_top_virtual_sequence();
    multiple_dev_write_sequence seq = new();
    seq.start(env.virt_sqr);
  endtask
endclass: multiple_dev_write_test
