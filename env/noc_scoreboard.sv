  `uvm_blocking_put_imp_decl(_slv_dev1)
  `uvm_blocking_put_imp_decl(_slv_dev2)
  `uvm_blocking_put_imp_decl(_slv_dev3)
  `uvm_blocking_put_imp_decl(_slv_dev4)
  `uvm_blocking_put_imp_decl(_mst_host)

  `uvm_blocking_put_imp_decl(_mst_dev1)
  `uvm_blocking_put_imp_decl(_mst_dev2)
  `uvm_blocking_put_imp_decl(_mst_dev3)
  `uvm_blocking_put_imp_decl(_mst_dev4)
  `uvm_blocking_put_imp_decl(_slv_host)

  //`uvm_analysis_port_decl(_mst_dev1)
  //`uvm_analysis_port_decl(_mst_dev2)
  //`uvm_analysis_port_decl(_mst_dev3)
  //`uvm_analysis_port_decl(_mst_dev4)
  //`uvm_analysis_port_decl(_mst_host)

  class noc_scoreboard extends uvm_scoreboard;
    local int err_count;
    local int total_count;
    local int mst_dev_count[4];
    local int slv_dev_count[4];
    local int mst_host_count;
    local int slv_host_count;
    local virtual dev_if dev_vifs[4]; 
    local virtual host_if host_vif; 
    uvm_event set_dev_event;
    uvm_event set_hst_event;

    uvm_blocking_put_imp_slv_dev1 #(noc_transaction, noc_scoreboard)    slv_dev1_bp_imp;
    uvm_blocking_put_imp_slv_dev2 #(noc_transaction, noc_scoreboard)    slv_dev2_bp_imp;
    uvm_blocking_put_imp_slv_dev3 #(noc_transaction, noc_scoreboard)    slv_dev3_bp_imp;
    uvm_blocking_put_imp_slv_dev4 #(noc_transaction, noc_scoreboard)    slv_dev4_bp_imp;
    uvm_blocking_put_imp_mst_host #(noc_transaction, noc_scoreboard)    mst_host_bp_imp;

    uvm_blocking_put_imp_mst_dev1 #(noc_transaction, noc_scoreboard)    mst_dev1_bp_imp;
    uvm_blocking_put_imp_mst_dev2 #(noc_transaction, noc_scoreboard)    mst_dev2_bp_imp;
    uvm_blocking_put_imp_mst_dev3 #(noc_transaction, noc_scoreboard)    mst_dev3_bp_imp;
    uvm_blocking_put_imp_mst_dev4 #(noc_transaction, noc_scoreboard)    mst_dev4_bp_imp;
    uvm_blocking_put_imp_slv_host #(noc_transaction, noc_scoreboard)    slv_host_bp_imp;

    uvm_blocking_put_port #(noc_transaction)    mst_device_bp_port;
    uvm_blocking_put_port #(noc_transaction)    mst_host_bp_port;

    mailbox #(noc_transaction) slv_dev_mbs[4];
    mailbox #(noc_transaction) mst_dev_mbs[4];
    mailbox #(noc_transaction)  mst_host_mb;
    mailbox #(noc_transaction)  slv_host_mb;

    `uvm_component_utils(noc_scoreboard)

    function new (string name = "noc_scoreboard", uvm_component parent);
      super.new(name, parent);
      this.err_count = 0;
      this.total_count = 0;
      foreach(this.mst_dev_count[i]) this.mst_dev_count[i] = 0;
      foreach(this.slv_dev_count[i]) this.slv_dev_count[i] = 0;
      this.mst_host_count = 0;
      this.slv_host_count = 0;

      slv_dev1_bp_imp   = new("slv_dev1_bp_imp", this);
      slv_dev2_bp_imp   = new("slv_dev2_bp_imp", this);
      slv_dev3_bp_imp   = new("slv_dev3_bp_imp", this);
      slv_dev4_bp_imp   = new("slv_dev4_bp_imp", this);  
      mst_host_bp_imp   = new("mst_host_bp_imp", this);   

      mst_dev1_bp_imp   = new("mst_dev1_bp_imp", this);
      mst_dev2_bp_imp   = new("mst_dev2_bp_imp", this);
      mst_dev3_bp_imp   = new("mst_dev3_bp_imp", this);
      mst_dev4_bp_imp   = new("mst_dev4_bp_imp", this);  
      slv_host_bp_imp   = new("slv_host_bp_imp", this); 

      mst_device_bp_port   = new("mst_device_bp_port", this); 
      mst_host_bp_port   = new("mst_host_bp_port", this); 

    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      if(!uvm_config_db#(virtual host_if)::get(this,"","host_vif", host_vif)) begin
        `uvm_fatal("GETVIF","cannot get vif handle from config DB")
      end
      foreach(dev_vifs[i])begin
        if(!uvm_config_db#(virtual dev_if)::get(this,"",$sformatf("dev_vifs[%0d]", i), dev_vifs[i])) begin
          `uvm_fatal("GETVIF","cannot get vif handle from config DB")
        end
      end

      //mailbox
      foreach(this.slv_dev_mbs[i]) this.slv_dev_mbs[i] = new();
      foreach(this.mst_dev_mbs[i]) this.mst_dev_mbs[i] = new();
      this.mst_host_mb = new();
      this.slv_host_mb = new();
      set_hst_event = uvm_event_pool::get_global("hst_event"); 
      set_dev_event = uvm_event_pool::get_global("dev_event"); 
    endfunction

    function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
      fork
        this.do_compare_host_write_data();
        this.do_compare_device_write_data();
      join
    endtask

    task do_compare_host_write_data();
      noc_transaction expt, mont;
      bit cmp;
      string s;
      forever begin
        //compare
        this.mst_host_mb.get(expt);
        this.slv_dev_mbs[expt.dst_id-1].get(mont);
        cmp = mont.compare(expt);   

        //baordcast
        mst_host_bp_port.put(expt);

        //collect
        this.total_count++;
        this.slv_dev_count[expt.dst_id-1]++;
        if(cmp == 0) begin
          this.err_count++;
          `uvm_error("HST_W_CMPERR", $sformatf("%0dth times comparing but failed! ", this.total_count))
          report_comapred_packted(mont,expt);
        end
        else begin
          `uvm_info("HST_W_CMPSUC",$sformatf("%0dth times comparing and succeeded! ", this.total_count), UVM_LOW)
        end
        `uvm_info(get_type_name(), "set hst scb done", UVM_HIGH)
        set_hst_event.trigger();
      end
    endtask

    task do_compare_device_write_data();
      noc_transaction expt, mont;
      bit cmp;
      forever begin
        //compare
        this.slv_host_mb.get(expt);
        $display("get mst_dev_mbs [%d]",expt.src_id-1);
        this.mst_dev_mbs[expt.src_id-1].get(mont);
        cmp = mont.compare(expt);   

        //broadcast
        mst_device_bp_port.put(mont);

        //collect
        this.total_count++;
        this.slv_host_count++;
        if(cmp == 0) begin
          this.err_count++;
          `uvm_error("DEV_W_CMPERR", $sformatf("%0dth times comparing but failed! ", this.total_count))
          report_comapred_packted(mont,expt);
        end
        else begin
          `uvm_info("DEV_W_CMPSUC",$sformatf("%0dth times comparing and succeeded! ", this.total_count), UVM_LOW)
        end
        `uvm_info(get_type_name(), "set dev scb done", UVM_HIGH)
        set_dev_event.trigger();
      end
    endtask


    function void report_comapred_packted(noc_transaction m, noc_transaction e);
      string s;
      s = $sformatf("\n=======================================\n");
      s = {s, $sformatf("  monitored packet: \n")};
      s = {s, $sformatf("src_id = %0d: \n", m.src_id)};
      s = {s, $sformatf("dst_id = %0d: \n", m.dst_id)};
      s = {s, $sformatf("data_length = %0d: \n", m.data_length)};
      s = {s, $sformatf("data_type = %0h: \n", m.data_type)};
      s = {s, $sformatf("data[%0d] = %8x \n", 0, m.data[0])};
      s = {s, $sformatf("... \n")};
      s = {s, $sformatf("data[%0d] = %8x \n", m.data.size()-1, m.data[m.data.size()-1])};
      s = {s, $sformatf("\n")};
      s = {s, $sformatf("  expected packet: \n")};
      s = {s, $sformatf("src_id = %0d: \n", e.src_id)};
      s = {s, $sformatf("dst_id = %0d: \n", e.dst_id)};
      s = {s, $sformatf("data_length = %0d: \n", e.data_length)};
      s = {s, $sformatf("data_type = %0h: \n", e.data_type)};
      s = {s, $sformatf("data[%0d] = %8x \n", 0, e.data[0])};
      s = {s, $sformatf("... \n")};
      s = {s, $sformatf("data[%0d] = %8x \n", e.data.size()-1, e.data[e.data.size()-1])};
      s = {s, $sformatf("=======================================\n")};
      `uvm_info(get_type_name(), s, UVM_HIGH)
    endfunction

    function void report_phase(uvm_phase phase);
      string s;
      super.report_phase(phase);
      s = "\n---------------------------------------------------------------\n";
      s = {s, "CHECKER SUMMARY \n"}; 
      s = {s, $sformatf("total comparison count: %0d \n", this.total_count)}; 
      foreach(this.slv_dev_count[i]) s = {s, $sformatf(" dev%0d comparison count: %0d \n", i+1, this.slv_dev_count[i])};
      s = {s, $sformatf(" host comparison count: %0d \n", this.slv_host_count)};
      s = {s, $sformatf("total error count: %0d \n", this.err_count)}; 
      
      foreach(this.slv_dev_mbs[i]) begin
        if(this.slv_dev_mbs[i].num() != 0)
          s = {s, $sformatf("WARNING:: slv_dev_mbs[%0d] is not empty! size = %0d \n", i, this.slv_dev_mbs[i].num())}; 
      end
      foreach(this.mst_dev_mbs[i]) begin
        if(this.mst_dev_mbs[i].num() != 0)
          s = {s, $sformatf("WARNING:: mst_dev_mbs[%0d] is not empty! size = %0d \n", i, this.mst_dev_mbs[i].num())}; 
      end
      if(this.mst_host_mb.num() != 0)
          s = {s, $sformatf("WARNING:: mst_host_mb is not empty! size = %0d \n", this.mst_host_mb.num())}; 
      if(this.slv_host_mb.num() != 0)
          s = {s, $sformatf("WARNING:: slv_host_mb is not empty! size = %0d \n", this.slv_host_mb.num())};       
      s = {s, "---------------------------------------------------------------\n"};
      `uvm_info(get_type_name(), s, UVM_LOW)
    endfunction

    task put_slv_dev1(noc_transaction t);
      slv_dev_mbs[0].put(t);
    endtask
    task put_slv_dev2(noc_transaction t);
      slv_dev_mbs[1].put(t);
    endtask
    task put_slv_dev3(noc_transaction t);
      slv_dev_mbs[2].put(t);
    endtask
    task put_slv_dev4(noc_transaction t);
      slv_dev_mbs[3].put(t);
    endtask
    task put_mst_host(noc_transaction t);
      mst_host_mb.put(t);
    endtask

    task put_mst_dev1(noc_transaction t);
      mst_dev_mbs[0].put(t);
    endtask
    task put_mst_dev2(noc_transaction t);
      mst_dev_mbs[1].put(t);
    endtask
    task put_mst_dev3(noc_transaction t);
      mst_dev_mbs[2].put(t);
    endtask
    task put_mst_dev4(noc_transaction t);
      mst_dev_mbs[3].put(t);
    endtask
    task put_slv_host(noc_transaction t);
      slv_host_mb.put(t);
    endtask

  endclass: noc_scoreboard
