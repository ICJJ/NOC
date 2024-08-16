// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : HS_QV19P_ZYNQ_ZpciFPGASceMiLayer
// Git hash  : e91bbf27fe5abb5de41455658278d5a9e961babf

`timescale 1ns/1ps 

module HS_QV19P_ZYNQ_ZpciFPGASceMiLayer (
  input               io_i_in_noc_pkt_valid,
  output              io_i_in_noc_pkt_ready,
  input      [31:0]   io_i_in_noc_pkt_payload,
  output              io_o_in_noc_demux_0_valid,
  input               io_o_in_noc_demux_0_ready,
  output              io_o_in_noc_demux_0_payload_last,
  output     [31:0]   io_o_in_noc_demux_0_payload_fragment,
  output              io_o_in_noc_demux_1_valid,
  input               io_o_in_noc_demux_1_ready,
  output              io_o_in_noc_demux_1_payload_last,
  output     [31:0]   io_o_in_noc_demux_1_payload_fragment,
  output              io_o_in_noc_demux_2_valid,
  input               io_o_in_noc_demux_2_ready,
  output              io_o_in_noc_demux_2_payload_last,
  output     [31:0]   io_o_in_noc_demux_2_payload_fragment,
  output              io_o_in_noc_demux_3_valid,
  input               io_o_in_noc_demux_3_ready,
  output              io_o_in_noc_demux_3_payload_last,
  output     [31:0]   io_o_in_noc_demux_3_payload_fragment,
  input               io_i_out_noc_mux_0_valid,
  output              io_i_out_noc_mux_0_ready,
  input               io_i_out_noc_mux_0_payload_last,
  input      [31:0]   io_i_out_noc_mux_0_payload_fragment,
  input               io_i_out_noc_mux_1_valid,
  output              io_i_out_noc_mux_1_ready,
  input               io_i_out_noc_mux_1_payload_last,
  input      [31:0]   io_i_out_noc_mux_1_payload_fragment,
  input               io_i_out_noc_mux_2_valid,
  output              io_i_out_noc_mux_2_ready,
  input               io_i_out_noc_mux_2_payload_last,
  input      [31:0]   io_i_out_noc_mux_2_payload_fragment,
  input               io_i_out_noc_mux_3_valid,
  output              io_i_out_noc_mux_3_ready,
  input               io_i_out_noc_mux_3_payload_last,
  input      [31:0]   io_i_out_noc_mux_3_payload_fragment,
  output              io_o_out_noc_pkt_valid,
  input               io_o_out_noc_pkt_ready,
  output              io_o_out_noc_pkt_payload_last,
  output     [31:0]   io_o_out_noc_pkt_payload_fragment,
  input               clk,
  input               reset
);

  wire                hs_noc_router_i_in_noc_pkt_ready;
  wire                hs_noc_router_o_in_noc_demux_0_valid;
  wire                hs_noc_router_o_in_noc_demux_0_payload_last;
  wire       [31:0]   hs_noc_router_o_in_noc_demux_0_payload_fragment;
  wire                hs_noc_router_o_in_noc_demux_1_valid;
  wire                hs_noc_router_o_in_noc_demux_1_payload_last;
  wire       [31:0]   hs_noc_router_o_in_noc_demux_1_payload_fragment;
  wire                hs_noc_router_o_in_noc_demux_2_valid;
  wire                hs_noc_router_o_in_noc_demux_2_payload_last;
  wire       [31:0]   hs_noc_router_o_in_noc_demux_2_payload_fragment;
  wire                hs_noc_router_o_in_noc_demux_3_valid;
  wire                hs_noc_router_o_in_noc_demux_3_payload_last;
  wire       [31:0]   hs_noc_router_o_in_noc_demux_3_payload_fragment;
  wire                hs_noc_router_o_in_noc_demux_4_valid;
  wire                hs_noc_router_o_in_noc_demux_4_payload_last;
  wire       [31:0]   hs_noc_router_o_in_noc_demux_4_payload_fragment;
  wire                hs_noc_router_i_out_noc_mux_0_ready;
  wire                hs_noc_router_i_out_noc_mux_1_ready;
  wire                hs_noc_router_i_out_noc_mux_2_ready;
  wire                hs_noc_router_i_out_noc_mux_3_ready;
  wire                hs_noc_router_i_out_noc_mux_4_ready;
  wire                hs_noc_router_o_out_noc_pkt_valid;
  wire                hs_noc_router_o_out_noc_pkt_payload_last;
  wire       [31:0]   hs_noc_router_o_out_noc_pkt_payload_fragment;

  HS_QV19P_ZYNQ_NoCRouter2 hs_noc_router (
    .i_in_noc_pkt_valid                   (io_i_in_noc_pkt_valid                                  ), //i
    .i_in_noc_pkt_ready                   (hs_noc_router_i_in_noc_pkt_ready                       ), //o
    .i_in_noc_pkt_payload                 (io_i_in_noc_pkt_payload[31:0]                          ), //i
    .o_in_noc_demux_0_valid               (hs_noc_router_o_in_noc_demux_0_valid                   ), //o
    .o_in_noc_demux_0_ready               (1'b0                                                   ), //i
    .o_in_noc_demux_0_payload_last        (hs_noc_router_o_in_noc_demux_0_payload_last            ), //o
    .o_in_noc_demux_0_payload_fragment    (hs_noc_router_o_in_noc_demux_0_payload_fragment[31:0]  ), //o
    .o_in_noc_demux_1_valid               (hs_noc_router_o_in_noc_demux_1_valid                   ), //o
    .o_in_noc_demux_1_ready               (io_o_in_noc_demux_0_ready                              ), //i
    .o_in_noc_demux_1_payload_last        (hs_noc_router_o_in_noc_demux_1_payload_last            ), //o
    .o_in_noc_demux_1_payload_fragment    (hs_noc_router_o_in_noc_demux_1_payload_fragment[31:0]  ), //o
    .o_in_noc_demux_2_valid               (hs_noc_router_o_in_noc_demux_2_valid                   ), //o
    .o_in_noc_demux_2_ready               (io_o_in_noc_demux_1_ready                              ), //i
    .o_in_noc_demux_2_payload_last        (hs_noc_router_o_in_noc_demux_2_payload_last            ), //o
    .o_in_noc_demux_2_payload_fragment    (hs_noc_router_o_in_noc_demux_2_payload_fragment[31:0]  ), //o
    .o_in_noc_demux_3_valid               (hs_noc_router_o_in_noc_demux_3_valid                   ), //o
    .o_in_noc_demux_3_ready               (io_o_in_noc_demux_2_ready                              ), //i
    .o_in_noc_demux_3_payload_last        (hs_noc_router_o_in_noc_demux_3_payload_last            ), //o
    .o_in_noc_demux_3_payload_fragment    (hs_noc_router_o_in_noc_demux_3_payload_fragment[31:0]  ), //o
    .o_in_noc_demux_4_valid               (hs_noc_router_o_in_noc_demux_4_valid                   ), //o
    .o_in_noc_demux_4_ready               (io_o_in_noc_demux_3_ready                              ), //i
    .o_in_noc_demux_4_payload_last        (hs_noc_router_o_in_noc_demux_4_payload_last            ), //o
    .o_in_noc_demux_4_payload_fragment    (hs_noc_router_o_in_noc_demux_4_payload_fragment[31:0]  ), //o
    .i_out_noc_mux_0_valid                (1'b0                                                   ), //i
    .i_out_noc_mux_0_ready                (hs_noc_router_i_out_noc_mux_0_ready                    ), //o
    .i_out_noc_mux_0_payload_last         (1'b0                                                   ), //i
    .i_out_noc_mux_0_payload_fragment     (32'h0                                                  ), //i
    .i_out_noc_mux_1_valid                (io_i_out_noc_mux_0_valid                               ), //i
    .i_out_noc_mux_1_ready                (hs_noc_router_i_out_noc_mux_1_ready                    ), //o
    .i_out_noc_mux_1_payload_last         (io_i_out_noc_mux_0_payload_last                        ), //i
    .i_out_noc_mux_1_payload_fragment     (io_i_out_noc_mux_0_payload_fragment[31:0]              ), //i
    .i_out_noc_mux_2_valid                (io_i_out_noc_mux_1_valid                               ), //i
    .i_out_noc_mux_2_ready                (hs_noc_router_i_out_noc_mux_2_ready                    ), //o
    .i_out_noc_mux_2_payload_last         (io_i_out_noc_mux_1_payload_last                        ), //i
    .i_out_noc_mux_2_payload_fragment     (io_i_out_noc_mux_1_payload_fragment[31:0]              ), //i
    .i_out_noc_mux_3_valid                (io_i_out_noc_mux_2_valid                               ), //i
    .i_out_noc_mux_3_ready                (hs_noc_router_i_out_noc_mux_3_ready                    ), //o
    .i_out_noc_mux_3_payload_last         (io_i_out_noc_mux_2_payload_last                        ), //i
    .i_out_noc_mux_3_payload_fragment     (io_i_out_noc_mux_2_payload_fragment[31:0]              ), //i
    .i_out_noc_mux_4_valid                (io_i_out_noc_mux_3_valid                               ), //i
    .i_out_noc_mux_4_ready                (hs_noc_router_i_out_noc_mux_4_ready                    ), //o
    .i_out_noc_mux_4_payload_last         (io_i_out_noc_mux_3_payload_last                        ), //i
    .i_out_noc_mux_4_payload_fragment     (io_i_out_noc_mux_3_payload_fragment[31:0]              ), //i
    .o_out_noc_pkt_valid                  (hs_noc_router_o_out_noc_pkt_valid                      ), //o
    .o_out_noc_pkt_ready                  (io_o_out_noc_pkt_ready                                 ), //i
    .o_out_noc_pkt_payload_last           (hs_noc_router_o_out_noc_pkt_payload_last               ), //o
    .o_out_noc_pkt_payload_fragment       (hs_noc_router_o_out_noc_pkt_payload_fragment[31:0]     ), //o
    .clk                                  (clk                                                    ), //i
    .reset                                (reset                                                  )  //i
  );
  assign io_i_in_noc_pkt_ready = hs_noc_router_i_in_noc_pkt_ready;
  assign io_o_out_noc_pkt_valid = hs_noc_router_o_out_noc_pkt_valid;
  assign io_o_out_noc_pkt_payload_last = hs_noc_router_o_out_noc_pkt_payload_last;
  assign io_o_out_noc_pkt_payload_fragment = hs_noc_router_o_out_noc_pkt_payload_fragment;
  assign io_o_in_noc_demux_0_valid = hs_noc_router_o_in_noc_demux_1_valid;
  assign io_o_in_noc_demux_0_payload_last = hs_noc_router_o_in_noc_demux_1_payload_last;
  assign io_o_in_noc_demux_0_payload_fragment = hs_noc_router_o_in_noc_demux_1_payload_fragment;
  assign io_i_out_noc_mux_0_ready = hs_noc_router_i_out_noc_mux_1_ready;
  assign io_o_in_noc_demux_1_valid = hs_noc_router_o_in_noc_demux_2_valid;
  assign io_o_in_noc_demux_1_payload_last = hs_noc_router_o_in_noc_demux_2_payload_last;
  assign io_o_in_noc_demux_1_payload_fragment = hs_noc_router_o_in_noc_demux_2_payload_fragment;
  assign io_i_out_noc_mux_1_ready = hs_noc_router_i_out_noc_mux_2_ready;
  assign io_o_in_noc_demux_2_valid = hs_noc_router_o_in_noc_demux_3_valid;
  assign io_o_in_noc_demux_2_payload_last = hs_noc_router_o_in_noc_demux_3_payload_last;
  assign io_o_in_noc_demux_2_payload_fragment = hs_noc_router_o_in_noc_demux_3_payload_fragment;
  assign io_i_out_noc_mux_2_ready = hs_noc_router_i_out_noc_mux_3_ready;
  assign io_o_in_noc_demux_3_valid = hs_noc_router_o_in_noc_demux_4_valid;
  assign io_o_in_noc_demux_3_payload_last = hs_noc_router_o_in_noc_demux_4_payload_last;
  assign io_o_in_noc_demux_3_payload_fragment = hs_noc_router_o_in_noc_demux_4_payload_fragment;
  assign io_i_out_noc_mux_3_ready = hs_noc_router_i_out_noc_mux_4_ready;

endmodule

module HS_QV19P_ZYNQ_NoCRouter2 (
  input               i_in_noc_pkt_valid,
  output              i_in_noc_pkt_ready,
  input      [31:0]   i_in_noc_pkt_payload,
  output              o_in_noc_demux_0_valid,
  input               o_in_noc_demux_0_ready,
  output              o_in_noc_demux_0_payload_last,
  output     [31:0]   o_in_noc_demux_0_payload_fragment,
  output              o_in_noc_demux_1_valid,
  input               o_in_noc_demux_1_ready,
  output              o_in_noc_demux_1_payload_last,
  output     [31:0]   o_in_noc_demux_1_payload_fragment,
  output              o_in_noc_demux_2_valid,
  input               o_in_noc_demux_2_ready,
  output              o_in_noc_demux_2_payload_last,
  output     [31:0]   o_in_noc_demux_2_payload_fragment,
  output              o_in_noc_demux_3_valid,
  input               o_in_noc_demux_3_ready,
  output              o_in_noc_demux_3_payload_last,
  output     [31:0]   o_in_noc_demux_3_payload_fragment,
  output              o_in_noc_demux_4_valid,
  input               o_in_noc_demux_4_ready,
  output              o_in_noc_demux_4_payload_last,
  output     [31:0]   o_in_noc_demux_4_payload_fragment,
  input               i_out_noc_mux_0_valid,
  output              i_out_noc_mux_0_ready,
  input               i_out_noc_mux_0_payload_last,
  input      [31:0]   i_out_noc_mux_0_payload_fragment,
  input               i_out_noc_mux_1_valid,
  output              i_out_noc_mux_1_ready,
  input               i_out_noc_mux_1_payload_last,
  input      [31:0]   i_out_noc_mux_1_payload_fragment,
  input               i_out_noc_mux_2_valid,
  output              i_out_noc_mux_2_ready,
  input               i_out_noc_mux_2_payload_last,
  input      [31:0]   i_out_noc_mux_2_payload_fragment,
  input               i_out_noc_mux_3_valid,
  output              i_out_noc_mux_3_ready,
  input               i_out_noc_mux_3_payload_last,
  input      [31:0]   i_out_noc_mux_3_payload_fragment,
  input               i_out_noc_mux_4_valid,
  output              i_out_noc_mux_4_ready,
  input               i_out_noc_mux_4_payload_last,
  input      [31:0]   i_out_noc_mux_4_payload_fragment,
  output              o_out_noc_pkt_valid,
  input               o_out_noc_pkt_ready,
  output              o_out_noc_pkt_payload_last,
  output     [31:0]   o_out_noc_pkt_payload_fragment,
  input               clk,
  input               reset
);

  wire                noc_pkt_buffer_io_pop_fork_io_outputs_0_ready;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_1_ready;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_2_ready;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_3_ready;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_4_ready;
  wire                streamArbiter_io_inputs_0_ready;
  wire                streamArbiter_io_inputs_1_ready;
  wire                streamArbiter_io_inputs_2_ready;
  wire                streamArbiter_io_inputs_3_ready;
  wire                streamArbiter_io_inputs_4_ready;
  wire                streamArbiter_io_output_valid;
  wire                streamArbiter_io_output_payload_last;
  wire       [31:0]   streamArbiter_io_output_payload_fragment;
  wire       [2:0]    streamArbiter_io_chosen;
  wire       [4:0]    streamArbiter_io_chosenOH;
  wire                noc_pkt_buffer_io_push_ready;
  wire                noc_pkt_buffer_io_pop_valid;
  wire       [31:0]   noc_pkt_buffer_io_pop_payload;
  wire       [10:0]   noc_pkt_buffer_io_occupancy;
  wire       [10:0]   noc_pkt_buffer_io_availability;
  wire                noc_pkt_buffer_io_pop_fork_io_input_ready;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_0_valid;
  wire       [31:0]   noc_pkt_buffer_io_pop_fork_io_outputs_0_payload;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_1_valid;
  wire       [31:0]   noc_pkt_buffer_io_pop_fork_io_outputs_1_payload;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_2_valid;
  wire       [31:0]   noc_pkt_buffer_io_pop_fork_io_outputs_2_payload;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_3_valid;
  wire       [31:0]   noc_pkt_buffer_io_pop_fork_io_outputs_3_payload;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_4_valid;
  wire       [31:0]   noc_pkt_buffer_io_pop_fork_io_outputs_4_payload;
  wire       [15:0]   _zz_ch_0_frag_cnt_valueNext;
  wire       [0:0]    _zz_ch_0_frag_cnt_valueNext_1;
  wire       [15:0]   _zz_ch_0_eop;
  wire       [15:0]   _zz_ch_0_len;
  wire       [15:0]   _zz_ch_0_len_1;
  wire       [15:0]   _zz_ch_0_len_2;
  wire       [15:0]   _zz_ch_1_frag_cnt_valueNext;
  wire       [0:0]    _zz_ch_1_frag_cnt_valueNext_1;
  wire       [15:0]   _zz_ch_1_eop;
  wire       [15:0]   _zz_ch_1_len;
  wire       [15:0]   _zz_ch_1_len_1;
  wire       [15:0]   _zz_ch_1_len_2;
  wire       [15:0]   _zz_ch_2_frag_cnt_valueNext;
  wire       [0:0]    _zz_ch_2_frag_cnt_valueNext_1;
  wire       [15:0]   _zz_ch_2_eop;
  wire       [15:0]   _zz_ch_2_len;
  wire       [15:0]   _zz_ch_2_len_1;
  wire       [15:0]   _zz_ch_2_len_2;
  wire       [15:0]   _zz_ch_3_frag_cnt_valueNext;
  wire       [0:0]    _zz_ch_3_frag_cnt_valueNext_1;
  wire       [15:0]   _zz_ch_3_eop;
  wire       [15:0]   _zz_ch_3_len;
  wire       [15:0]   _zz_ch_3_len_1;
  wire       [15:0]   _zz_ch_3_len_2;
  wire       [15:0]   _zz_ch_4_frag_cnt_valueNext;
  wire       [0:0]    _zz_ch_4_frag_cnt_valueNext_1;
  wire       [15:0]   _zz_ch_4_eop;
  wire       [15:0]   _zz_ch_4_len;
  wire       [15:0]   _zz_ch_4_len_1;
  wire       [15:0]   _zz_ch_4_len_2;
  wire       [3:0]    ch_0_noc_pkt_header_src;
  wire       [3:0]    ch_0_noc_pkt_header_dst;
  wire       [15:0]   ch_0_noc_pkt_header_length;
  wire       [1:0]    ch_0_noc_pkt_header_dp;
  wire       [5:0]    ch_0_noc_pkt_header_op;
  wire       [31:0]   _zz_ch_0_noc_pkt_header_src;
  reg                 ch_0_frag_cnt_willIncrement;
  wire                ch_0_frag_cnt_willClear;
  reg        [15:0]   ch_0_frag_cnt_valueNext;
  reg        [15:0]   ch_0_frag_cnt_value;
  wire                ch_0_frag_cnt_willOverflowIfInc;
  wire                ch_0_frag_cnt_willOverflow;
  reg        [15:0]   ch_0_len;
  reg                 ch_0_sop;
  wire                ch_0_eop;
  reg                 ch_0_payload_match;
  wire                ch_0_head_match;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_0_fire;
  wire       [3:0]    ch_1_noc_pkt_header_src;
  wire       [3:0]    ch_1_noc_pkt_header_dst;
  wire       [15:0]   ch_1_noc_pkt_header_length;
  wire       [1:0]    ch_1_noc_pkt_header_dp;
  wire       [5:0]    ch_1_noc_pkt_header_op;
  wire       [31:0]   _zz_ch_1_noc_pkt_header_src;
  reg                 ch_1_frag_cnt_willIncrement;
  wire                ch_1_frag_cnt_willClear;
  reg        [15:0]   ch_1_frag_cnt_valueNext;
  reg        [15:0]   ch_1_frag_cnt_value;
  wire                ch_1_frag_cnt_willOverflowIfInc;
  wire                ch_1_frag_cnt_willOverflow;
  reg        [15:0]   ch_1_len;
  reg                 ch_1_sop;
  wire                ch_1_eop;
  reg                 ch_1_payload_match;
  wire                ch_1_head_match;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_1_fire;
  wire       [3:0]    ch_2_noc_pkt_header_src;
  wire       [3:0]    ch_2_noc_pkt_header_dst;
  wire       [15:0]   ch_2_noc_pkt_header_length;
  wire       [1:0]    ch_2_noc_pkt_header_dp;
  wire       [5:0]    ch_2_noc_pkt_header_op;
  wire       [31:0]   _zz_ch_2_noc_pkt_header_src;
  reg                 ch_2_frag_cnt_willIncrement;
  wire                ch_2_frag_cnt_willClear;
  reg        [15:0]   ch_2_frag_cnt_valueNext;
  reg        [15:0]   ch_2_frag_cnt_value;
  wire                ch_2_frag_cnt_willOverflowIfInc;
  wire                ch_2_frag_cnt_willOverflow;
  reg        [15:0]   ch_2_len;
  reg                 ch_2_sop;
  wire                ch_2_eop;
  reg                 ch_2_payload_match;
  wire                ch_2_head_match;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_2_fire;
  wire       [3:0]    ch_3_noc_pkt_header_src;
  wire       [3:0]    ch_3_noc_pkt_header_dst;
  wire       [15:0]   ch_3_noc_pkt_header_length;
  wire       [1:0]    ch_3_noc_pkt_header_dp;
  wire       [5:0]    ch_3_noc_pkt_header_op;
  wire       [31:0]   _zz_ch_3_noc_pkt_header_src;
  reg                 ch_3_frag_cnt_willIncrement;
  wire                ch_3_frag_cnt_willClear;
  reg        [15:0]   ch_3_frag_cnt_valueNext;
  reg        [15:0]   ch_3_frag_cnt_value;
  wire                ch_3_frag_cnt_willOverflowIfInc;
  wire                ch_3_frag_cnt_willOverflow;
  reg        [15:0]   ch_3_len;
  reg                 ch_3_sop;
  wire                ch_3_eop;
  reg                 ch_3_payload_match;
  wire                ch_3_head_match;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_3_fire;
  wire       [3:0]    ch_4_noc_pkt_header_src;
  wire       [3:0]    ch_4_noc_pkt_header_dst;
  wire       [15:0]   ch_4_noc_pkt_header_length;
  wire       [1:0]    ch_4_noc_pkt_header_dp;
  wire       [5:0]    ch_4_noc_pkt_header_op;
  wire       [31:0]   _zz_ch_4_noc_pkt_header_src;
  reg                 ch_4_frag_cnt_willIncrement;
  wire                ch_4_frag_cnt_willClear;
  reg        [15:0]   ch_4_frag_cnt_valueNext;
  reg        [15:0]   ch_4_frag_cnt_value;
  wire                ch_4_frag_cnt_willOverflowIfInc;
  wire                ch_4_frag_cnt_willOverflow;
  reg        [15:0]   ch_4_len;
  reg                 ch_4_sop;
  wire                ch_4_eop;
  reg                 ch_4_payload_match;
  wire                ch_4_head_match;
  wire                noc_pkt_buffer_io_pop_fork_io_outputs_4_fire;

  assign _zz_ch_0_frag_cnt_valueNext_1 = ch_0_frag_cnt_willIncrement;
  assign _zz_ch_0_frag_cnt_valueNext = {15'd0, _zz_ch_0_frag_cnt_valueNext_1};
  assign _zz_ch_0_eop = (ch_0_len - 16'h0001);
  assign _zz_ch_0_len = (_zz_ch_0_len_1 / 3'b100);
  assign _zz_ch_0_len_1 = (_zz_ch_0_len_2 - 16'h0001);
  assign _zz_ch_0_len_2 = (ch_0_noc_pkt_header_length + 16'h0004);
  assign _zz_ch_1_frag_cnt_valueNext_1 = ch_1_frag_cnt_willIncrement;
  assign _zz_ch_1_frag_cnt_valueNext = {15'd0, _zz_ch_1_frag_cnt_valueNext_1};
  assign _zz_ch_1_eop = (ch_1_len - 16'h0001);
  assign _zz_ch_1_len = (_zz_ch_1_len_1 / 3'b100);
  assign _zz_ch_1_len_1 = (_zz_ch_1_len_2 - 16'h0001);
  assign _zz_ch_1_len_2 = (ch_1_noc_pkt_header_length + 16'h0004);
  assign _zz_ch_2_frag_cnt_valueNext_1 = ch_2_frag_cnt_willIncrement;
  assign _zz_ch_2_frag_cnt_valueNext = {15'd0, _zz_ch_2_frag_cnt_valueNext_1};
  assign _zz_ch_2_eop = (ch_2_len - 16'h0001);
  assign _zz_ch_2_len = (_zz_ch_2_len_1 / 3'b100);
  assign _zz_ch_2_len_1 = (_zz_ch_2_len_2 - 16'h0001);
  assign _zz_ch_2_len_2 = (ch_2_noc_pkt_header_length + 16'h0004);
  assign _zz_ch_3_frag_cnt_valueNext_1 = ch_3_frag_cnt_willIncrement;
  assign _zz_ch_3_frag_cnt_valueNext = {15'd0, _zz_ch_3_frag_cnt_valueNext_1};
  assign _zz_ch_3_eop = (ch_3_len - 16'h0001);
  assign _zz_ch_3_len = (_zz_ch_3_len_1 / 3'b100);
  assign _zz_ch_3_len_1 = (_zz_ch_3_len_2 - 16'h0001);
  assign _zz_ch_3_len_2 = (ch_3_noc_pkt_header_length + 16'h0004);
  assign _zz_ch_4_frag_cnt_valueNext_1 = ch_4_frag_cnt_willIncrement;
  assign _zz_ch_4_frag_cnt_valueNext = {15'd0, _zz_ch_4_frag_cnt_valueNext_1};
  assign _zz_ch_4_eop = (ch_4_len - 16'h0001);
  assign _zz_ch_4_len = (_zz_ch_4_len_1 / 3'b100);
  assign _zz_ch_4_len_1 = (_zz_ch_4_len_2 - 16'h0001);
  assign _zz_ch_4_len_2 = (ch_4_noc_pkt_header_length + 16'h0004);
  HS_QV19P_ZYNQ_StreamArbiter streamArbiter (
    .io_inputs_0_valid               (i_out_noc_mux_0_valid                           ), //i
    .io_inputs_0_ready               (streamArbiter_io_inputs_0_ready                 ), //o
    .io_inputs_0_payload_last        (i_out_noc_mux_0_payload_last                    ), //i
    .io_inputs_0_payload_fragment    (i_out_noc_mux_0_payload_fragment[31:0]          ), //i
    .io_inputs_1_valid               (i_out_noc_mux_1_valid                           ), //i
    .io_inputs_1_ready               (streamArbiter_io_inputs_1_ready                 ), //o
    .io_inputs_1_payload_last        (i_out_noc_mux_1_payload_last                    ), //i
    .io_inputs_1_payload_fragment    (i_out_noc_mux_1_payload_fragment[31:0]          ), //i
    .io_inputs_2_valid               (i_out_noc_mux_2_valid                           ), //i
    .io_inputs_2_ready               (streamArbiter_io_inputs_2_ready                 ), //o
    .io_inputs_2_payload_last        (i_out_noc_mux_2_payload_last                    ), //i
    .io_inputs_2_payload_fragment    (i_out_noc_mux_2_payload_fragment[31:0]          ), //i
    .io_inputs_3_valid               (i_out_noc_mux_3_valid                           ), //i
    .io_inputs_3_ready               (streamArbiter_io_inputs_3_ready                 ), //o
    .io_inputs_3_payload_last        (i_out_noc_mux_3_payload_last                    ), //i
    .io_inputs_3_payload_fragment    (i_out_noc_mux_3_payload_fragment[31:0]          ), //i
    .io_inputs_4_valid               (i_out_noc_mux_4_valid                           ), //i
    .io_inputs_4_ready               (streamArbiter_io_inputs_4_ready                 ), //o
    .io_inputs_4_payload_last        (i_out_noc_mux_4_payload_last                    ), //i
    .io_inputs_4_payload_fragment    (i_out_noc_mux_4_payload_fragment[31:0]          ), //i
    .io_output_valid                 (streamArbiter_io_output_valid                   ), //o
    .io_output_ready                 (o_out_noc_pkt_ready                             ), //i
    .io_output_payload_last          (streamArbiter_io_output_payload_last            ), //o
    .io_output_payload_fragment      (streamArbiter_io_output_payload_fragment[31:0]  ), //o
    .io_chosen                       (streamArbiter_io_chosen[2:0]                    ), //o
    .io_chosenOH                     (streamArbiter_io_chosenOH[4:0]                  ), //o
    .clk                             (clk                                             ), //i
    .reset                           (reset                                           )  //i
  );
  HS_QV19P_ZYNQ_StreamFifo noc_pkt_buffer (
    .io_push_valid      (i_in_noc_pkt_valid                         ), //i
    .io_push_ready      (noc_pkt_buffer_io_push_ready               ), //o
    .io_push_payload    (i_in_noc_pkt_payload[31:0]                 ), //i
    .io_pop_valid       (noc_pkt_buffer_io_pop_valid                ), //o
    .io_pop_ready       (noc_pkt_buffer_io_pop_fork_io_input_ready  ), //i
    .io_pop_payload     (noc_pkt_buffer_io_pop_payload[31:0]        ), //o
    .io_flush           (1'b0                                       ), //i
    .io_occupancy       (noc_pkt_buffer_io_occupancy[10:0]          ), //o
    .io_availability    (noc_pkt_buffer_io_availability[10:0]       ), //o
    .clk                (clk                                        ), //i
    .reset              (reset                                      )  //i
  );
  HS_QV19P_ZYNQ_StreamFork noc_pkt_buffer_io_pop_fork (
    .io_input_valid          (noc_pkt_buffer_io_pop_valid                            ), //i
    .io_input_ready          (noc_pkt_buffer_io_pop_fork_io_input_ready              ), //o
    .io_input_payload        (noc_pkt_buffer_io_pop_payload[31:0]                    ), //i
    .io_outputs_0_valid      (noc_pkt_buffer_io_pop_fork_io_outputs_0_valid          ), //o
    .io_outputs_0_ready      (noc_pkt_buffer_io_pop_fork_io_outputs_0_ready          ), //i
    .io_outputs_0_payload    (noc_pkt_buffer_io_pop_fork_io_outputs_0_payload[31:0]  ), //o
    .io_outputs_1_valid      (noc_pkt_buffer_io_pop_fork_io_outputs_1_valid          ), //o
    .io_outputs_1_ready      (noc_pkt_buffer_io_pop_fork_io_outputs_1_ready          ), //i
    .io_outputs_1_payload    (noc_pkt_buffer_io_pop_fork_io_outputs_1_payload[31:0]  ), //o
    .io_outputs_2_valid      (noc_pkt_buffer_io_pop_fork_io_outputs_2_valid          ), //o
    .io_outputs_2_ready      (noc_pkt_buffer_io_pop_fork_io_outputs_2_ready          ), //i
    .io_outputs_2_payload    (noc_pkt_buffer_io_pop_fork_io_outputs_2_payload[31:0]  ), //o
    .io_outputs_3_valid      (noc_pkt_buffer_io_pop_fork_io_outputs_3_valid          ), //o
    .io_outputs_3_ready      (noc_pkt_buffer_io_pop_fork_io_outputs_3_ready          ), //i
    .io_outputs_3_payload    (noc_pkt_buffer_io_pop_fork_io_outputs_3_payload[31:0]  ), //o
    .io_outputs_4_valid      (noc_pkt_buffer_io_pop_fork_io_outputs_4_valid          ), //o
    .io_outputs_4_ready      (noc_pkt_buffer_io_pop_fork_io_outputs_4_ready          ), //i
    .io_outputs_4_payload    (noc_pkt_buffer_io_pop_fork_io_outputs_4_payload[31:0]  ), //o
    .clk                     (clk                                                    ), //i
    .reset                   (reset                                                  )  //i
  );
  assign i_out_noc_mux_0_ready = streamArbiter_io_inputs_0_ready;
  assign i_out_noc_mux_1_ready = streamArbiter_io_inputs_1_ready;
  assign i_out_noc_mux_2_ready = streamArbiter_io_inputs_2_ready;
  assign i_out_noc_mux_3_ready = streamArbiter_io_inputs_3_ready;
  assign i_out_noc_mux_4_ready = streamArbiter_io_inputs_4_ready;
  assign o_out_noc_pkt_valid = streamArbiter_io_output_valid;
  assign o_out_noc_pkt_payload_last = streamArbiter_io_output_payload_last;
  assign o_out_noc_pkt_payload_fragment = streamArbiter_io_output_payload_fragment;
  assign i_in_noc_pkt_ready = noc_pkt_buffer_io_push_ready;
  assign _zz_ch_0_noc_pkt_header_src = noc_pkt_buffer_io_pop_fork_io_outputs_0_payload;
  assign ch_0_noc_pkt_header_src = _zz_ch_0_noc_pkt_header_src[3 : 0];
  assign ch_0_noc_pkt_header_dst = _zz_ch_0_noc_pkt_header_src[7 : 4];
  assign ch_0_noc_pkt_header_length = _zz_ch_0_noc_pkt_header_src[23 : 8];
  assign ch_0_noc_pkt_header_dp = _zz_ch_0_noc_pkt_header_src[25 : 24];
  assign ch_0_noc_pkt_header_op = _zz_ch_0_noc_pkt_header_src[31 : 26];
  always @(*) begin
    ch_0_frag_cnt_willIncrement = 1'b0;
    if(noc_pkt_buffer_io_pop_fork_io_outputs_0_fire) begin
      if(!ch_0_sop) begin
        ch_0_frag_cnt_willIncrement = 1'b1;
      end
    end
  end

  assign ch_0_frag_cnt_willClear = 1'b0;
  assign ch_0_frag_cnt_willOverflowIfInc = (ch_0_frag_cnt_value == 16'h8000);
  assign ch_0_frag_cnt_willOverflow = (ch_0_frag_cnt_willOverflowIfInc && ch_0_frag_cnt_willIncrement);
  always @(*) begin
    if(ch_0_frag_cnt_willOverflow) begin
      ch_0_frag_cnt_valueNext = 16'h0;
    end else begin
      ch_0_frag_cnt_valueNext = (ch_0_frag_cnt_value + _zz_ch_0_frag_cnt_valueNext);
    end
    if(ch_0_frag_cnt_willClear) begin
      ch_0_frag_cnt_valueNext = 16'h0;
    end
  end

  assign ch_0_eop = (ch_0_frag_cnt_value == _zz_ch_0_eop);
  assign ch_0_head_match = ((ch_0_noc_pkt_header_dst == 4'b0000) && ch_0_sop);
  assign noc_pkt_buffer_io_pop_fork_io_outputs_0_ready = (o_in_noc_demux_0_ready || (noc_pkt_buffer_io_pop_fork_io_outputs_0_valid && (! (ch_0_payload_match || ch_0_head_match))));
  assign o_in_noc_demux_0_payload_fragment = noc_pkt_buffer_io_pop_fork_io_outputs_0_payload;
  assign o_in_noc_demux_0_payload_last = ((noc_pkt_buffer_io_pop_fork_io_outputs_0_valid && (ch_0_payload_match || ch_0_head_match)) && ch_0_eop);
  assign o_in_noc_demux_0_valid = (noc_pkt_buffer_io_pop_fork_io_outputs_0_valid && (ch_0_payload_match || ch_0_head_match));
  assign noc_pkt_buffer_io_pop_fork_io_outputs_0_fire = (noc_pkt_buffer_io_pop_fork_io_outputs_0_valid && noc_pkt_buffer_io_pop_fork_io_outputs_0_ready);
  assign _zz_ch_1_noc_pkt_header_src = noc_pkt_buffer_io_pop_fork_io_outputs_1_payload;
  assign ch_1_noc_pkt_header_src = _zz_ch_1_noc_pkt_header_src[3 : 0];
  assign ch_1_noc_pkt_header_dst = _zz_ch_1_noc_pkt_header_src[7 : 4];
  assign ch_1_noc_pkt_header_length = _zz_ch_1_noc_pkt_header_src[23 : 8];
  assign ch_1_noc_pkt_header_dp = _zz_ch_1_noc_pkt_header_src[25 : 24];
  assign ch_1_noc_pkt_header_op = _zz_ch_1_noc_pkt_header_src[31 : 26];
  always @(*) begin
    ch_1_frag_cnt_willIncrement = 1'b0;
    if(noc_pkt_buffer_io_pop_fork_io_outputs_1_fire) begin
      if(!ch_1_sop) begin
        ch_1_frag_cnt_willIncrement = 1'b1;
      end
    end
  end

  assign ch_1_frag_cnt_willClear = 1'b0;
  assign ch_1_frag_cnt_willOverflowIfInc = (ch_1_frag_cnt_value == 16'h8000);
  assign ch_1_frag_cnt_willOverflow = (ch_1_frag_cnt_willOverflowIfInc && ch_1_frag_cnt_willIncrement);
  always @(*) begin
    if(ch_1_frag_cnt_willOverflow) begin
      ch_1_frag_cnt_valueNext = 16'h0;
    end else begin
      ch_1_frag_cnt_valueNext = (ch_1_frag_cnt_value + _zz_ch_1_frag_cnt_valueNext);
    end
    if(ch_1_frag_cnt_willClear) begin
      ch_1_frag_cnt_valueNext = 16'h0;
    end
  end

  assign ch_1_eop = (ch_1_frag_cnt_value == _zz_ch_1_eop);
  assign ch_1_head_match = ((ch_1_noc_pkt_header_dst == 4'b0001) && ch_1_sop);
  assign noc_pkt_buffer_io_pop_fork_io_outputs_1_ready = (o_in_noc_demux_1_ready || (noc_pkt_buffer_io_pop_fork_io_outputs_1_valid && (! (ch_1_payload_match || ch_1_head_match))));
  assign o_in_noc_demux_1_payload_fragment = noc_pkt_buffer_io_pop_fork_io_outputs_1_payload;
  assign o_in_noc_demux_1_payload_last = ((noc_pkt_buffer_io_pop_fork_io_outputs_1_valid && (ch_1_payload_match || ch_1_head_match)) && ch_1_eop);
  assign o_in_noc_demux_1_valid = (noc_pkt_buffer_io_pop_fork_io_outputs_1_valid && (ch_1_payload_match || ch_1_head_match));
  assign noc_pkt_buffer_io_pop_fork_io_outputs_1_fire = (noc_pkt_buffer_io_pop_fork_io_outputs_1_valid && noc_pkt_buffer_io_pop_fork_io_outputs_1_ready);
  assign _zz_ch_2_noc_pkt_header_src = noc_pkt_buffer_io_pop_fork_io_outputs_2_payload;
  assign ch_2_noc_pkt_header_src = _zz_ch_2_noc_pkt_header_src[3 : 0];
  assign ch_2_noc_pkt_header_dst = _zz_ch_2_noc_pkt_header_src[7 : 4];
  assign ch_2_noc_pkt_header_length = _zz_ch_2_noc_pkt_header_src[23 : 8];
  assign ch_2_noc_pkt_header_dp = _zz_ch_2_noc_pkt_header_src[25 : 24];
  assign ch_2_noc_pkt_header_op = _zz_ch_2_noc_pkt_header_src[31 : 26];
  always @(*) begin
    ch_2_frag_cnt_willIncrement = 1'b0;
    if(noc_pkt_buffer_io_pop_fork_io_outputs_2_fire) begin
      if(!ch_2_sop) begin
        ch_2_frag_cnt_willIncrement = 1'b1;
      end
    end
  end

  assign ch_2_frag_cnt_willClear = 1'b0;
  assign ch_2_frag_cnt_willOverflowIfInc = (ch_2_frag_cnt_value == 16'h8000);
  assign ch_2_frag_cnt_willOverflow = (ch_2_frag_cnt_willOverflowIfInc && ch_2_frag_cnt_willIncrement);
  always @(*) begin
    if(ch_2_frag_cnt_willOverflow) begin
      ch_2_frag_cnt_valueNext = 16'h0;
    end else begin
      ch_2_frag_cnt_valueNext = (ch_2_frag_cnt_value + _zz_ch_2_frag_cnt_valueNext);
    end
    if(ch_2_frag_cnt_willClear) begin
      ch_2_frag_cnt_valueNext = 16'h0;
    end
  end

  assign ch_2_eop = (ch_2_frag_cnt_value == _zz_ch_2_eop);
  assign ch_2_head_match = ((ch_2_noc_pkt_header_dst == 4'b0010) && ch_2_sop);
  assign noc_pkt_buffer_io_pop_fork_io_outputs_2_ready = (o_in_noc_demux_2_ready || (noc_pkt_buffer_io_pop_fork_io_outputs_2_valid && (! (ch_2_payload_match || ch_2_head_match))));
  assign o_in_noc_demux_2_payload_fragment = noc_pkt_buffer_io_pop_fork_io_outputs_2_payload;
  assign o_in_noc_demux_2_payload_last = ((noc_pkt_buffer_io_pop_fork_io_outputs_2_valid && (ch_2_payload_match || ch_2_head_match)) && ch_2_eop);
  assign o_in_noc_demux_2_valid = (noc_pkt_buffer_io_pop_fork_io_outputs_2_valid && (ch_2_payload_match || ch_2_head_match));
  assign noc_pkt_buffer_io_pop_fork_io_outputs_2_fire = (noc_pkt_buffer_io_pop_fork_io_outputs_2_valid && noc_pkt_buffer_io_pop_fork_io_outputs_2_ready);
  assign _zz_ch_3_noc_pkt_header_src = noc_pkt_buffer_io_pop_fork_io_outputs_3_payload;
  assign ch_3_noc_pkt_header_src = _zz_ch_3_noc_pkt_header_src[3 : 0];
  assign ch_3_noc_pkt_header_dst = _zz_ch_3_noc_pkt_header_src[7 : 4];
  assign ch_3_noc_pkt_header_length = _zz_ch_3_noc_pkt_header_src[23 : 8];
  assign ch_3_noc_pkt_header_dp = _zz_ch_3_noc_pkt_header_src[25 : 24];
  assign ch_3_noc_pkt_header_op = _zz_ch_3_noc_pkt_header_src[31 : 26];
  always @(*) begin
    ch_3_frag_cnt_willIncrement = 1'b0;
    if(noc_pkt_buffer_io_pop_fork_io_outputs_3_fire) begin
      if(!ch_3_sop) begin
        ch_3_frag_cnt_willIncrement = 1'b1;
      end
    end
  end

  assign ch_3_frag_cnt_willClear = 1'b0;
  assign ch_3_frag_cnt_willOverflowIfInc = (ch_3_frag_cnt_value == 16'h8000);
  assign ch_3_frag_cnt_willOverflow = (ch_3_frag_cnt_willOverflowIfInc && ch_3_frag_cnt_willIncrement);
  always @(*) begin
    if(ch_3_frag_cnt_willOverflow) begin
      ch_3_frag_cnt_valueNext = 16'h0;
    end else begin
      ch_3_frag_cnt_valueNext = (ch_3_frag_cnt_value + _zz_ch_3_frag_cnt_valueNext);
    end
    if(ch_3_frag_cnt_willClear) begin
      ch_3_frag_cnt_valueNext = 16'h0;
    end
  end

  assign ch_3_eop = (ch_3_frag_cnt_value == _zz_ch_3_eop);
  assign ch_3_head_match = ((ch_3_noc_pkt_header_dst == 4'b0011) && ch_3_sop);
  assign noc_pkt_buffer_io_pop_fork_io_outputs_3_ready = (o_in_noc_demux_3_ready || (noc_pkt_buffer_io_pop_fork_io_outputs_3_valid && (! (ch_3_payload_match || ch_3_head_match))));
  assign o_in_noc_demux_3_payload_fragment = noc_pkt_buffer_io_pop_fork_io_outputs_3_payload;
  assign o_in_noc_demux_3_payload_last = ((noc_pkt_buffer_io_pop_fork_io_outputs_3_valid && (ch_3_payload_match || ch_3_head_match)) && ch_3_eop);
  assign o_in_noc_demux_3_valid = (noc_pkt_buffer_io_pop_fork_io_outputs_3_valid && (ch_3_payload_match || ch_3_head_match));
  assign noc_pkt_buffer_io_pop_fork_io_outputs_3_fire = (noc_pkt_buffer_io_pop_fork_io_outputs_3_valid && noc_pkt_buffer_io_pop_fork_io_outputs_3_ready);
  assign _zz_ch_4_noc_pkt_header_src = noc_pkt_buffer_io_pop_fork_io_outputs_4_payload;
  assign ch_4_noc_pkt_header_src = _zz_ch_4_noc_pkt_header_src[3 : 0];
  assign ch_4_noc_pkt_header_dst = _zz_ch_4_noc_pkt_header_src[7 : 4];
  assign ch_4_noc_pkt_header_length = _zz_ch_4_noc_pkt_header_src[23 : 8];
  assign ch_4_noc_pkt_header_dp = _zz_ch_4_noc_pkt_header_src[25 : 24];
  assign ch_4_noc_pkt_header_op = _zz_ch_4_noc_pkt_header_src[31 : 26];
  always @(*) begin
    ch_4_frag_cnt_willIncrement = 1'b0;
    if(noc_pkt_buffer_io_pop_fork_io_outputs_4_fire) begin
      if(!ch_4_sop) begin
        ch_4_frag_cnt_willIncrement = 1'b1;
      end
    end
  end

  assign ch_4_frag_cnt_willClear = 1'b0;
  assign ch_4_frag_cnt_willOverflowIfInc = (ch_4_frag_cnt_value == 16'h8000);
  assign ch_4_frag_cnt_willOverflow = (ch_4_frag_cnt_willOverflowIfInc && ch_4_frag_cnt_willIncrement);
  always @(*) begin
    if(ch_4_frag_cnt_willOverflow) begin
      ch_4_frag_cnt_valueNext = 16'h0;
    end else begin
      ch_4_frag_cnt_valueNext = (ch_4_frag_cnt_value + _zz_ch_4_frag_cnt_valueNext);
    end
    if(ch_4_frag_cnt_willClear) begin
      ch_4_frag_cnt_valueNext = 16'h0;
    end
  end

  assign ch_4_eop = (ch_4_frag_cnt_value == _zz_ch_4_eop);
  assign ch_4_head_match = ((ch_4_noc_pkt_header_dst == 4'b0100) && ch_4_sop);
  assign noc_pkt_buffer_io_pop_fork_io_outputs_4_ready = (o_in_noc_demux_4_ready || (noc_pkt_buffer_io_pop_fork_io_outputs_4_valid && (! (ch_4_payload_match || ch_4_head_match))));
  assign o_in_noc_demux_4_payload_fragment = noc_pkt_buffer_io_pop_fork_io_outputs_4_payload;
  assign o_in_noc_demux_4_payload_last = ((noc_pkt_buffer_io_pop_fork_io_outputs_4_valid && (ch_4_payload_match || ch_4_head_match)) && ch_4_eop);
  assign o_in_noc_demux_4_valid = (noc_pkt_buffer_io_pop_fork_io_outputs_4_valid && (ch_4_payload_match || ch_4_head_match));
  assign noc_pkt_buffer_io_pop_fork_io_outputs_4_fire = (noc_pkt_buffer_io_pop_fork_io_outputs_4_valid && noc_pkt_buffer_io_pop_fork_io_outputs_4_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ch_0_frag_cnt_value <= 16'h0;
      ch_0_len <= 16'h0;
      ch_0_sop <= 1'b1;
      ch_0_payload_match <= 1'b0;
      ch_1_frag_cnt_value <= 16'h0;
      ch_1_len <= 16'h0;
      ch_1_sop <= 1'b1;
      ch_1_payload_match <= 1'b0;
      ch_2_frag_cnt_value <= 16'h0;
      ch_2_len <= 16'h0;
      ch_2_sop <= 1'b1;
      ch_2_payload_match <= 1'b0;
      ch_3_frag_cnt_value <= 16'h0;
      ch_3_len <= 16'h0;
      ch_3_sop <= 1'b1;
      ch_3_payload_match <= 1'b0;
      ch_4_frag_cnt_value <= 16'h0;
      ch_4_len <= 16'h0;
      ch_4_sop <= 1'b1;
      ch_4_payload_match <= 1'b0;
    end else begin
      ch_0_frag_cnt_value <= ch_0_frag_cnt_valueNext;
      if(noc_pkt_buffer_io_pop_fork_io_outputs_0_fire) begin
        if(ch_0_sop) begin
          ch_0_len <= _zz_ch_0_len;
          ch_0_payload_match <= ch_0_head_match;
          ch_0_sop <= 1'b0;
          ch_0_frag_cnt_value <= 16'h0;
        end
        if(ch_0_eop) begin
          ch_0_sop <= 1'b1;
          ch_0_payload_match <= 1'b0;
        end
      end
      ch_1_frag_cnt_value <= ch_1_frag_cnt_valueNext;
      if(noc_pkt_buffer_io_pop_fork_io_outputs_1_fire) begin
        if(ch_1_sop) begin
          ch_1_len <= _zz_ch_1_len;
          ch_1_payload_match <= ch_1_head_match;
          ch_1_sop <= 1'b0;
          ch_1_frag_cnt_value <= 16'h0;
        end
        if(ch_1_eop) begin
          ch_1_sop <= 1'b1;
          ch_1_payload_match <= 1'b0;
        end
      end
      ch_2_frag_cnt_value <= ch_2_frag_cnt_valueNext;
      if(noc_pkt_buffer_io_pop_fork_io_outputs_2_fire) begin
        if(ch_2_sop) begin
          ch_2_len <= _zz_ch_2_len;
          ch_2_payload_match <= ch_2_head_match;
          ch_2_sop <= 1'b0;
          ch_2_frag_cnt_value <= 16'h0;
        end
        if(ch_2_eop) begin
          ch_2_sop <= 1'b1;
          ch_2_payload_match <= 1'b0;
        end
      end
      ch_3_frag_cnt_value <= ch_3_frag_cnt_valueNext;
      if(noc_pkt_buffer_io_pop_fork_io_outputs_3_fire) begin
        if(ch_3_sop) begin
          ch_3_len <= _zz_ch_3_len;
          ch_3_payload_match <= ch_3_head_match;
          ch_3_sop <= 1'b0;
          ch_3_frag_cnt_value <= 16'h0;
        end
        if(ch_3_eop) begin
          ch_3_sop <= 1'b1;
          ch_3_payload_match <= 1'b0;
        end
      end
      ch_4_frag_cnt_value <= ch_4_frag_cnt_valueNext;
      if(noc_pkt_buffer_io_pop_fork_io_outputs_4_fire) begin
        if(ch_4_sop) begin
          ch_4_len <= _zz_ch_4_len;
          ch_4_payload_match <= ch_4_head_match;
          ch_4_sop <= 1'b0;
          ch_4_frag_cnt_value <= 16'h0;
        end
        if(ch_4_eop) begin
          ch_4_sop <= 1'b1;
          ch_4_payload_match <= 1'b0;
        end
      end
    end
  end


endmodule

module HS_QV19P_ZYNQ_StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [31:0]   io_input_payload,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [31:0]   io_outputs_0_payload,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [31:0]   io_outputs_1_payload,
  output              io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [31:0]   io_outputs_2_payload,
  output              io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [31:0]   io_outputs_3_payload,
  output              io_outputs_4_valid,
  input               io_outputs_4_ready,
  output     [31:0]   io_outputs_4_payload,
  input               clk,
  input               reset
);

  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  reg                 _zz_io_outputs_2_valid;
  reg                 _zz_io_outputs_3_valid;
  reg                 _zz_io_outputs_4_valid;
  wire                when_Stream_l825;
  wire                when_Stream_l825_1;
  wire                when_Stream_l825_2;
  wire                when_Stream_l825_3;
  wire                when_Stream_l825_4;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;
  wire                io_outputs_2_fire;
  wire                io_outputs_3_fire;
  wire                io_outputs_4_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l825) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_1) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_2) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_3) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_4) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l825 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l825_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign when_Stream_l825_2 = ((! io_outputs_2_ready) && _zz_io_outputs_2_valid);
  assign when_Stream_l825_3 = ((! io_outputs_3_ready) && _zz_io_outputs_3_valid);
  assign when_Stream_l825_4 = ((! io_outputs_4_ready) && _zz_io_outputs_4_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload = io_input_payload;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload = io_input_payload;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  assign io_outputs_2_valid = (io_input_valid && _zz_io_outputs_2_valid);
  assign io_outputs_2_payload = io_input_payload;
  assign io_outputs_2_fire = (io_outputs_2_valid && io_outputs_2_ready);
  assign io_outputs_3_valid = (io_input_valid && _zz_io_outputs_3_valid);
  assign io_outputs_3_payload = io_input_payload;
  assign io_outputs_3_fire = (io_outputs_3_valid && io_outputs_3_ready);
  assign io_outputs_4_valid = (io_input_valid && _zz_io_outputs_4_valid);
  assign io_outputs_4_payload = io_input_payload;
  assign io_outputs_4_fire = (io_outputs_4_valid && io_outputs_4_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
      _zz_io_outputs_2_valid <= 1'b1;
      _zz_io_outputs_3_valid <= 1'b1;
      _zz_io_outputs_4_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_outputs_2_fire) begin
        _zz_io_outputs_2_valid <= 1'b0;
      end
      if(io_outputs_3_fire) begin
        _zz_io_outputs_3_valid <= 1'b0;
      end
      if(io_outputs_4_fire) begin
        _zz_io_outputs_4_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
        _zz_io_outputs_2_valid <= 1'b1;
        _zz_io_outputs_3_valid <= 1'b1;
        _zz_io_outputs_4_valid <= 1'b1;
      end
    end
  end


endmodule

module HS_QV19P_ZYNQ_StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  input               io_flush,
  output     [10:0]   io_occupancy,
  output     [10:0]   io_availability,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_logic_ram_port0;
  wire       [9:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [9:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [9:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [9:0]    logic_pushPtr_valueNext;
  reg        [9:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [9:0]    logic_popPtr_valueNext;
  reg        [9:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l954;
  wire       [9:0]    logic_ptrDif;
  reg [31:0] logic_ram [0:1023];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {9'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {9'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge clk) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 10'h3ff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 10'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 10'h3ff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 10'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l954 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 10'h0;
      logic_popPtr_value <= 10'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l954) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module HS_QV19P_ZYNQ_StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input               io_inputs_0_payload_last,
  input      [31:0]   io_inputs_0_payload_fragment,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input               io_inputs_1_payload_last,
  input      [31:0]   io_inputs_1_payload_fragment,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input               io_inputs_2_payload_last,
  input      [31:0]   io_inputs_2_payload_fragment,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input               io_inputs_3_payload_last,
  input      [31:0]   io_inputs_3_payload_fragment,
  input               io_inputs_4_valid,
  output              io_inputs_4_ready,
  input               io_inputs_4_payload_last,
  input      [31:0]   io_inputs_4_payload_fragment,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [31:0]   io_output_payload_fragment,
  output     [2:0]    io_chosen,
  output     [4:0]    io_chosenOH,
  input               clk,
  input               reset
);

  wire       [9:0]    _zz__zz_maskProposal_0_2;
  wire       [9:0]    _zz__zz_maskProposal_0_2_1;
  wire       [4:0]    _zz__zz_maskProposal_0_2_2;
  reg                 _zz_io_output_payload_last_3;
  reg        [31:0]   _zz_io_output_payload_fragment;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  wire                maskProposal_2;
  wire                maskProposal_3;
  wire                maskProposal_4;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  reg                 maskLocked_2;
  reg                 maskLocked_3;
  reg                 maskLocked_4;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire                maskRouted_2;
  wire                maskRouted_3;
  wire                maskRouted_4;
  wire       [4:0]    _zz_maskProposal_0;
  wire       [9:0]    _zz_maskProposal_0_1;
  wire       [9:0]    _zz_maskProposal_0_2;
  wire       [4:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                when_Stream_l542;
  wire                _zz_io_output_payload_last;
  wire                _zz_io_output_payload_last_1;
  wire       [2:0]    _zz_io_output_payload_last_2;
  wire                _zz_io_chosen;
  wire                _zz_io_chosen_1;
  wire                _zz_io_chosen_2;
  wire                _zz_io_chosen_3;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_3,{maskLocked_2,{maskLocked_1,{maskLocked_0,maskLocked_4}}}};
  assign _zz__zz_maskProposal_0_2_1 = {5'd0, _zz__zz_maskProposal_0_2_2};
  always @(*) begin
    case(_zz_io_output_payload_last_2)
      3'b000 : begin
        _zz_io_output_payload_last_3 = io_inputs_0_payload_last;
        _zz_io_output_payload_fragment = io_inputs_0_payload_fragment;
      end
      3'b001 : begin
        _zz_io_output_payload_last_3 = io_inputs_1_payload_last;
        _zz_io_output_payload_fragment = io_inputs_1_payload_fragment;
      end
      3'b010 : begin
        _zz_io_output_payload_last_3 = io_inputs_2_payload_last;
        _zz_io_output_payload_fragment = io_inputs_2_payload_fragment;
      end
      3'b011 : begin
        _zz_io_output_payload_last_3 = io_inputs_3_payload_last;
        _zz_io_output_payload_fragment = io_inputs_3_payload_fragment;
      end
      default : begin
        _zz_io_output_payload_last_3 = io_inputs_4_payload_last;
        _zz_io_output_payload_fragment = io_inputs_4_payload_fragment;
      end
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign maskRouted_3 = (locked ? maskLocked_3 : maskProposal_3);
  assign maskRouted_4 = (locked ? maskLocked_4 : maskProposal_4);
  assign _zz_maskProposal_0 = {io_inputs_4_valid,{io_inputs_3_valid,{io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}}}};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[9 : 5] | _zz_maskProposal_0_2[4 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign maskProposal_2 = _zz_maskProposal_0_3[2];
  assign maskProposal_3 = _zz_maskProposal_0_3[3];
  assign maskProposal_4 = _zz_maskProposal_0_3[4];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign when_Stream_l542 = (io_output_fire && io_output_payload_last);
  assign io_output_valid = (((((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2)) || (io_inputs_3_valid && maskRouted_3)) || (io_inputs_4_valid && maskRouted_4));
  assign _zz_io_output_payload_last = (maskRouted_1 || maskRouted_3);
  assign _zz_io_output_payload_last_1 = (maskRouted_2 || maskRouted_3);
  assign _zz_io_output_payload_last_2 = {maskRouted_4,{_zz_io_output_payload_last_1,_zz_io_output_payload_last}};
  assign io_output_payload_last = _zz_io_output_payload_last_3;
  assign io_output_payload_fragment = _zz_io_output_payload_fragment;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_inputs_2_ready = (maskRouted_2 && io_output_ready);
  assign io_inputs_3_ready = (maskRouted_3 && io_output_ready);
  assign io_inputs_4_ready = (maskRouted_4 && io_output_ready);
  assign io_chosenOH = {maskRouted_4,{maskRouted_3,{maskRouted_2,{maskRouted_1,maskRouted_0}}}};
  assign _zz_io_chosen = io_chosenOH[3];
  assign _zz_io_chosen_1 = io_chosenOH[4];
  assign _zz_io_chosen_2 = (io_chosenOH[1] || _zz_io_chosen);
  assign _zz_io_chosen_3 = (io_chosenOH[2] || _zz_io_chosen);
  assign io_chosen = {_zz_io_chosen_1,{_zz_io_chosen_3,_zz_io_chosen_2}};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b0;
      maskLocked_2 <= 1'b0;
      maskLocked_3 <= 1'b0;
      maskLocked_4 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
        maskLocked_2 <= maskRouted_2;
        maskLocked_3 <= maskRouted_3;
        maskLocked_4 <= maskRouted_4;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(when_Stream_l542) begin
        locked <= 1'b0;
      end
    end
  end


endmodule
