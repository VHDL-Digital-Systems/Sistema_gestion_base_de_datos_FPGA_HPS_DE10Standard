// tv_decoder_alt_vip_cl_csc_0.v

// This file was auto-generated from alt_vip_cl_csc_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module tv_decoder_alt_vip_cl_csc_0 (
		input  wire        main_clock,         // main_clock.clk
		input  wire        main_reset,         // main_reset.reset
		input  wire [23:0] din_data,           //        din.data
		input  wire        din_valid,          //           .valid
		input  wire        din_startofpacket,  //           .startofpacket
		input  wire        din_endofpacket,    //           .endofpacket
		output wire        din_ready,          //           .ready
		output wire [23:0] dout_data,          //       dout.data
		output wire        dout_valid,         //           .valid
		output wire        dout_startofpacket, //           .startofpacket
		output wire        dout_endofpacket,   //           .endofpacket
		input  wire        dout_ready          //           .ready
	);

	wire          video_in_resp_av_st_dout_valid;               // video_in_resp:av_st_dout_valid -> video_in_cmd:av_st_din_valid
	wire   [55:0] video_in_resp_av_st_dout_data;                // video_in_resp:av_st_dout_data -> video_in_cmd:av_st_din_data
	wire          video_in_resp_av_st_dout_ready;               // video_in_cmd:av_st_din_ready -> video_in_resp:av_st_dout_ready
	wire          video_in_resp_av_st_dout_startofpacket;       // video_in_resp:av_st_dout_startofpacket -> video_in_cmd:av_st_din_startofpacket
	wire          video_in_resp_av_st_dout_endofpacket;         // video_in_resp:av_st_dout_endofpacket -> video_in_cmd:av_st_din_endofpacket
	wire          video_in_cmd_av_st_dout_valid;                // video_in_cmd:av_st_dout_valid -> user_packet_demux:av_st_din_valid
	wire   [55:0] video_in_cmd_av_st_dout_data;                 // video_in_cmd:av_st_dout_data -> user_packet_demux:av_st_din_data
	wire          video_in_cmd_av_st_dout_ready;                // user_packet_demux:av_st_din_ready -> video_in_cmd:av_st_dout_ready
	wire          video_in_cmd_av_st_dout_startofpacket;        // video_in_cmd:av_st_dout_startofpacket -> user_packet_demux:av_st_din_startofpacket
	wire          video_in_cmd_av_st_dout_endofpacket;          // video_in_cmd:av_st_dout_endofpacket -> user_packet_demux:av_st_din_endofpacket
	wire          user_packet_demux_av_st_dout_0_valid;         // user_packet_demux:av_st_dout_valid_0 -> guard_band_in:av_st_din_valid
	wire   [55:0] user_packet_demux_av_st_dout_0_data;          // user_packet_demux:av_st_dout_data_0 -> guard_band_in:av_st_din_data
	wire          user_packet_demux_av_st_dout_0_ready;         // guard_band_in:av_st_din_ready -> user_packet_demux:av_st_dout_ready_0
	wire          user_packet_demux_av_st_dout_0_startofpacket; // user_packet_demux:av_st_dout_startofpacket_0 -> guard_band_in:av_st_din_startofpacket
	wire          user_packet_demux_av_st_dout_0_endofpacket;   // user_packet_demux:av_st_dout_endofpacket_0 -> guard_band_in:av_st_din_endofpacket
	wire          guard_band_in_av_st_dout_valid;               // guard_band_in:av_st_dout_valid -> csc_core:av_st_din_valid
	wire   [55:0] guard_band_in_av_st_dout_data;                // guard_band_in:av_st_dout_data -> csc_core:av_st_din_data
	wire          guard_band_in_av_st_dout_ready;               // csc_core:av_st_din_ready -> guard_band_in:av_st_dout_ready
	wire          guard_band_in_av_st_dout_startofpacket;       // guard_band_in:av_st_dout_startofpacket -> csc_core:av_st_din_startofpacket
	wire          guard_band_in_av_st_dout_endofpacket;         // guard_band_in:av_st_dout_endofpacket -> csc_core:av_st_din_endofpacket
	wire          csc_core_av_st_dout_valid;                    // csc_core:av_st_dout_valid -> user_packet_mux:av_st_din_valid_0
	wire   [55:0] csc_core_av_st_dout_data;                     // csc_core:av_st_dout_data -> user_packet_mux:av_st_din_data_0
	wire          csc_core_av_st_dout_ready;                    // user_packet_mux:av_st_din_ready_0 -> csc_core:av_st_dout_ready
	wire          csc_core_av_st_dout_startofpacket;            // csc_core:av_st_dout_startofpacket -> user_packet_mux:av_st_din_startofpacket_0
	wire          csc_core_av_st_dout_endofpacket;              // csc_core:av_st_dout_endofpacket -> user_packet_mux:av_st_din_endofpacket_0
	wire          user_packet_mux_av_st_dout_valid;             // user_packet_mux:av_st_dout_valid -> video_out:av_st_din_valid
	wire   [55:0] user_packet_mux_av_st_dout_data;              // user_packet_mux:av_st_dout_data -> video_out:av_st_din_data
	wire          user_packet_mux_av_st_dout_ready;             // video_out:av_st_din_ready -> user_packet_mux:av_st_dout_ready
	wire          user_packet_mux_av_st_dout_startofpacket;     // user_packet_mux:av_st_dout_startofpacket -> video_out:av_st_din_startofpacket
	wire          user_packet_mux_av_st_dout_endofpacket;       // user_packet_mux:av_st_dout_endofpacket -> video_out:av_st_din_endofpacket
	wire          user_packet_demux_av_st_dout_1_valid;         // user_packet_demux:av_st_dout_valid_1 -> bps_converter:av_st_din_valid
	wire   [55:0] user_packet_demux_av_st_dout_1_data;          // user_packet_demux:av_st_dout_data_1 -> bps_converter:av_st_din_data
	wire          user_packet_demux_av_st_dout_1_ready;         // bps_converter:av_st_din_ready -> user_packet_demux:av_st_dout_ready_1
	wire          user_packet_demux_av_st_dout_1_startofpacket; // user_packet_demux:av_st_dout_startofpacket_1 -> bps_converter:av_st_din_startofpacket
	wire          user_packet_demux_av_st_dout_1_endofpacket;   // user_packet_demux:av_st_dout_endofpacket_1 -> bps_converter:av_st_din_endofpacket
	wire          bps_converter_av_st_dout_valid;               // bps_converter:av_st_dout_valid -> user_packet_mux:av_st_din_valid_1
	wire   [55:0] bps_converter_av_st_dout_data;                // bps_converter:av_st_dout_data -> user_packet_mux:av_st_din_data_1
	wire          bps_converter_av_st_dout_ready;               // user_packet_mux:av_st_din_ready_1 -> bps_converter:av_st_dout_ready
	wire          bps_converter_av_st_dout_startofpacket;       // bps_converter:av_st_dout_startofpacket -> user_packet_mux:av_st_din_startofpacket_1
	wire          bps_converter_av_st_dout_endofpacket;         // bps_converter:av_st_dout_endofpacket -> user_packet_mux:av_st_din_endofpacket_1
	wire          video_in_resp_av_st_resp_valid;               // video_in_resp:av_st_resp_valid -> scheduler:av_st_resp_vib_valid
	wire   [63:0] video_in_resp_av_st_resp_data;                // video_in_resp:av_st_resp_data -> scheduler:av_st_resp_vib_data
	wire          video_in_resp_av_st_resp_ready;               // scheduler:av_st_resp_vib_ready -> video_in_resp:av_st_resp_ready
	wire          video_in_resp_av_st_resp_startofpacket;       // video_in_resp:av_st_resp_startofpacket -> scheduler:av_st_resp_vib_startofpacket
	wire          video_in_resp_av_st_resp_endofpacket;         // video_in_resp:av_st_resp_endofpacket -> scheduler:av_st_resp_vib_endofpacket
	wire          scheduler_av_st_cmd_vob_valid;                // scheduler:av_st_cmd_vob_valid -> video_out:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_vob_data;                 // scheduler:av_st_cmd_vob_data -> video_out:av_st_cmd_data
	wire          scheduler_av_st_cmd_vob_ready;                // video_out:av_st_cmd_ready -> scheduler:av_st_cmd_vob_ready
	wire          scheduler_av_st_cmd_vob_startofpacket;        // scheduler:av_st_cmd_vob_startofpacket -> video_out:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_vob_endofpacket;          // scheduler:av_st_cmd_vob_endofpacket -> video_out:av_st_cmd_endofpacket
	wire          scheduler_av_st_cmd_vib_valid;                // scheduler:av_st_cmd_vib_valid -> video_in_cmd:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_vib_data;                 // scheduler:av_st_cmd_vib_data -> video_in_cmd:av_st_cmd_data
	wire          scheduler_av_st_cmd_vib_ready;                // video_in_cmd:av_st_cmd_ready -> scheduler:av_st_cmd_vib_ready
	wire          scheduler_av_st_cmd_vib_startofpacket;        // scheduler:av_st_cmd_vib_startofpacket -> video_in_cmd:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_vib_endofpacket;          // scheduler:av_st_cmd_vib_endofpacket -> video_in_cmd:av_st_cmd_endofpacket
	wire          scheduler_av_st_cmd_mux_valid;                // scheduler:av_st_cmd_mux_valid -> user_packet_mux:av_st_cmd_valid
	wire   [63:0] scheduler_av_st_cmd_mux_data;                 // scheduler:av_st_cmd_mux_data -> user_packet_mux:av_st_cmd_data
	wire          scheduler_av_st_cmd_mux_ready;                // user_packet_mux:av_st_cmd_ready -> scheduler:av_st_cmd_mux_ready
	wire          scheduler_av_st_cmd_mux_startofpacket;        // scheduler:av_st_cmd_mux_startofpacket -> user_packet_mux:av_st_cmd_startofpacket
	wire          scheduler_av_st_cmd_mux_endofpacket;          // scheduler:av_st_cmd_mux_endofpacket -> user_packet_mux:av_st_cmd_endofpacket
	wire  [111:0] user_packet_demux_av_st_dout_data;            // port fragment
	wire    [1:0] user_packet_demux_av_st_dout_valid;           // port fragment
	wire    [1:0] user_packet_demux_av_st_dout_startofpacket;   // port fragment
	wire    [1:0] user_packet_demux_av_st_dout_endofpacket;     // port fragment
	wire    [1:0] user_packet_mux_av_st_din_ready;              // port fragment

	tv_decoder_alt_vip_cl_csc_0_csc_core csc_core (
		.clock                    (main_clock),                             // main_clock.clk
		.reset                    (main_reset),                             // main_reset.reset
		.av_st_din_valid          (guard_band_in_av_st_dout_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (guard_band_in_av_st_dout_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (guard_band_in_av_st_dout_endofpacket),   //           .endofpacket
		.av_st_din_data           (guard_band_in_av_st_dout_data),          //           .data
		.av_st_din_ready          (guard_band_in_av_st_dout_ready),         //           .ready
		.av_st_dout_valid         (csc_core_av_st_dout_valid),              // av_st_dout.valid
		.av_st_dout_startofpacket (csc_core_av_st_dout_startofpacket),      //           .startofpacket
		.av_st_dout_endofpacket   (csc_core_av_st_dout_endofpacket),        //           .endofpacket
		.av_st_dout_data          (csc_core_av_st_dout_data),               //           .data
		.av_st_dout_ready         (csc_core_av_st_dout_ready)               //           .ready
	);

	alt_vip_video_output_bridge #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.VIDEO_PROTOCOL_NO            (1),
		.READY_LATENCY_1              (1),
		.SOP_PRE_ALIGNED              (1),
		.MULTI_CONTEXT_SUPPORT        (0),
		.TYPE_11_SUPPORT              (0),
		.NO_CONCATENATION             (1),
		.PIPELINE_READY               (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8),
		.LOW_LATENCY_COMMAND_MODE     (0)
	) video_out (
		.clock                        (main_clock),                               //     main_clock.clk
		.reset                        (main_reset),                               //     main_reset.reset
		.av_st_cmd_valid              (scheduler_av_st_cmd_vob_valid),            //      av_st_cmd.valid
		.av_st_cmd_startofpacket      (scheduler_av_st_cmd_vob_startofpacket),    //               .startofpacket
		.av_st_cmd_endofpacket        (scheduler_av_st_cmd_vob_endofpacket),      //               .endofpacket
		.av_st_cmd_data               (scheduler_av_st_cmd_vob_data),             //               .data
		.av_st_cmd_ready              (scheduler_av_st_cmd_vob_ready),            //               .ready
		.av_st_din_valid              (user_packet_mux_av_st_dout_valid),         //      av_st_din.valid
		.av_st_din_startofpacket      (user_packet_mux_av_st_dout_startofpacket), //               .startofpacket
		.av_st_din_endofpacket        (user_packet_mux_av_st_dout_endofpacket),   //               .endofpacket
		.av_st_din_data               (user_packet_mux_av_st_dout_data),          //               .data
		.av_st_din_ready              (user_packet_mux_av_st_dout_ready),         //               .ready
		.av_st_vid_dout_data          (dout_data),                                // av_st_vid_dout.data
		.av_st_vid_dout_valid         (dout_valid),                               //               .valid
		.av_st_vid_dout_startofpacket (dout_startofpacket),                       //               .startofpacket
		.av_st_vid_dout_endofpacket   (dout_endofpacket),                         //               .endofpacket
		.av_st_vid_dout_ready         (dout_ready)                                //               .ready
	);

	alt_vip_video_input_bridge_resp #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.DEFAULT_LINE_LENGTH          (1920),
		.VIB_MODE                     ("LITE"),
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
	) video_in_resp (
		.clock                       (main_clock),                             //    main_clock.clk
		.reset                       (main_reset),                             //    main_reset.reset
		.av_st_vid_din_data          (din_data),                               // av_st_vid_din.data
		.av_st_vid_din_valid         (din_valid),                              //              .valid
		.av_st_vid_din_startofpacket (din_startofpacket),                      //              .startofpacket
		.av_st_vid_din_endofpacket   (din_endofpacket),                        //              .endofpacket
		.av_st_vid_din_ready         (din_ready),                              //              .ready
		.av_st_resp_valid            (video_in_resp_av_st_resp_valid),         //    av_st_resp.valid
		.av_st_resp_startofpacket    (video_in_resp_av_st_resp_startofpacket), //              .startofpacket
		.av_st_resp_endofpacket      (video_in_resp_av_st_resp_endofpacket),   //              .endofpacket
		.av_st_resp_data             (video_in_resp_av_st_resp_data),          //              .data
		.av_st_resp_ready            (video_in_resp_av_st_resp_ready),         //              .ready
		.av_st_dout_valid            (video_in_resp_av_st_dout_valid),         //    av_st_dout.valid
		.av_st_dout_startofpacket    (video_in_resp_av_st_dout_startofpacket), //              .startofpacket
		.av_st_dout_endofpacket      (video_in_resp_av_st_dout_endofpacket),   //              .endofpacket
		.av_st_dout_data             (video_in_resp_av_st_dout_data),          //              .data
		.av_st_dout_ready            (video_in_resp_av_st_dout_ready)          //              .ready
	);

	alt_vip_video_input_bridge_cmd #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.PIPELINE_READY               (0),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) video_in_cmd (
		.clock                    (main_clock),                             // main_clock.clk
		.reset                    (main_reset),                             // main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_vib_valid),          //  av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_vib_startofpacket),  //           .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_vib_endofpacket),    //           .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_vib_data),           //           .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_vib_ready),          //           .ready
		.av_st_din_valid          (video_in_resp_av_st_dout_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (video_in_resp_av_st_dout_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (video_in_resp_av_st_dout_endofpacket),   //           .endofpacket
		.av_st_din_data           (video_in_resp_av_st_dout_data),          //           .data
		.av_st_din_ready          (video_in_resp_av_st_dout_ready),         //           .ready
		.av_st_dout_valid         (video_in_cmd_av_st_dout_valid),          // av_st_dout.valid
		.av_st_dout_startofpacket (video_in_cmd_av_st_dout_startofpacket),  //           .startofpacket
		.av_st_dout_endofpacket   (video_in_cmd_av_st_dout_endofpacket),    //           .endofpacket
		.av_st_dout_data          (video_in_cmd_av_st_dout_data),           //           .data
		.av_st_dout_ready         (video_in_cmd_av_st_dout_ready)           //           .ready
	);

	alt_vip_csc_scheduler #(
		.COEFF_WIDTH         (18),
		.PIPELINE_READY      (0),
		.USER_PACKET_SUPPORT ("PASSTHROUGH"),
		.RUNTIME_CONTROL     (0),
		.LIMITED_READBACK    (0)
	) scheduler (
		.clock                        (main_clock),                             //     main_clock.clk
		.reset                        (main_reset),                             //     main_reset.reset
		.av_st_resp_vib_valid         (video_in_resp_av_st_resp_valid),         // av_st_resp_vib.valid
		.av_st_resp_vib_startofpacket (video_in_resp_av_st_resp_startofpacket), //               .startofpacket
		.av_st_resp_vib_endofpacket   (video_in_resp_av_st_resp_endofpacket),   //               .endofpacket
		.av_st_resp_vib_data          (video_in_resp_av_st_resp_data),          //               .data
		.av_st_resp_vib_ready         (video_in_resp_av_st_resp_ready),         //               .ready
		.av_st_cmd_vob_valid          (scheduler_av_st_cmd_vob_valid),          //  av_st_cmd_vob.valid
		.av_st_cmd_vob_startofpacket  (scheduler_av_st_cmd_vob_startofpacket),  //               .startofpacket
		.av_st_cmd_vob_endofpacket    (scheduler_av_st_cmd_vob_endofpacket),    //               .endofpacket
		.av_st_cmd_vob_data           (scheduler_av_st_cmd_vob_data),           //               .data
		.av_st_cmd_vob_ready          (scheduler_av_st_cmd_vob_ready),          //               .ready
		.av_st_cmd_vib_valid          (scheduler_av_st_cmd_vib_valid),          //  av_st_cmd_vib.valid
		.av_st_cmd_vib_startofpacket  (scheduler_av_st_cmd_vib_startofpacket),  //               .startofpacket
		.av_st_cmd_vib_endofpacket    (scheduler_av_st_cmd_vib_endofpacket),    //               .endofpacket
		.av_st_cmd_vib_data           (scheduler_av_st_cmd_vib_data),           //               .data
		.av_st_cmd_vib_ready          (scheduler_av_st_cmd_vib_ready),          //               .ready
		.av_st_cmd_mux_valid          (scheduler_av_st_cmd_mux_valid),          //  av_st_cmd_mux.valid
		.av_st_cmd_mux_startofpacket  (scheduler_av_st_cmd_mux_startofpacket),  //               .startofpacket
		.av_st_cmd_mux_endofpacket    (scheduler_av_st_cmd_mux_endofpacket),    //               .endofpacket
		.av_st_cmd_mux_data           (scheduler_av_st_cmd_mux_data),           //               .data
		.av_st_cmd_mux_ready          (scheduler_av_st_cmd_mux_ready)           //               .ready
	);

	alt_vip_packet_demux #(
		.NUM_OUTPUTS        (2),
		.CLIP_ADDRESS_BITS  (0),
		.SHIFT_ADDRESS_BITS (0),
		.REGISTER_OUTPUT    (1),
		.PIPELINE_READY     (1),
		.SRC_WIDTH          (8),
		.DST_WIDTH          (8),
		.CONTEXT_WIDTH      (8),
		.TASK_WIDTH         (8),
		.DATA_WIDTH_INT     (24),
		.USER_WIDTH_INT     (0)
	) user_packet_demux (
		.clock                    (main_clock),                                                                                    //   main_clock.clk
		.reset                    (main_reset),                                                                                    //   main_reset.reset
		.av_st_din_valid          (video_in_cmd_av_st_dout_valid),                                                                 //    av_st_din.valid
		.av_st_din_startofpacket  (video_in_cmd_av_st_dout_startofpacket),                                                         //             .startofpacket
		.av_st_din_endofpacket    (video_in_cmd_av_st_dout_endofpacket),                                                           //             .endofpacket
		.av_st_din_data           (video_in_cmd_av_st_dout_data),                                                                  //             .data
		.av_st_din_ready          (video_in_cmd_av_st_dout_ready),                                                                 //             .ready
		.av_st_dout_valid         ({user_packet_demux_av_st_dout_valid[1],user_packet_demux_av_st_dout_valid[0]}),                 // av_st_dout_0.valid
		.av_st_dout_startofpacket ({user_packet_demux_av_st_dout_startofpacket[1],user_packet_demux_av_st_dout_startofpacket[0]}), //             .startofpacket
		.av_st_dout_endofpacket   ({user_packet_demux_av_st_dout_endofpacket[1],user_packet_demux_av_st_dout_endofpacket[0]}),     //             .endofpacket
		.av_st_dout_data          ({user_packet_demux_av_st_dout_data[111:56],user_packet_demux_av_st_dout_data[55:0]}),           //             .data
		.av_st_dout_ready         ({user_packet_demux_av_st_dout_1_ready,user_packet_demux_av_st_dout_0_ready})                    //             .ready
	);

	alt_vip_bps_converter #(
		.INPUT_BITS_PER_SYMBOL        (8),
		.OUTPUT_BITS_PER_SYMBOL       (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.CONVERSION_MODE              ("LSB"),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) bps_converter (
		.clock                    (main_clock),                                   // main_clock.clk
		.reset                    (main_reset),                                   // main_reset.reset
		.av_st_din_valid          (user_packet_demux_av_st_dout_1_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (user_packet_demux_av_st_dout_1_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (user_packet_demux_av_st_dout_1_endofpacket),   //           .endofpacket
		.av_st_din_data           (user_packet_demux_av_st_dout_1_data),          //           .data
		.av_st_din_ready          (user_packet_demux_av_st_dout_1_ready),         //           .ready
		.av_st_dout_valid         (bps_converter_av_st_dout_valid),               // av_st_dout.valid
		.av_st_dout_startofpacket (bps_converter_av_st_dout_startofpacket),       //           .startofpacket
		.av_st_dout_endofpacket   (bps_converter_av_st_dout_endofpacket),         //           .endofpacket
		.av_st_dout_data          (bps_converter_av_st_dout_data),                //           .data
		.av_st_dout_ready         (bps_converter_av_st_dout_ready)                //           .ready
	);

	alt_vip_packet_mux #(
		.NUM_INPUTS      (2),
		.REGISTER_OUTPUT (0),
		.PIPELINE_READY  (1),
		.NAME            ("undefined"),
		.SRC_WIDTH       (8),
		.DST_WIDTH       (8),
		.CONTEXT_WIDTH   (8),
		.TASK_WIDTH      (8),
		.DATA_WIDTH_INT  (24),
		.USER_WIDTH_INT  (0)
	) user_packet_mux (
		.clock                    (main_clock),                                                                 //  main_clock.clk
		.reset                    (main_reset),                                                                 //  main_reset.reset
		.av_st_cmd_valid          (scheduler_av_st_cmd_mux_valid),                                              //   av_st_cmd.valid
		.av_st_cmd_startofpacket  (scheduler_av_st_cmd_mux_startofpacket),                                      //            .startofpacket
		.av_st_cmd_endofpacket    (scheduler_av_st_cmd_mux_endofpacket),                                        //            .endofpacket
		.av_st_cmd_data           (scheduler_av_st_cmd_mux_data),                                               //            .data
		.av_st_cmd_ready          (scheduler_av_st_cmd_mux_ready),                                              //            .ready
		.av_st_din_valid          ({bps_converter_av_st_dout_valid,csc_core_av_st_dout_valid}),                 // av_st_din_0.valid
		.av_st_din_startofpacket  ({bps_converter_av_st_dout_startofpacket,csc_core_av_st_dout_startofpacket}), //            .startofpacket
		.av_st_din_endofpacket    ({bps_converter_av_st_dout_endofpacket,csc_core_av_st_dout_endofpacket}),     //            .endofpacket
		.av_st_din_data           ({bps_converter_av_st_dout_data[55:0],csc_core_av_st_dout_data[55:0]}),       //            .data
		.av_st_din_ready          ({user_packet_mux_av_st_din_ready[1],user_packet_mux_av_st_din_ready[0]}),    //            .ready
		.av_st_dout_valid         (user_packet_mux_av_st_dout_valid),                                           //  av_st_dout.valid
		.av_st_dout_startofpacket (user_packet_mux_av_st_dout_startofpacket),                                   //            .startofpacket
		.av_st_dout_endofpacket   (user_packet_mux_av_st_dout_endofpacket),                                     //            .endofpacket
		.av_st_dout_data          (user_packet_mux_av_st_dout_data),                                            //            .data
		.av_st_dout_ready         (user_packet_mux_av_st_dout_ready)                                            //            .ready
	);

	alt_vip_guard_bands_alg_core #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.IS_422                       (0),
		.SIGNED_INPUT                 (0),
		.SIGNED_OUTPUT                (0),
		.ENABLE_CMD_PORT              (0),
		.OUTPUT_GUARD_BAND_LOWER_0    (16),
		.OUTPUT_GUARD_BAND_UPPER_0    (240),
		.OUTPUT_GUARD_BAND_LOWER_1    (16),
		.OUTPUT_GUARD_BAND_UPPER_1    (240),
		.OUTPUT_GUARD_BAND_LOWER_2    (16),
		.OUTPUT_GUARD_BAND_UPPER_2    (240),
		.OUTPUT_GUARD_BAND_LOWER_3    (0),
		.OUTPUT_GUARD_BAND_UPPER_3    (255),
		.PIPELINE_READY               (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8),
		.SOURCE_ID                    (0)
	) guard_band_in (
		.clock                    (main_clock),                                   // main_clock.clk
		.reset                    (main_reset),                                   // main_reset.reset
		.av_st_din_valid          (user_packet_demux_av_st_dout_0_valid),         //  av_st_din.valid
		.av_st_din_startofpacket  (user_packet_demux_av_st_dout_0_startofpacket), //           .startofpacket
		.av_st_din_endofpacket    (user_packet_demux_av_st_dout_0_endofpacket),   //           .endofpacket
		.av_st_din_data           (user_packet_demux_av_st_dout_0_data),          //           .data
		.av_st_din_ready          (user_packet_demux_av_st_dout_0_ready),         //           .ready
		.av_st_dout_valid         (guard_band_in_av_st_dout_valid),               // av_st_dout.valid
		.av_st_dout_startofpacket (guard_band_in_av_st_dout_startofpacket),       //           .startofpacket
		.av_st_dout_endofpacket   (guard_band_in_av_st_dout_endofpacket),         //           .endofpacket
		.av_st_dout_data          (guard_band_in_av_st_dout_data),                //           .data
		.av_st_dout_ready         (guard_band_in_av_st_dout_ready)                //           .ready
	);

	assign user_packet_demux_av_st_dout_0_valid = { user_packet_demux_av_st_dout_valid[0] };

	assign user_packet_demux_av_st_dout_0_data = { user_packet_demux_av_st_dout_data[55:0] };

	assign user_packet_demux_av_st_dout_0_startofpacket = { user_packet_demux_av_st_dout_startofpacket[0] };

	assign user_packet_demux_av_st_dout_0_endofpacket = { user_packet_demux_av_st_dout_endofpacket[0] };

	assign csc_core_av_st_dout_ready = { user_packet_mux_av_st_din_ready[0] };

	assign user_packet_demux_av_st_dout_1_valid = { user_packet_demux_av_st_dout_valid[1] };

	assign user_packet_demux_av_st_dout_1_data = { user_packet_demux_av_st_dout_data[111:56] };

	assign user_packet_demux_av_st_dout_1_startofpacket = { user_packet_demux_av_st_dout_startofpacket[1] };

	assign user_packet_demux_av_st_dout_1_endofpacket = { user_packet_demux_av_st_dout_endofpacket[1] };

	assign bps_converter_av_st_dout_ready = { user_packet_mux_av_st_din_ready[1] };

endmodule
