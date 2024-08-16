`ifndef NOC_PKG_SV
`define NOC_PKG_SV

package noc_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "noc_transaction.sv"

`include "host_sequencer.sv"
`include "host_monitor.sv"
`include "host_driver.sv"
`include "host_agent.sv"

`include "dev_sequencer.sv"
`include "dev_monitor.sv"
`include "dev_driver.sv"
`include "dev_agent.sv"

`include "host_write_seq_lib.sv"
`include "dev_write_seq_lib.sv"

endpackage

   
`endif //  `ifndef NOC_PKG_SV