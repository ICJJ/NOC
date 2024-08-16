`ifndef NOC_TEST_PKG_SV
`define NOC_TEST_PKG_SV

package noc_test_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"


import noc_pkg::*;
//env
`include "noc_scoreboard.sv"
`include "noc_coverage.sv"
`include "noc_virtual_sequencer.sv"
`include "noc_env.sv"

//seq
`include "noc_base_virtual_sequence.sv"
`include "noc_base_test.sv"

`include "host_write_seq_test.sv"
`include "single_dev_write_seq_test.sv"
`include "multiple_dev_write_seq_test.sv"
`include "full_duplex_seq_test.sv"
`include "fifo_full_seq_test.sv"

endpackage

   
`endif //  `ifndef NOC_TEST_PKG_SV
