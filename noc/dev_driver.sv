
`ifndef DEV_DRIVER_SVH
`define DEV_DRIVER_SVH

class dev_driver extends uvm_driver #(noc_transaction);

  `uvm_component_utils(dev_driver)

  virtual dev_if vif;
    uvm_event  get_dev_event;

  function new (string name="dev_driver", uvm_component parent);
    super.new(name, parent);
  endfunction : new


    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      get_dev_event = uvm_event_pool::get_global("dev_event"); 
    endfunction
  task run();
     fork
       get_and_drive();
       reset_listener();
       do_read_ready();
     join_none
  endtask : run

  task get_and_drive();
    forever begin
      vif.wait_reset_invalid();

      seq_item_port.get_next_item(req);
      `uvm_info(get_type_name(), "sequencer got next item", UVM_HIGH)
      
      `uvm_info(get_type_name(), req.sprint(), UVM_HIGH)
      drive_transfer(req);
      void'($cast(rsp, req.clone()));
      
      rsp.set_sequence_id(req.get_sequence_id());
      rsp.set_transaction_id(req.get_transaction_id());
      seq_item_port.item_done(rsp);
      `uvm_info(get_type_name(), "sequencer item_done_triggered", UVM_HIGH)
    end
  endtask : get_and_drive

  task drive_transfer (noc_transaction t);
    `uvm_info(get_type_name(), "drive_transfer", UVM_HIGH)
      this.do_write(t);
  endtask : drive_transfer

  task do_write(noc_transaction t);
    bit[31:0] noc_head;
    `uvm_info(get_type_name(), "do_write dev...", UVM_HIGH)

    //head
    @(vif.cb_w_device);
    vif.cb_w_device.w_device_valid <= 1;
    vif.cb_w_device.w_device_last <= 0;
    gen_noc_header(t,noc_head);
    vif.cb_w_device.w_device_fragment <= noc_head;
    // #10ps;//avoid sample previous 
    // while(vif.w_device_ready === 0) @(vif.cb_w_device);//wait(vif.w_device_ready); avoid pulse 
    // #10ps;//avoid write_ck

    //payload
    for(int i=0;i<$size(t.data);i++)begin
      @(vif.cb_w_device iff vif.cb_w_device_mon.w_device_ready === 1); 

      if(i!=($size(t.data)-1))begin
        vif.cb_w_device.w_device_valid <= 1;
        vif.cb_w_device.w_device_fragment <= t.data[i];

        if($urandom_range(0,1)) begin :random_valid
          @(vif.cb_w_device); 
          vif.cb_w_device.w_device_valid <= 0;
        end
      end
      else begin : last_payload
        vif.cb_w_device.w_device_valid <= 1;
        vif.cb_w_device.w_device_fragment <= t.data[i];
        vif.cb_w_device.w_device_last <= 1;
      end
      
    end

    //clear
    @(vif.cb_w_device);
    vif.cb_w_device.w_device_valid <= 0;
    vif.cb_w_device.w_device_last <= 0;
    vif.cb_w_device.w_device_fragment <= 0;
    //idle
    `uvm_info(get_type_name(), "wait dev scb done", UVM_HIGH)
    get_dev_event.wait_trigger();
    repeat(t.idle_cycles) this.do_idle();

  endtask: do_write

  function void gen_noc_header(noc_transaction t,ref bit [31:0] noc_head);
    noc_head = {t.data_type,t.data_length,t.dst_id,t.src_id};
  endfunction

  task do_idle();
    `uvm_info(get_type_name(), "do_idle ...", UVM_HIGH)
    @(vif.cb_w_device);
    vif.cb_w_device.w_device_valid <= 0;
    vif.cb_w_device.w_device_last <= 0;
    vif.cb_w_device.w_device_fragment <= 0;
  endtask:do_idle



  task reset_listener();
    `uvm_info(get_type_name(), "reset_listener ...", UVM_HIGH)
    fork
      forever begin
        @(posedge vif.reset); // ASYNC reset
        vif.cb_w_device.w_device_valid <= 0;
        vif.cb_w_device.w_device_last <= 0;
        vif.cb_w_device.w_device_fragment <= 0;
      end
    join_none
  endtask

  task do_read_ready();
    `uvm_info(get_type_name(), "do_read_ready ...", UVM_HIGH)

    fork
    forever begin :random_dev_ready
          vif.r_device_ready <= 1;
          @(negedge vif.r_device_last);
          vif.r_device_ready <= 0;
          vif.wait_clk($urandom_range(10,10000));
    end
    join_none
  endtask


endclass : dev_driver

`endif

