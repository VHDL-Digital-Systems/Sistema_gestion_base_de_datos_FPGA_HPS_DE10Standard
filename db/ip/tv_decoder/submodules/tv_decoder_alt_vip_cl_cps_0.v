// tv_decoder_alt_vip_cl_cps_0.v

// This file was auto-generated from alt_vip_cl_cps_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module tv_decoder_alt_vip_cl_cps_0 #(
		parameter BITS_PER_SYMBOL     = 8,
		parameter USER_PACKET_SUPPORT = "PASSTHROUGH"
	) (
		input  wire        main_clock,           // main_clock.clk
		input  wire        main_reset,           // main_reset.reset
		input  wire [7:0]  din_0_data,           //      din_0.data
		input  wire        din_0_valid,          //           .valid
		input  wire        din_0_startofpacket,  //           .startofpacket
		input  wire        din_0_endofpacket,    //           .endofpacket
		output wire        din_0_ready,          //           .ready
		output wire [15:0] dout_0_data,          //     dout_0.data
		output wire        dout_0_valid,         //           .valid
		output wire        dout_0_startofpacket, //           .startofpacket
		output wire        dout_0_endofpacket,   //           .endofpacket
		input  wire        dout_0_ready          //           .ready
	);

	wire         video_in_resp_0_av_st_dout_valid;            // video_in_resp_0:av_st_dout_valid -> video_in_cmd_0:av_st_din_valid
	wire  [39:0] video_in_resp_0_av_st_dout_data;             // video_in_resp_0:av_st_dout_data -> video_in_cmd_0:av_st_din_data
	wire         video_in_resp_0_av_st_dout_ready;            // video_in_cmd_0:av_st_din_ready -> video_in_resp_0:av_st_dout_ready
	wire         video_in_resp_0_av_st_dout_startofpacket;    // video_in_resp_0:av_st_dout_startofpacket -> video_in_cmd_0:av_st_din_startofpacket
	wire         video_in_resp_0_av_st_dout_endofpacket;      // video_in_resp_0:av_st_dout_endofpacket -> video_in_cmd_0:av_st_din_endofpacket
	wire         video_in_cmd_0_av_st_dout_valid;             // video_in_cmd_0:av_st_dout_valid -> cps_core:av_st_din_0_valid
	wire  [39:0] video_in_cmd_0_av_st_dout_data;              // video_in_cmd_0:av_st_dout_data -> cps_core:av_st_din_0_data
	wire         video_in_cmd_0_av_st_dout_ready;             // cps_core:av_st_din_0_ready -> video_in_cmd_0:av_st_dout_ready
	wire         video_in_cmd_0_av_st_dout_startofpacket;     // video_in_cmd_0:av_st_dout_startofpacket -> cps_core:av_st_din_0_startofpacket
	wire         video_in_cmd_0_av_st_dout_endofpacket;       // video_in_cmd_0:av_st_dout_endofpacket -> cps_core:av_st_din_0_endofpacket
	wire         cps_core_av_st_dout_0_valid;                 // cps_core:av_st_dout_0_valid -> video_out_0:av_st_din_valid
	wire  [47:0] cps_core_av_st_dout_0_data;                  // cps_core:av_st_dout_0_data -> video_out_0:av_st_din_data
	wire         cps_core_av_st_dout_0_ready;                 // video_out_0:av_st_din_ready -> cps_core:av_st_dout_0_ready
	wire         cps_core_av_st_dout_0_startofpacket;         // cps_core:av_st_dout_0_startofpacket -> video_out_0:av_st_din_startofpacket
	wire         cps_core_av_st_dout_0_endofpacket;           // cps_core:av_st_dout_0_endofpacket -> video_out_0:av_st_din_endofpacket
	wire         video_in_resp_0_av_st_resp_valid;            // video_in_resp_0:av_st_resp_valid -> cps_scheduler:av_st_resp_vib_0_valid
	wire  [63:0] video_in_resp_0_av_st_resp_data;             // video_in_resp_0:av_st_resp_data -> cps_scheduler:av_st_resp_vib_0_data
	wire         video_in_resp_0_av_st_resp_ready;            // cps_scheduler:av_st_resp_vib_0_ready -> video_in_resp_0:av_st_resp_ready
	wire         video_in_resp_0_av_st_resp_startofpacket;    // video_in_resp_0:av_st_resp_startofpacket -> cps_scheduler:av_st_resp_vib_0_startofpacket
	wire         video_in_resp_0_av_st_resp_endofpacket;      // video_in_resp_0:av_st_resp_endofpacket -> cps_scheduler:av_st_resp_vib_0_endofpacket
	wire         cps_scheduler_av_st_cmd_vib_0_valid;         // cps_scheduler:av_st_cmd_vib_0_valid -> video_in_cmd_0:av_st_cmd_valid
	wire  [63:0] cps_scheduler_av_st_cmd_vib_0_data;          // cps_scheduler:av_st_cmd_vib_0_data -> video_in_cmd_0:av_st_cmd_data
	wire         cps_scheduler_av_st_cmd_vib_0_ready;         // video_in_cmd_0:av_st_cmd_ready -> cps_scheduler:av_st_cmd_vib_0_ready
	wire         cps_scheduler_av_st_cmd_vib_0_startofpacket; // cps_scheduler:av_st_cmd_vib_0_startofpacket -> video_in_cmd_0:av_st_cmd_startofpacket
	wire         cps_scheduler_av_st_cmd_vib_0_endofpacket;   // cps_scheduler:av_st_cmd_vib_0_endofpacket -> video_in_cmd_0:av_st_cmd_endofpacket
	wire         cps_scheduler_av_st_cmd_vob_0_valid;         // cps_scheduler:av_st_cmd_vob_0_valid -> video_out_0:av_st_cmd_valid
	wire  [63:0] cps_scheduler_av_st_cmd_vob_0_data;          // cps_scheduler:av_st_cmd_vob_0_data -> video_out_0:av_st_cmd_data
	wire         cps_scheduler_av_st_cmd_vob_0_ready;         // video_out_0:av_st_cmd_ready -> cps_scheduler:av_st_cmd_vob_0_ready
	wire         cps_scheduler_av_st_cmd_vob_0_startofpacket; // cps_scheduler:av_st_cmd_vob_0_startofpacket -> video_out_0:av_st_cmd_startofpacket
	wire         cps_scheduler_av_st_cmd_vob_0_endofpacket;   // cps_scheduler:av_st_cmd_vob_0_endofpacket -> video_out_0:av_st_cmd_endofpacket

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (BITS_PER_SYMBOL != 8)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					bits_per_symbol_check ( .error(1'b1) );
		end
		if (USER_PACKET_SUPPORT != "PASSTHROUGH")
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					user_packet_support_check ( .error(1'b1) );
		end
	endgenerate

	tv_decoder_alt_vip_cl_cps_0_cps_core #(
		.BITS_PER_SYMBOL                       (8),
		.NUMBER_OF_INPUTS                      (1),
		.NUMBER_OF_OUTPUTS                     (1),
		.INPUT_0_NUMBER_OF_COLOR_PLANES        (2),
		.INPUT_0_COLOR_PLANES_ARE_IN_PARALLEL  (0),
		.INPUT_0_PIXELS_IN_PARALLEL            (1),
		.INPUT_0_TWO_PIXELS_PATTERN            (0),
		.INPUT_1_NUMBER_OF_COLOR_PLANES        (3),
		.INPUT_1_COLOR_PLANES_ARE_IN_PARALLEL  (1),
		.INPUT_1_PIXELS_IN_PARALLEL            (1),
		.INPUT_1_TWO_PIXELS_PATTERN            (0),
		.OUTPUT_0_NUMBER_OF_COLOR_PLANES       (2),
		.OUTPUT_0_COLOR_PLANES_ARE_IN_PARALLEL (1),
		.OUTPUT_0_PIXELS_IN_PARALLEL           (1),
		.OUTPUT_0_TWO_PIXELS_PATTERN           (0),
		.OUTPUT_1_NUMBER_OF_COLOR_PLANES       (3),
		.OUTPUT_1_COLOR_PLANES_ARE_IN_PARALLEL (1),
		.OUTPUT_1_PIXELS_IN_PARALLEL           (1),
		.OUTPUT_1_TWO_PIXELS_PATTERN           (0),
		.PIPELINE_READY                        (1),
		.NUMBER_ROUTING_ENGINES                (1),
		.SRC_WIDTH                             (8),
		.DST_WIDTH                             (8),
		.CONTEXT_WIDTH                         (8),
		.TASK_WIDTH                            (8)
	) cps_core (
		.clock                      (main_clock),                              //   main_clock.clk
		.reset                      (main_reset),                              //   main_reset.reset
		.av_st_din_0_valid          (video_in_cmd_0_av_st_dout_valid),         //  av_st_din_0.valid
		.av_st_din_0_startofpacket  (video_in_cmd_0_av_st_dout_startofpacket), //             .startofpacket
		.av_st_din_0_endofpacket    (video_in_cmd_0_av_st_dout_endofpacket),   //             .endofpacket
		.av_st_din_0_data           (video_in_cmd_0_av_st_dout_data),          //             .data
		.av_st_din_0_ready          (video_in_cmd_0_av_st_dout_ready),         //             .ready
		.av_st_dout_0_valid         (cps_core_av_st_dout_0_valid),             // av_st_dout_0.valid
		.av_st_dout_0_startofpacket (cps_core_av_st_dout_0_startofpacket),     //             .startofpacket
		.av_st_dout_0_endofpacket   (cps_core_av_st_dout_0_endofpacket),       //             .endofpacket
		.av_st_dout_0_data          (cps_core_av_st_dout_0_data),              //             .data
		.av_st_dout_0_ready         (cps_core_av_st_dout_0_ready)              //             .ready
	);

	alt_vip_cps_scheduler #(
		.NUMBER_OF_INPUTS       (1),
		.NUMBER_OF_OUTPUTS      (1),
		.OUTPUT_0_WIDTH_MOD     (0),
		.OUTPUT_1_WIDTH_MOD     (0),
		.LINE_SPLITTING_ALLOWED (0),
		.USER_PACKET_SUPPORT    ("PASSTHROUGH"),
		.USER_PKT_0_TO_0        (0),
		.USER_PKT_1_TO_0        (0),
		.USER_PKT_0_TO_1        (0),
		.USER_PKT_1_TO_1        (1),
		.PIPELINE_READY         (0),
		.SRC_WIDTH              (8),
		.DST_WIDTH              (8),
		.CONTEXT_WIDTH          (8),
		.TASK_WIDTH             (8)
	) cps_scheduler (
		.clock                          (main_clock),                                  //       main_clock.clk
		.reset                          (main_reset),                                  //       main_reset.reset
		.av_st_resp_vib_0_valid         (video_in_resp_0_av_st_resp_valid),            // av_st_resp_vib_0.valid
		.av_st_resp_vib_0_startofpacket (video_in_resp_0_av_st_resp_startofpacket),    //                 .startofpacket
		.av_st_resp_vib_0_endofpacket   (video_in_resp_0_av_st_resp_endofpacket),      //                 .endofpacket
		.av_st_resp_vib_0_data          (video_in_resp_0_av_st_resp_data),             //                 .data
		.av_st_resp_vib_0_ready         (video_in_resp_0_av_st_resp_ready),            //                 .ready
		.av_st_cmd_vib_0_valid          (cps_scheduler_av_st_cmd_vib_0_valid),         //  av_st_cmd_vib_0.valid
		.av_st_cmd_vib_0_startofpacket  (cps_scheduler_av_st_cmd_vib_0_startofpacket), //                 .startofpacket
		.av_st_cmd_vib_0_endofpacket    (cps_scheduler_av_st_cmd_vib_0_endofpacket),   //                 .endofpacket
		.av_st_cmd_vib_0_data           (cps_scheduler_av_st_cmd_vib_0_data),          //                 .data
		.av_st_cmd_vib_0_ready          (cps_scheduler_av_st_cmd_vib_0_ready),         //                 .ready
		.av_st_cmd_vob_0_valid          (cps_scheduler_av_st_cmd_vob_0_valid),         //  av_st_cmd_vob_0.valid
		.av_st_cmd_vob_0_startofpacket  (cps_scheduler_av_st_cmd_vob_0_startofpacket), //                 .startofpacket
		.av_st_cmd_vob_0_endofpacket    (cps_scheduler_av_st_cmd_vob_0_endofpacket),   //                 .endofpacket
		.av_st_cmd_vob_0_data           (cps_scheduler_av_st_cmd_vob_0_data),          //                 .data
		.av_st_cmd_vob_0_ready          (cps_scheduler_av_st_cmd_vob_0_ready)          //                 .ready
	);

	alt_vip_video_input_bridge_resp #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (0),
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
	) video_in_resp_0 (
		.clock                       (main_clock),                               //    main_clock.clk
		.reset                       (main_reset),                               //    main_reset.reset
		.av_st_vid_din_data          (din_0_data),                               // av_st_vid_din.data
		.av_st_vid_din_valid         (din_0_valid),                              //              .valid
		.av_st_vid_din_startofpacket (din_0_startofpacket),                      //              .startofpacket
		.av_st_vid_din_endofpacket   (din_0_endofpacket),                        //              .endofpacket
		.av_st_vid_din_ready         (din_0_ready),                              //              .ready
		.av_st_resp_valid            (video_in_resp_0_av_st_resp_valid),         //    av_st_resp.valid
		.av_st_resp_startofpacket    (video_in_resp_0_av_st_resp_startofpacket), //              .startofpacket
		.av_st_resp_endofpacket      (video_in_resp_0_av_st_resp_endofpacket),   //              .endofpacket
		.av_st_resp_data             (video_in_resp_0_av_st_resp_data),          //              .data
		.av_st_resp_ready            (video_in_resp_0_av_st_resp_ready),         //              .ready
		.av_st_dout_valid            (video_in_resp_0_av_st_dout_valid),         //    av_st_dout.valid
		.av_st_dout_startofpacket    (video_in_resp_0_av_st_dout_startofpacket), //              .startofpacket
		.av_st_dout_endofpacket      (video_in_resp_0_av_st_dout_endofpacket),   //              .endofpacket
		.av_st_dout_data             (video_in_resp_0_av_st_dout_data),          //              .data
		.av_st_dout_ready            (video_in_resp_0_av_st_dout_ready)          //              .ready
	);

	alt_vip_video_input_bridge_cmd #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (0),
		.PIXELS_IN_PARALLEL           (1),
		.PIPELINE_READY               (1),
		.DATA_SRC_ADDRESS             (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8)
	) video_in_cmd_0 (
		.clock                    (main_clock),                                  // main_clock.clk
		.reset                    (main_reset),                                  // main_reset.reset
		.av_st_cmd_valid          (cps_scheduler_av_st_cmd_vib_0_valid),         //  av_st_cmd.valid
		.av_st_cmd_startofpacket  (cps_scheduler_av_st_cmd_vib_0_startofpacket), //           .startofpacket
		.av_st_cmd_endofpacket    (cps_scheduler_av_st_cmd_vib_0_endofpacket),   //           .endofpacket
		.av_st_cmd_data           (cps_scheduler_av_st_cmd_vib_0_data),          //           .data
		.av_st_cmd_ready          (cps_scheduler_av_st_cmd_vib_0_ready),         //           .ready
		.av_st_din_valid          (video_in_resp_0_av_st_dout_valid),            //  av_st_din.valid
		.av_st_din_startofpacket  (video_in_resp_0_av_st_dout_startofpacket),    //           .startofpacket
		.av_st_din_endofpacket    (video_in_resp_0_av_st_dout_endofpacket),      //           .endofpacket
		.av_st_din_data           (video_in_resp_0_av_st_dout_data),             //           .data
		.av_st_din_ready          (video_in_resp_0_av_st_dout_ready),            //           .ready
		.av_st_dout_valid         (video_in_cmd_0_av_st_dout_valid),             // av_st_dout.valid
		.av_st_dout_startofpacket (video_in_cmd_0_av_st_dout_startofpacket),     //           .startofpacket
		.av_st_dout_endofpacket   (video_in_cmd_0_av_st_dout_endofpacket),       //           .endofpacket
		.av_st_dout_data          (video_in_cmd_0_av_st_dout_data),              //           .data
		.av_st_dout_ready         (video_in_cmd_0_av_st_dout_ready)              //           .ready
	);

	alt_vip_video_output_bridge #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.VIDEO_PROTOCOL_NO            (1),
		.READY_LATENCY_1              (1),
		.SOP_PRE_ALIGNED              (0),
		.MULTI_CONTEXT_SUPPORT        (0),
		.TYPE_11_SUPPORT              (0),
		.NO_CONCATENATION             (0),
		.PIPELINE_READY               (0),
		.SRC_WIDTH                    (8),
		.DST_WIDTH                    (8),
		.CONTEXT_WIDTH                (8),
		.TASK_WIDTH                   (8),
		.LOW_LATENCY_COMMAND_MODE     (0)
	) video_out_0 (
		.clock                        (main_clock),                                  //     main_clock.clk
		.reset                        (main_reset),                                  //     main_reset.reset
		.av_st_cmd_valid              (cps_scheduler_av_st_cmd_vob_0_valid),         //      av_st_cmd.valid
		.av_st_cmd_startofpacket      (cps_scheduler_av_st_cmd_vob_0_startofpacket), //               .startofpacket
		.av_st_cmd_endofpacket        (cps_scheduler_av_st_cmd_vob_0_endofpacket),   //               .endofpacket
		.av_st_cmd_data               (cps_scheduler_av_st_cmd_vob_0_data),          //               .data
		.av_st_cmd_ready              (cps_scheduler_av_st_cmd_vob_0_ready),         //               .ready
		.av_st_din_valid              (cps_core_av_st_dout_0_valid),                 //      av_st_din.valid
		.av_st_din_startofpacket      (cps_core_av_st_dout_0_startofpacket),         //               .startofpacket
		.av_st_din_endofpacket        (cps_core_av_st_dout_0_endofpacket),           //               .endofpacket
		.av_st_din_data               (cps_core_av_st_dout_0_data),                  //               .data
		.av_st_din_ready              (cps_core_av_st_dout_0_ready),                 //               .ready
		.av_st_vid_dout_data          (dout_0_data),                                 // av_st_vid_dout.data
		.av_st_vid_dout_valid         (dout_0_valid),                                //               .valid
		.av_st_vid_dout_startofpacket (dout_0_startofpacket),                        //               .startofpacket
		.av_st_vid_dout_endofpacket   (dout_0_endofpacket),                          //               .endofpacket
		.av_st_vid_dout_ready         (dout_0_ready)                                 //               .ready
	);

endmodule
