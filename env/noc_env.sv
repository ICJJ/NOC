
class noc_env extends uvm_env;
  host_agent host_agt;
  dev_agent dev_agts[4];
  noc_scoreboard noc_scb;
  noc_coverage noc_cov;
  noc_virtual_sequencer virt_sqr;

  virtual host_if host_vif;
  virtual dev_if  dev1_vif;
  virtual dev_if  dev2_vif;
  virtual dev_if  dev3_vif;
  virtual dev_if  dev4_vif;


  `uvm_component_utils(noc_env)
  
  function new(string name = "noc_env", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    //get and set interface
    if(!uvm_config_db#(virtual host_if)::get(this,"","host_vif", host_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev1_vif", dev1_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev2_vif", dev2_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev3_vif", dev3_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    if(!uvm_config_db#(virtual dev_if)::get(this,"","dev4_vif", dev4_vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    uvm_config_db#(virtual host_if)::set(this, "host_agt*", "vif", host_vif);
    uvm_config_db#(virtual dev_if)::set(this, "dev_agts[0]*", "vif", dev1_vif);
    uvm_config_db#(virtual dev_if)::set(this, "dev_agts[1]*", "vif", dev2_vif);
    uvm_config_db#(virtual dev_if)::set(this, "dev_agts[2]*", "vif", dev3_vif);
    uvm_config_db#(virtual dev_if)::set(this, "dev_agts[3]*", "vif", dev4_vif);

    uvm_config_db#(virtual host_if)::set(this, "virt_sqr*", "host_vif", host_vif);
    uvm_config_db#(virtual dev_if)::set(this, "virt_sqr*", "dev1_vif", dev1_vif);
    uvm_config_db#(virtual dev_if)::set(this, "virt_sqr*", "dev2_vif", dev2_vif);
    uvm_config_db#(virtual dev_if)::set(this, "virt_sqr*", "dev3_vif", dev3_vif);
    uvm_config_db#(virtual dev_if)::set(this, "virt_sqr*", "dev4_vif", dev4_vif);

    uvm_config_db#(virtual host_if)::set(this, "noc_scb*", "host_vif", host_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_scb*", "dev_vifs[0]", dev1_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_scb*", "dev_vifs[1]", dev2_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_scb*", "dev_vifs[2]", dev3_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_scb*", "dev_vifs[3]", dev4_vif);

    uvm_config_db#(virtual host_if)::set(this, "noc_cov*", "host_vif", host_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_cov*", "dev_vifs[0]", dev1_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_cov*", "dev_vifs[1]", dev2_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_cov*", "dev_vifs[2]", dev3_vif);
    uvm_config_db#(virtual dev_if)::set(this, "noc_cov*", "dev_vifs[3]", dev4_vif);

    //create and register
    host_agt = host_agent::type_id::create("host_agt", this);
    foreach(dev_agts[i]) begin
      this.dev_agts[i] = dev_agent::type_id::create($sformatf("dev_agts[%0d]",i), this);
    end    
    noc_scb = noc_scoreboard::type_id::create("noc_scb", this);
    noc_cov = noc_coverage::type_id::create("noc_cov", this);
    virt_sqr = noc_virtual_sequencer::type_id::create("virt_sqr", this);

  endfunction

	function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    //sequencer
		virt_sqr.host_sqr = host_agt.sequencer;
    virt_sqr.dev_sqrs[0]= dev_agts[0].sequencer;
    virt_sqr.dev_sqrs[1]= dev_agts[1].sequencer;
    virt_sqr.dev_sqrs[2]= dev_agts[2].sequencer;
    virt_sqr.dev_sqrs[3]= dev_agts[3].sequencer;

    //TLM
    dev_agts[0].slv_monitor.mon_bp_port.connect(noc_scb.slv_dev1_bp_imp);
    dev_agts[1].slv_monitor.mon_bp_port.connect(noc_scb.slv_dev2_bp_imp);
    dev_agts[2].slv_monitor.mon_bp_port.connect(noc_scb.slv_dev3_bp_imp);
    dev_agts[3].slv_monitor.mon_bp_port.connect(noc_scb.slv_dev4_bp_imp);
    host_agt.mst_monitor.mon_bp_port.connect(noc_scb.mst_host_bp_imp);
    dev_agts[0].mst_monitor.mon_bp_port.connect(noc_scb.mst_dev1_bp_imp);
    dev_agts[1].mst_monitor.mon_bp_port.connect(noc_scb.mst_dev2_bp_imp);
    dev_agts[2].mst_monitor.mon_bp_port.connect(noc_scb.mst_dev3_bp_imp);
    dev_agts[3].mst_monitor.mon_bp_port.connect(noc_scb.mst_dev4_bp_imp);
    host_agt.slv_monitor.mon_bp_port.connect(noc_scb.slv_host_bp_imp);

    noc_scb.mst_device_bp_port.connect(noc_cov.mst_device_bp_imp);
    noc_scb.mst_host_bp_port.connect(noc_cov.mst_host_bp_imp);
	endfunction

endclass
