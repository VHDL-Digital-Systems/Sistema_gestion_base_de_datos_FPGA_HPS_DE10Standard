// tv_decoder_alt_vip_cl_dil_0_video_in.v

// This file was auto-generated from alt_vip_video_input_bridge_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module tv_decoder_alt_vip_cl_dil_0_video_in (
		input  wire        main_clock_clk,              //    main_clock.clk
		input  wire        main_reset_reset,            //    main_reset.reset
		input  wire [15:0] av_st_vid_din_data,          // av_st_vid_din.data
		input  wire        av_st_vid_din_valid,         //              .valid
		input  wire        av_st_vid_din_startofpacket, //              .startofpacket
		input  wire        av_st_vid_din_endofpacket,   //              .endofpacket
		output wire        av_st_vid_din_ready,         //              .ready
		input  wire        av_st_cmd_valid,             //     av_st_cmd.valid
		input  wire        av_st_cmd_startofpacket,     //              .startofpacket
		input  wire        av_st_cmd_endofpacket,       //              .endofpacket
		input  wire [63:0] av_st_cmd_data,              //              .data
		output wire        av_st_cmd_ready,             //              .ready
		output wire        av_st_resp_valid,            //    av_st_resp.valid
		output wire        av_st_resp_startofpacket,    //              .startofpacket
		output wire        av_st_resp_endofpacket,      //              .endofpacket
		output wire [63:0] av_st_resp_data,             //              .data
		input  wire        av_st_resp_ready,            //              .ready
		output wire        av_st_dout_valid,            //    av_st_dout.valid
		output wire        av_st_dout_startofpacket,    //              .startofpacket
		output wire        av_st_dout_endofpacket,      //              .endofpacket
		output wire [47:0] av_st_dout_data,             //              .data
		input  wire        av_st_dout_ready             //              .ready
	);

	wire         vid_front_av_st_dout_valid;         // vid_front:av_st_dout_valid -> vid_back:av_st_din_valid
	wire  [47:0] vid_front_av_st_dout_data;          // vid_front:av_st_dout_data -> vid_back:av_st_din_data
	wire         vid_front_av_st_dout_ready;         // vid_back:av_st_din_ready -> vid_front:av_st_dout_ready
	wire         vid_front_av_st_dout_startofpacket; // vid_front:av_st_dout_startofpacket -> vid_back:av_st_din_startofpacket
	wire         vid_front_av_st_dout_endofpacket;   // vid_front:av_st_dout_endofpacket -> vid_back:av_st_din_endofpacket

	alt_vip_video_input_bridge_resp #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.DEFAULT_LINE_LENGTH          (4096),
		.VIB_MODE                     ("FULL"),
		.VIDEO_PROTOCOL_NO            (1),
		.READY_LATENCY_1              (1),
		.MAX_WIDTH                    (1920),
		.MAX_HEIGHT                   (1080),
		.ENABLE_RESOLUTION_CHECK      (0),
		.MULTI_CONTEXT_SUPPORT        (0),
		.PIPELINE_READY               (0),
		.RESP_SRC_ADDRESS             (0),
		.RESP_DST_ADDRESS             (0),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) vid_front (
		.clock                       (main_clock_clk),                     //    main_clock.clk
		.reset                       (main_reset_reset),                   //    main_reset.reset
		.av_st_vid_din_data          (av_st_vid_din_data),                 // av_st_vid_din.data
		.av_st_vid_din_valid         (av_st_vid_din_valid),                //              .valid
		.av_st_vid_din_startofpacket (av_st_vid_din_startofpacket),        //              .startofpacket
		.av_st_vid_din_endofpacket   (av_st_vid_din_endofpacket),          //              .endofpacket
		.av_st_vid_din_ready         (av_st_vid_din_ready),                //              .ready
		.av_st_resp_valid            (av_st_resp_valid),                   //    av_st_resp.valid
		.av_st_resp_startofpacket    (av_st_resp_startofpacket),           //              .startofpacket
		.av_st_resp_endofpacket      (av_st_resp_endofpacket),             //              .endofpacket
		.av_st_resp_data             (av_st_resp_data),                    //              .data
		.av_st_resp_ready            (av_st_resp_ready),                   //              .ready
		.av_st_dout_valid            (vid_front_av_st_dout_valid),         //    av_st_dout.valid
		.av_st_dout_startofpacket    (vid_front_av_st_dout_startofpacket), //              .startofpacket
		.av_st_dout_endofpacket      (vid_front_av_st_dout_endofpacket),   //              .endofpacket
		.av_st_dout_data             (vid_front_av_st_dout_data),          //              .data
		.av_st_dout_ready            (vid_front_av_st_dout_ready)          //              .ready
	);

	alt_vip_video_input_bridge_cmd #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.PIPELINE_READY               (0),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) vid_back (
		.clock                    (main_clock_clk),                     // main_clock.clk
		.reset                    (main_reset_reset),                   // main_reset.reset
		.av_st_cmd_valid          (av_st_cmd_valid),                    //  av_st_cmd.valid
		.av_st_cmd_startofpacket  (av_st_cmd_startofpacket),            //           .startofpacket
		.av_st_cmd_endofpacket    (av_st_cmd_endofpacket),              //           .endofpacket
		.av_st_cmd_data           (av_st_cmd_data),                     //           .data
		.av_st_cmd_ready          (av_st_cmd_ready),                    //           .ready
		.av_st_din_valid          (vid_front_av_st_dout_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (vid_front_av_st_dout_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (vid_front_av_st_dout_endofpacket),   //           .endofpacket
		.av_st_din_data           (vid_front_av_st_dout_data),          //           .data
		.av_st_din_ready          (vid_front_av_st_dout_ready),         //           .ready
		.av_st_dout_valid         (av_st_dout_valid),                   // av_st_dout.valid
		.av_st_dout_startofpacket (av_st_dout_startofpacket),           //           .startofpacket
		.av_st_dout_endofpacket   (av_st_dout_endofpacket),             //           .endofpacket
		.av_st_dout_data          (av_st_dout_data),                    //           .data
		.av_st_dout_ready         (av_st_dout_ready)                    //           .ready
	);

endmodule
