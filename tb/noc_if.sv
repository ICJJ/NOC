
`ifndef host_if_SV
`define host_if_SV
interface host_if(input clk, input reset);

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  logic                 w_host_noc_valid;
  logic                 w_host_noc_ready;
  logic     [31:0]      w_host_noc_payload;

  logic                 r_host_noc_valid;
  logic                 r_host_noc_ready;
  logic                 r_host_noc_last;
  logic     [31:0]      r_host_noc_fragment;

  clocking cb_w_host @(posedge clk);
    default input #1ps output #1ps;
    output    w_host_noc_valid,w_host_noc_payload;
    input     w_host_noc_ready;
  endclocking

  clocking cb_w_host_mon @(posedge clk);
    default input #1ps output #1ps;
    input     w_host_noc_valid,w_host_noc_payload,w_host_noc_ready;
  endclocking

  clocking cb_r_host @(posedge clk);
    default input #1ps output #1ps;
    input     r_host_noc_valid,r_host_noc_last,r_host_noc_fragment;
    output    r_host_noc_ready;
  endclocking

  clocking cb_r_host_mon @(posedge clk);
    default input #1ps output #1ps;
    input     r_host_noc_valid,r_host_noc_last,r_host_noc_fragment,r_host_noc_ready;
  endclocking

  task wait_clk(int n);
    repeat(n) @(posedge clk);
  endtask

  task wait_reset_invalid();
    wait(reset === 0);
  endtask



endinterface

interface dev_if(input clk, input reset);

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  logic                 r_device_valid;
  logic                 r_device_ready;
  logic                 r_device_last;
  logic     [31:0]      r_device_fragment;

  logic                 w_device_valid;
  logic                 w_device_ready;
  logic                 w_device_last;
  logic     [31:0]      w_device_fragment;

  clocking cb_r_device @(posedge clk);
    default input #1ps output #1ps;
    input r_device_valid,r_device_last,r_device_fragment;
    output r_device_ready;
  endclocking

  clocking cb_r_device_mon @(posedge clk);
  default input #1ps output #1ps;
  input r_device_valid,r_device_last,r_device_fragment,r_device_ready;
  endclocking

  clocking cb_w_device @(posedge clk);
    default input #1ps output #1ps;
    output w_device_valid,w_device_last,w_device_fragment,w_device_ready;
  endclocking

  clocking cb_w_device_mon @(posedge clk);
  default input #1ps output #1ps;

  input  w_device_ready,w_device_valid,w_device_last,w_device_fragment;
endclocking


  task wait_clk(int n);
    repeat(n) @(posedge clk);
  endtask

  task wait_reset_invalid();
      wait(reset === 0);
  endtask

endinterface

`endif // host_if_SV
