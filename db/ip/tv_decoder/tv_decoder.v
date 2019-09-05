// tv_decoder.v

// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module tv_decoder (
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_clk,            // alt_vip_cl_cvi_0_clocked_video.vid_clk
		input  wire [7:0]  alt_vip_cl_cvi_0_clocked_video_vid_data,           //                               .vid_data
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_de,             //                               .vid_de
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_datavalid,      //                               .vid_datavalid
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_locked,         //                               .vid_locked
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_f,              //                               .vid_f
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_v_sync,         //                               .vid_v_sync
		input  wire        alt_vip_cl_cvi_0_clocked_video_vid_h_sync,         //                               .vid_h_sync
		input  wire [7:0]  alt_vip_cl_cvi_0_clocked_video_vid_color_encoding, //                               .vid_color_encoding
		input  wire [7:0]  alt_vip_cl_cvi_0_clocked_video_vid_bit_width,      //                               .vid_bit_width
		output wire        alt_vip_cl_cvi_0_clocked_video_sof,                //                               .sof
		output wire        alt_vip_cl_cvi_0_clocked_video_sof_locked,         //                               .sof_locked
		output wire        alt_vip_cl_cvi_0_clocked_video_refclk_div,         //                               .refclk_div
		output wire        alt_vip_cl_cvi_0_clocked_video_clipping,           //                               .clipping
		output wire        alt_vip_cl_cvi_0_clocked_video_padding,            //                               .padding
		output wire        alt_vip_cl_cvi_0_clocked_video_overflow,           //                               .overflow
		input  wire [4:0]  alt_vip_cl_cvi_0_control_address,                  //       alt_vip_cl_cvi_0_control.address
		input  wire        alt_vip_cl_cvi_0_control_read,                     //                               .read
		output wire [31:0] alt_vip_cl_cvi_0_control_readdata,                 //                               .readdata
		input  wire        alt_vip_cl_cvi_0_control_write,                    //                               .write
		input  wire [31:0] alt_vip_cl_cvi_0_control_writedata,                //                               .writedata
		input  wire [3:0]  alt_vip_cl_cvi_0_control_byteenable,               //                               .byteenable
		output wire        alt_vip_cl_cvi_0_control_waitrequest,              //                               .waitrequest
		input  wire [6:0]  alt_vip_cl_scl_0_control_address,                  //       alt_vip_cl_scl_0_control.address
		input  wire [3:0]  alt_vip_cl_scl_0_control_byteenable,               //                               .byteenable
		input  wire        alt_vip_cl_scl_0_control_write,                    //                               .write
		input  wire [31:0] alt_vip_cl_scl_0_control_writedata,                //                               .writedata
		input  wire        alt_vip_cl_scl_0_control_read,                     //                               .read
		output wire [31:0] alt_vip_cl_scl_0_control_readdata,                 //                               .readdata
		output wire        alt_vip_cl_scl_0_control_readdatavalid,            //                               .readdatavalid
		output wire        alt_vip_cl_scl_0_control_waitrequest,              //                               .waitrequest
		output wire [23:0] alt_vip_cl_vfb_0_dout_data,                        //          alt_vip_cl_vfb_0_dout.data
		output wire        alt_vip_cl_vfb_0_dout_valid,                       //                               .valid
		output wire        alt_vip_cl_vfb_0_dout_startofpacket,               //                               .startofpacket
		output wire        alt_vip_cl_vfb_0_dout_endofpacket,                 //                               .endofpacket
		input  wire        alt_vip_cl_vfb_0_dout_ready,                       //                               .ready
		input  wire        clk_50_clk,                                        //                         clk_50.clk
		input  wire        clk_50_reset_reset_n,                              //                   clk_50_reset.reset_n
		output wire [12:0] zs_addr_from_the_sdram,                            //                     sdram_wire.addr
		output wire [1:0]  zs_ba_from_the_sdram,                              //                               .ba
		output wire        zs_cas_n_from_the_sdram,                           //                               .cas_n
		output wire        zs_cke_from_the_sdram,                             //                               .cke
		output wire        zs_cs_n_from_the_sdram,                            //                               .cs_n
		inout  wire [15:0] zs_dq_to_and_from_the_sdram,                       //                               .dq
		output wire [1:0]  zs_dqm_from_the_sdram,                             //                               .dqm
		output wire        zs_ras_n_from_the_sdram,                           //                               .ras_n
		output wire        zs_we_n_from_the_sdram,                            //                               .we_n
		input  wire        vip_clk_clk                                        //                        vip_clk.clk
	);

	wire         alt_vip_cl_crs_0_dout_valid;                  // alt_vip_cl_crs_0:dout_valid -> alt_vip_cl_csc_0:din_valid
	wire  [23:0] alt_vip_cl_crs_0_dout_data;                   // alt_vip_cl_crs_0:dout_data -> alt_vip_cl_csc_0:din_data
	wire         alt_vip_cl_crs_0_dout_ready;                  // alt_vip_cl_csc_0:din_ready -> alt_vip_cl_crs_0:dout_ready
	wire         alt_vip_cl_crs_0_dout_startofpacket;          // alt_vip_cl_crs_0:dout_startofpacket -> alt_vip_cl_csc_0:din_startofpacket
	wire         alt_vip_cl_crs_0_dout_endofpacket;            // alt_vip_cl_crs_0:dout_endofpacket -> alt_vip_cl_csc_0:din_endofpacket
	wire         alt_vip_cl_dil_0_dout_valid;                  // alt_vip_cl_dil_0:dout_valid -> alt_vip_cl_clp_0:din_valid
	wire  [15:0] alt_vip_cl_dil_0_dout_data;                   // alt_vip_cl_dil_0:dout_data -> alt_vip_cl_clp_0:din_data
	wire         alt_vip_cl_dil_0_dout_ready;                  // alt_vip_cl_clp_0:din_ready -> alt_vip_cl_dil_0:dout_ready
	wire         alt_vip_cl_dil_0_dout_startofpacket;          // alt_vip_cl_dil_0:dout_startofpacket -> alt_vip_cl_clp_0:din_startofpacket
	wire         alt_vip_cl_dil_0_dout_endofpacket;            // alt_vip_cl_dil_0:dout_endofpacket -> alt_vip_cl_clp_0:din_endofpacket
	wire         alt_vip_cl_clp_0_dout_valid;                  // alt_vip_cl_clp_0:dout_valid -> alt_vip_cl_crs_0:din_valid
	wire  [15:0] alt_vip_cl_clp_0_dout_data;                   // alt_vip_cl_clp_0:dout_data -> alt_vip_cl_crs_0:din_data
	wire         alt_vip_cl_clp_0_dout_ready;                  // alt_vip_cl_crs_0:din_ready -> alt_vip_cl_clp_0:dout_ready
	wire         alt_vip_cl_clp_0_dout_startofpacket;          // alt_vip_cl_clp_0:dout_startofpacket -> alt_vip_cl_crs_0:din_startofpacket
	wire         alt_vip_cl_clp_0_dout_endofpacket;            // alt_vip_cl_clp_0:dout_endofpacket -> alt_vip_cl_crs_0:din_endofpacket
	wire         alt_vip_cl_csc_0_dout_valid;                  // alt_vip_cl_csc_0:dout_valid -> alt_vip_cl_scl_0:din_valid
	wire  [23:0] alt_vip_cl_csc_0_dout_data;                   // alt_vip_cl_csc_0:dout_data -> alt_vip_cl_scl_0:din_data
	wire         alt_vip_cl_csc_0_dout_ready;                  // alt_vip_cl_scl_0:din_ready -> alt_vip_cl_csc_0:dout_ready
	wire         alt_vip_cl_csc_0_dout_startofpacket;          // alt_vip_cl_csc_0:dout_startofpacket -> alt_vip_cl_scl_0:din_startofpacket
	wire         alt_vip_cl_csc_0_dout_endofpacket;            // alt_vip_cl_csc_0:dout_endofpacket -> alt_vip_cl_scl_0:din_endofpacket
	wire         alt_vip_cl_scl_0_dout_valid;                  // alt_vip_cl_scl_0:dout_valid -> alt_vip_cl_vfb_0:din_valid
	wire  [23:0] alt_vip_cl_scl_0_dout_data;                   // alt_vip_cl_scl_0:dout_data -> alt_vip_cl_vfb_0:din_data
	wire         alt_vip_cl_scl_0_dout_ready;                  // alt_vip_cl_vfb_0:din_ready -> alt_vip_cl_scl_0:dout_ready
	wire         alt_vip_cl_scl_0_dout_startofpacket;          // alt_vip_cl_scl_0:dout_startofpacket -> alt_vip_cl_vfb_0:din_startofpacket
	wire         alt_vip_cl_scl_0_dout_endofpacket;            // alt_vip_cl_scl_0:dout_endofpacket -> alt_vip_cl_vfb_0:din_endofpacket
	wire         alt_vip_cl_cps_0_dout_0_valid;                // alt_vip_cl_cps_0:dout_0_valid -> alt_vip_cl_dil_0:din_valid
	wire  [15:0] alt_vip_cl_cps_0_dout_0_data;                 // alt_vip_cl_cps_0:dout_0_data -> alt_vip_cl_dil_0:din_data
	wire         alt_vip_cl_cps_0_dout_0_ready;                // alt_vip_cl_dil_0:din_ready -> alt_vip_cl_cps_0:dout_0_ready
	wire         alt_vip_cl_cps_0_dout_0_startofpacket;        // alt_vip_cl_cps_0:dout_0_startofpacket -> alt_vip_cl_dil_0:din_startofpacket
	wire         alt_vip_cl_cps_0_dout_0_endofpacket;          // alt_vip_cl_cps_0:dout_0_endofpacket -> alt_vip_cl_dil_0:din_endofpacket
	wire         alt_vip_cl_cvi_0_dout_0_valid;                // alt_vip_cl_cvi_0:dout_0_valid -> alt_vip_cl_cps_0:din_0_valid
	wire   [7:0] alt_vip_cl_cvi_0_dout_0_data;                 // alt_vip_cl_cvi_0:dout_0_data -> alt_vip_cl_cps_0:din_0_data
	wire         alt_vip_cl_cvi_0_dout_0_ready;                // alt_vip_cl_cps_0:din_0_ready -> alt_vip_cl_cvi_0:dout_0_ready
	wire         alt_vip_cl_cvi_0_dout_0_startofpacket;        // alt_vip_cl_cvi_0:dout_0_startofpacket -> alt_vip_cl_cps_0:din_0_startofpacket
	wire         alt_vip_cl_cvi_0_dout_0_endofpacket;          // alt_vip_cl_cvi_0:dout_0_endofpacket -> alt_vip_cl_cps_0:din_0_endofpacket
	wire         alt_vip_cl_vfb_0_mem_master_rd_waitrequest;   // mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_rd_waitrequest -> alt_vip_cl_vfb_0:mem_master_rd_waitrequest
	wire  [31:0] alt_vip_cl_vfb_0_mem_master_rd_readdata;      // mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_rd_readdata -> alt_vip_cl_vfb_0:mem_master_rd_readdata
	wire  [31:0] alt_vip_cl_vfb_0_mem_master_rd_address;       // alt_vip_cl_vfb_0:mem_master_rd_address -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_rd_address
	wire         alt_vip_cl_vfb_0_mem_master_rd_read;          // alt_vip_cl_vfb_0:mem_master_rd_read -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_rd_read
	wire         alt_vip_cl_vfb_0_mem_master_rd_readdatavalid; // mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_rd_readdatavalid -> alt_vip_cl_vfb_0:mem_master_rd_readdatavalid
	wire   [2:0] alt_vip_cl_vfb_0_mem_master_rd_burstcount;    // alt_vip_cl_vfb_0:mem_master_rd_burstcount -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_rd_burstcount
	wire         alt_vip_cl_vfb_0_mem_master_wr_waitrequest;   // mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_wr_waitrequest -> alt_vip_cl_vfb_0:mem_master_wr_waitrequest
	wire  [31:0] alt_vip_cl_vfb_0_mem_master_wr_address;       // alt_vip_cl_vfb_0:mem_master_wr_address -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_wr_address
	wire   [3:0] alt_vip_cl_vfb_0_mem_master_wr_byteenable;    // alt_vip_cl_vfb_0:mem_master_wr_byteenable -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_wr_byteenable
	wire         alt_vip_cl_vfb_0_mem_master_wr_write;         // alt_vip_cl_vfb_0:mem_master_wr_write -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_wr_write
	wire  [31:0] alt_vip_cl_vfb_0_mem_master_wr_writedata;     // alt_vip_cl_vfb_0:mem_master_wr_writedata -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_wr_writedata
	wire   [2:0] alt_vip_cl_vfb_0_mem_master_wr_burstcount;    // alt_vip_cl_vfb_0:mem_master_wr_burstcount -> mm_interconnect_0:alt_vip_cl_vfb_0_mem_master_wr_burstcount
	wire         mm_interconnect_0_sdram_s1_chipselect;        // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;          // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;       // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [24:0] mm_interconnect_0_sdram_s1_address;           // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_read;              // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;        // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid;     // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;             // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;         // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire         rst_controller_reset_out_reset;               // rst_controller:reset_out -> [alt_vip_cl_clp_0:main_reset, alt_vip_cl_cps_0:main_reset, alt_vip_cl_crs_0:main_reset, alt_vip_cl_csc_0:main_reset, alt_vip_cl_cvi_0:main_reset_reset, alt_vip_cl_dil_0:av_st_reset, alt_vip_cl_scl_0:main_reset, alt_vip_cl_vfb_0:main_reset, mm_interconnect_0:alt_vip_cl_vfb_0_main_reset_reset_bridge_in_reset_reset, sdram:reset_n]

	tv_decoder_alt_vip_cl_clp_0 #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (2),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.MAX_IN_WIDTH                 (720),
		.MAX_IN_HEIGHT                (576),
		.CLIPPING_METHOD              ("RECTANGLE"),
		.LEFT_OFFSET                  (0),
		.RIGHT_OFFSET                 (0),
		.TOP_OFFSET                   (24),
		.BOTTOM_OFFSET                (0),
		.RECTANGLE_WIDTH              (720),
		.RECTANGLE_HEIGHT             (480),
		.USER_PACKET_SUPPORT          ("PASSTHROUGH"),
		.RUNTIME_CONTROL              (0),
		.LIMITED_READBACK             (0)
	) alt_vip_cl_clp_0 (
		.main_clock         (vip_clk_clk),                         // main_clock.clk
		.main_reset         (rst_controller_reset_out_reset),      // main_reset.reset
		.din_data           (alt_vip_cl_dil_0_dout_data),          //        din.data
		.din_valid          (alt_vip_cl_dil_0_dout_valid),         //           .valid
		.din_startofpacket  (alt_vip_cl_dil_0_dout_startofpacket), //           .startofpacket
		.din_endofpacket    (alt_vip_cl_dil_0_dout_endofpacket),   //           .endofpacket
		.din_ready          (alt_vip_cl_dil_0_dout_ready),         //           .ready
		.dout_data          (alt_vip_cl_clp_0_dout_data),          //       dout.data
		.dout_valid         (alt_vip_cl_clp_0_dout_valid),         //           .valid
		.dout_startofpacket (alt_vip_cl_clp_0_dout_startofpacket), //           .startofpacket
		.dout_endofpacket   (alt_vip_cl_clp_0_dout_endofpacket),   //           .endofpacket
		.dout_ready         (alt_vip_cl_clp_0_dout_ready)          //           .ready
	);

	tv_decoder_alt_vip_cl_cps_0 #(
		.BITS_PER_SYMBOL     (8),
		.USER_PACKET_SUPPORT ("PASSTHROUGH")
	) alt_vip_cl_cps_0 (
		.main_clock           (vip_clk_clk),                           // main_clock.clk
		.main_reset           (rst_controller_reset_out_reset),        // main_reset.reset
		.din_0_data           (alt_vip_cl_cvi_0_dout_0_data),          //      din_0.data
		.din_0_valid          (alt_vip_cl_cvi_0_dout_0_valid),         //           .valid
		.din_0_startofpacket  (alt_vip_cl_cvi_0_dout_0_startofpacket), //           .startofpacket
		.din_0_endofpacket    (alt_vip_cl_cvi_0_dout_0_endofpacket),   //           .endofpacket
		.din_0_ready          (alt_vip_cl_cvi_0_dout_0_ready),         //           .ready
		.dout_0_data          (alt_vip_cl_cps_0_dout_0_data),          //     dout_0.data
		.dout_0_valid         (alt_vip_cl_cps_0_dout_0_valid),         //           .valid
		.dout_0_startofpacket (alt_vip_cl_cps_0_dout_0_startofpacket), //           .startofpacket
		.dout_0_endofpacket   (alt_vip_cl_cps_0_dout_0_endofpacket),   //           .endofpacket
		.dout_0_ready         (alt_vip_cl_cps_0_dout_0_ready)          //           .ready
	);

	tv_decoder_alt_vip_cl_crs_0 alt_vip_cl_crs_0 (
		.main_clock         (vip_clk_clk),                         // main_clock.clk
		.main_reset         (rst_controller_reset_out_reset),      // main_reset.reset
		.din_data           (alt_vip_cl_clp_0_dout_data),          //        din.data
		.din_valid          (alt_vip_cl_clp_0_dout_valid),         //           .valid
		.din_startofpacket  (alt_vip_cl_clp_0_dout_startofpacket), //           .startofpacket
		.din_endofpacket    (alt_vip_cl_clp_0_dout_endofpacket),   //           .endofpacket
		.din_ready          (alt_vip_cl_clp_0_dout_ready),         //           .ready
		.dout_data          (alt_vip_cl_crs_0_dout_data),          //       dout.data
		.dout_valid         (alt_vip_cl_crs_0_dout_valid),         //           .valid
		.dout_startofpacket (alt_vip_cl_crs_0_dout_startofpacket), //           .startofpacket
		.dout_endofpacket   (alt_vip_cl_crs_0_dout_endofpacket),   //           .endofpacket
		.dout_ready         (alt_vip_cl_crs_0_dout_ready)          //           .ready
	);

	tv_decoder_alt_vip_cl_csc_0 alt_vip_cl_csc_0 (
		.main_clock         (vip_clk_clk),                         // main_clock.clk
		.main_reset         (rst_controller_reset_out_reset),      // main_reset.reset
		.din_data           (alt_vip_cl_crs_0_dout_data),          //        din.data
		.din_valid          (alt_vip_cl_crs_0_dout_valid),         //           .valid
		.din_startofpacket  (alt_vip_cl_crs_0_dout_startofpacket), //           .startofpacket
		.din_endofpacket    (alt_vip_cl_crs_0_dout_endofpacket),   //           .endofpacket
		.din_ready          (alt_vip_cl_crs_0_dout_ready),         //           .ready
		.dout_data          (alt_vip_cl_csc_0_dout_data),          //       dout.data
		.dout_valid         (alt_vip_cl_csc_0_dout_valid),         //           .valid
		.dout_startofpacket (alt_vip_cl_csc_0_dout_startofpacket), //           .startofpacket
		.dout_endofpacket   (alt_vip_cl_csc_0_dout_endofpacket),   //           .endofpacket
		.dout_ready         (alt_vip_cl_csc_0_dout_ready)          //           .ready
	);

	tv_decoder_alt_vip_cl_cvi_0 #(
		.BPS                           (8),
		.NUMBER_OF_COLOUR_PLANES       (2),
		.COLOUR_PLANES_ARE_IN_PARALLEL (0),
		.SYNC_TO                       (0),
		.MATCH_CTRLDATA_PKT_CLIP_BASIC (0),
		.MATCH_CTRLDATA_PKT_PAD_ADV    (0),
		.OVERFLOW_HANDLING             (0),
		.USE_EMBEDDED_SYNCS            (1),
		.USE_HDMI_DEPRICATION          (0),
		.GENERATE_VID_F                (0),
		.USE_STD                       (0),
		.STD_WIDTH                     (1),
		.GENERATE_ANC                  (0),
		.ANC_DEPTH                     (1),
		.EXTRACT_TOTAL_RESOLUTION      (1),
		.INTERLACED                    (1),
		.H_ACTIVE_PIXELS_F0            (720),
		.V_ACTIVE_LINES_F0             (288),
		.V_ACTIVE_LINES_F1             (288),
		.FIFO_DEPTH                    (2048),
		.CLOCKS_ARE_SAME               (0),
		.USE_CONTROL                   (1)
	) alt_vip_cl_cvi_0 (
		.main_clock_clk                   (vip_clk_clk),                                       //        main_clock.clk
		.main_reset_reset                 (rst_controller_reset_out_reset),                    //        main_reset.reset
		.dout_0_data                      (alt_vip_cl_cvi_0_dout_0_data),                      //            dout_0.data
		.dout_0_valid                     (alt_vip_cl_cvi_0_dout_0_valid),                     //                  .valid
		.dout_0_startofpacket             (alt_vip_cl_cvi_0_dout_0_startofpacket),             //                  .startofpacket
		.dout_0_endofpacket               (alt_vip_cl_cvi_0_dout_0_endofpacket),               //                  .endofpacket
		.dout_0_ready                     (alt_vip_cl_cvi_0_dout_0_ready),                     //                  .ready
		.clocked_video_vid_clk            (alt_vip_cl_cvi_0_clocked_video_vid_clk),            //     clocked_video.vid_clk
		.clocked_video_vid_data           (alt_vip_cl_cvi_0_clocked_video_vid_data),           //                  .vid_data
		.clocked_video_vid_de             (alt_vip_cl_cvi_0_clocked_video_vid_de),             //                  .vid_de
		.clocked_video_vid_datavalid      (alt_vip_cl_cvi_0_clocked_video_vid_datavalid),      //                  .vid_datavalid
		.clocked_video_vid_locked         (alt_vip_cl_cvi_0_clocked_video_vid_locked),         //                  .vid_locked
		.clocked_video_vid_f              (alt_vip_cl_cvi_0_clocked_video_vid_f),              //                  .vid_f
		.clocked_video_vid_v_sync         (alt_vip_cl_cvi_0_clocked_video_vid_v_sync),         //                  .vid_v_sync
		.clocked_video_vid_h_sync         (alt_vip_cl_cvi_0_clocked_video_vid_h_sync),         //                  .vid_h_sync
		.clocked_video_vid_color_encoding (alt_vip_cl_cvi_0_clocked_video_vid_color_encoding), //                  .vid_color_encoding
		.clocked_video_vid_bit_width      (alt_vip_cl_cvi_0_clocked_video_vid_bit_width),      //                  .vid_bit_width
		.clocked_video_sof                (alt_vip_cl_cvi_0_clocked_video_sof),                //                  .sof
		.clocked_video_sof_locked         (alt_vip_cl_cvi_0_clocked_video_sof_locked),         //                  .sof_locked
		.clocked_video_refclk_div         (alt_vip_cl_cvi_0_clocked_video_refclk_div),         //                  .refclk_div
		.clocked_video_clipping           (alt_vip_cl_cvi_0_clocked_video_clipping),           //                  .clipping
		.clocked_video_padding            (alt_vip_cl_cvi_0_clocked_video_padding),            //                  .padding
		.clocked_video_overflow           (alt_vip_cl_cvi_0_clocked_video_overflow),           //                  .overflow
		.control_address                  (alt_vip_cl_cvi_0_control_address),                  //           control.address
		.control_read                     (alt_vip_cl_cvi_0_control_read),                     //                  .read
		.control_readdata                 (alt_vip_cl_cvi_0_control_readdata),                 //                  .readdata
		.control_write                    (alt_vip_cl_cvi_0_control_write),                    //                  .write
		.control_writedata                (alt_vip_cl_cvi_0_control_writedata),                //                  .writedata
		.control_byteenable               (alt_vip_cl_cvi_0_control_byteenable),               //                  .byteenable
		.control_waitrequest              (alt_vip_cl_cvi_0_control_waitrequest),              //                  .waitrequest
		.status_update_irq_irq            ()                                                   // status_update_irq.irq
	);

	tv_decoder_alt_vip_cl_dil_0 #(
		.MAX_WIDTH                        (720),
		.MAX_HEIGHT                       (576),
		.USER_PACKET_SUPPORT              ("PASSTHROUGH"),
		.USER_PACKET_FIFO_DEPTH           (0),
		.PIXELS_IN_PARALLEL               (1),
		.BITS_PER_SYMBOL                  (8),
		.NUMBER_OF_COLOR_PLANES           (2),
		.COLOR_PLANES_ARE_IN_PARALLEL     (1),
		.SWAP_F0_F1                       (0),
		.DEINTERLACE_ALGORITHM            ("BOB"),
		.MOTION_BLEED                     (1),
		.RUNTIME_CONTROL                  (0),
		.MOTION_BPS                       (7),
		.IS_422                           (1),
		.CADENCE_DETECTION                (0),
		.CADENCE_ALGORITHM_NAME           ("CADENCE_32_22_VOF"),
		.CLOCKS_ARE_SEPARATE              (0),
		.MEM_PORT_WIDTH                   (256),
		.WRITE_MASTER_FIFO_DEPTH          (64),
		.WRITE_MASTER_BURST_TARGET        (32),
		.EDI_READ_MASTER_FIFO_DEPTH       (64),
		.EDI_READ_MASTER_BURST_TARGET     (32),
		.MA_READ_MASTER_FIFO_DEPTH        (64),
		.MA_READ_MASTER_BURST_TARGET      (32),
		.MOTION_WRITE_MASTER_FIFO_DEPTH   (64),
		.MOTION_WRITE_MASTER_BURST_TARGET (32),
		.MOTION_READ_MASTER_FIFO_DEPTH    (64),
		.MOTION_READ_MASTER_BURST_TARGET  (32),
		.MEM_BASE_ADDR                    (0)
	) alt_vip_cl_dil_0 (
		.av_st_clock        (vip_clk_clk),                           // av_st_clock.clk
		.av_st_reset        (rst_controller_reset_out_reset),        // av_st_reset.reset
		.din_data           (alt_vip_cl_cps_0_dout_0_data),          //         din.data
		.din_valid          (alt_vip_cl_cps_0_dout_0_valid),         //            .valid
		.din_startofpacket  (alt_vip_cl_cps_0_dout_0_startofpacket), //            .startofpacket
		.din_endofpacket    (alt_vip_cl_cps_0_dout_0_endofpacket),   //            .endofpacket
		.din_ready          (alt_vip_cl_cps_0_dout_0_ready),         //            .ready
		.dout_data          (alt_vip_cl_dil_0_dout_data),            //        dout.data
		.dout_valid         (alt_vip_cl_dil_0_dout_valid),           //            .valid
		.dout_startofpacket (alt_vip_cl_dil_0_dout_startofpacket),   //            .startofpacket
		.dout_endofpacket   (alt_vip_cl_dil_0_dout_endofpacket),     //            .endofpacket
		.dout_ready         (alt_vip_cl_dil_0_dout_ready)            //            .ready
	);

	tv_decoder_alt_vip_cl_scl_0 alt_vip_cl_scl_0 (
		.main_clock            (vip_clk_clk),                            // main_clock.clk
		.main_reset            (rst_controller_reset_out_reset),         // main_reset.reset
		.din_data              (alt_vip_cl_csc_0_dout_data),             //        din.data
		.din_valid             (alt_vip_cl_csc_0_dout_valid),            //           .valid
		.din_startofpacket     (alt_vip_cl_csc_0_dout_startofpacket),    //           .startofpacket
		.din_endofpacket       (alt_vip_cl_csc_0_dout_endofpacket),      //           .endofpacket
		.din_ready             (alt_vip_cl_csc_0_dout_ready),            //           .ready
		.dout_data             (alt_vip_cl_scl_0_dout_data),             //       dout.data
		.dout_valid            (alt_vip_cl_scl_0_dout_valid),            //           .valid
		.dout_startofpacket    (alt_vip_cl_scl_0_dout_startofpacket),    //           .startofpacket
		.dout_endofpacket      (alt_vip_cl_scl_0_dout_endofpacket),      //           .endofpacket
		.dout_ready            (alt_vip_cl_scl_0_dout_ready),            //           .ready
		.control_address       (alt_vip_cl_scl_0_control_address),       //    control.address
		.control_byteenable    (alt_vip_cl_scl_0_control_byteenable),    //           .byteenable
		.control_write         (alt_vip_cl_scl_0_control_write),         //           .write
		.control_writedata     (alt_vip_cl_scl_0_control_writedata),     //           .writedata
		.control_read          (alt_vip_cl_scl_0_control_read),          //           .read
		.control_readdata      (alt_vip_cl_scl_0_control_readdata),      //           .readdata
		.control_readdatavalid (alt_vip_cl_scl_0_control_readdatavalid), //           .readdatavalid
		.control_waitrequest   (alt_vip_cl_scl_0_control_waitrequest)    //           .waitrequest
	);

	tv_decoder_alt_vip_cl_vfb_0 #(
		.BITS_PER_SYMBOL              (8),
		.NUMBER_OF_COLOR_PLANES       (3),
		.COLOR_PLANES_ARE_IN_PARALLEL (1),
		.PIXELS_IN_PARALLEL           (1),
		.READY_LATENCY                (1),
		.MAX_WIDTH                    (1024),
		.MAX_HEIGHT                   (768),
		.CLOCKS_ARE_SEPARATE          (0),
		.MEM_PORT_WIDTH               (32),
		.MEM_BASE_ADDR                (0),
		.BURST_ALIGNMENT              (1),
		.WRITE_FIFO_DEPTH             (512),
		.WRITE_BURST_TARGET           (4),
		.READ_FIFO_DEPTH              (512),
		.READ_BURST_TARGET            (4),
		.WRITER_RUNTIME_CONTROL       (0),
		.READER_RUNTIME_CONTROL       (0),
		.IS_FRAME_WRITER              (0),
		.IS_FRAME_READER              (0),
		.DROP_FRAMES                  (1),
		.REPEAT_FRAMES                (1),
		.DROP_REPEAT_USER             (1),
		.INTERLACED_SUPPORT           (0),
		.CONTROLLED_DROP_REPEAT       (0),
		.DROP_INVALID_FIELDS          (1),
		.MULTI_FRAME_DELAY            (1),
		.IS_SYNC_MASTER               (0),
		.IS_SYNC_SLAVE                (0),
		.USER_PACKETS_MAX_STORAGE     (0),
		.MAX_SYMBOLS_PER_PACKET       (10),
		.NUM_BUFFERS                  (3)
	) alt_vip_cl_vfb_0 (
		.main_clock                  (vip_clk_clk),                                  //    main_clock.clk
		.main_reset                  (rst_controller_reset_out_reset),               //    main_reset.reset
		.din_data                    (alt_vip_cl_scl_0_dout_data),                   //           din.data
		.din_valid                   (alt_vip_cl_scl_0_dout_valid),                  //              .valid
		.din_startofpacket           (alt_vip_cl_scl_0_dout_startofpacket),          //              .startofpacket
		.din_endofpacket             (alt_vip_cl_scl_0_dout_endofpacket),            //              .endofpacket
		.din_ready                   (alt_vip_cl_scl_0_dout_ready),                  //              .ready
		.mem_master_wr_address       (alt_vip_cl_vfb_0_mem_master_wr_address),       // mem_master_wr.address
		.mem_master_wr_burstcount    (alt_vip_cl_vfb_0_mem_master_wr_burstcount),    //              .burstcount
		.mem_master_wr_waitrequest   (alt_vip_cl_vfb_0_mem_master_wr_waitrequest),   //              .waitrequest
		.mem_master_wr_write         (alt_vip_cl_vfb_0_mem_master_wr_write),         //              .write
		.mem_master_wr_writedata     (alt_vip_cl_vfb_0_mem_master_wr_writedata),     //              .writedata
		.mem_master_wr_byteenable    (alt_vip_cl_vfb_0_mem_master_wr_byteenable),    //              .byteenable
		.dout_data                   (alt_vip_cl_vfb_0_dout_data),                   //          dout.data
		.dout_valid                  (alt_vip_cl_vfb_0_dout_valid),                  //              .valid
		.dout_startofpacket          (alt_vip_cl_vfb_0_dout_startofpacket),          //              .startofpacket
		.dout_endofpacket            (alt_vip_cl_vfb_0_dout_endofpacket),            //              .endofpacket
		.dout_ready                  (alt_vip_cl_vfb_0_dout_ready),                  //              .ready
		.mem_master_rd_address       (alt_vip_cl_vfb_0_mem_master_rd_address),       // mem_master_rd.address
		.mem_master_rd_burstcount    (alt_vip_cl_vfb_0_mem_master_rd_burstcount),    //              .burstcount
		.mem_master_rd_waitrequest   (alt_vip_cl_vfb_0_mem_master_rd_waitrequest),   //              .waitrequest
		.mem_master_rd_read          (alt_vip_cl_vfb_0_mem_master_rd_read),          //              .read
		.mem_master_rd_readdata      (alt_vip_cl_vfb_0_mem_master_rd_readdata),      //              .readdata
		.mem_master_rd_readdatavalid (alt_vip_cl_vfb_0_mem_master_rd_readdatavalid)  //              .readdatavalid
	);

	tv_decoder_sdram sdram (
		.clk            (vip_clk_clk),                              //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),          // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (zs_addr_from_the_sdram),                   //  wire.export
		.zs_ba          (zs_ba_from_the_sdram),                     //      .export
		.zs_cas_n       (zs_cas_n_from_the_sdram),                  //      .export
		.zs_cke         (zs_cke_from_the_sdram),                    //      .export
		.zs_cs_n        (zs_cs_n_from_the_sdram),                   //      .export
		.zs_dq          (zs_dq_to_and_from_the_sdram),              //      .export
		.zs_dqm         (zs_dqm_from_the_sdram),                    //      .export
		.zs_ras_n       (zs_ras_n_from_the_sdram),                  //      .export
		.zs_we_n        (zs_we_n_from_the_sdram)                    //      .export
	);

	tv_decoder_mm_interconnect_0 mm_interconnect_0 (
		.clk_vip_clk_clk                                         (vip_clk_clk),                                  //                                       clk_vip_clk.clk
		.alt_vip_cl_vfb_0_main_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),               // alt_vip_cl_vfb_0_main_reset_reset_bridge_in_reset.reset
		.alt_vip_cl_vfb_0_mem_master_rd_address                  (alt_vip_cl_vfb_0_mem_master_rd_address),       //                    alt_vip_cl_vfb_0_mem_master_rd.address
		.alt_vip_cl_vfb_0_mem_master_rd_waitrequest              (alt_vip_cl_vfb_0_mem_master_rd_waitrequest),   //                                                  .waitrequest
		.alt_vip_cl_vfb_0_mem_master_rd_burstcount               (alt_vip_cl_vfb_0_mem_master_rd_burstcount),    //                                                  .burstcount
		.alt_vip_cl_vfb_0_mem_master_rd_read                     (alt_vip_cl_vfb_0_mem_master_rd_read),          //                                                  .read
		.alt_vip_cl_vfb_0_mem_master_rd_readdata                 (alt_vip_cl_vfb_0_mem_master_rd_readdata),      //                                                  .readdata
		.alt_vip_cl_vfb_0_mem_master_rd_readdatavalid            (alt_vip_cl_vfb_0_mem_master_rd_readdatavalid), //                                                  .readdatavalid
		.alt_vip_cl_vfb_0_mem_master_wr_address                  (alt_vip_cl_vfb_0_mem_master_wr_address),       //                    alt_vip_cl_vfb_0_mem_master_wr.address
		.alt_vip_cl_vfb_0_mem_master_wr_waitrequest              (alt_vip_cl_vfb_0_mem_master_wr_waitrequest),   //                                                  .waitrequest
		.alt_vip_cl_vfb_0_mem_master_wr_burstcount               (alt_vip_cl_vfb_0_mem_master_wr_burstcount),    //                                                  .burstcount
		.alt_vip_cl_vfb_0_mem_master_wr_byteenable               (alt_vip_cl_vfb_0_mem_master_wr_byteenable),    //                                                  .byteenable
		.alt_vip_cl_vfb_0_mem_master_wr_write                    (alt_vip_cl_vfb_0_mem_master_wr_write),         //                                                  .write
		.alt_vip_cl_vfb_0_mem_master_wr_writedata                (alt_vip_cl_vfb_0_mem_master_wr_writedata),     //                                                  .writedata
		.sdram_s1_address                                        (mm_interconnect_0_sdram_s1_address),           //                                          sdram_s1.address
		.sdram_s1_write                                          (mm_interconnect_0_sdram_s1_write),             //                                                  .write
		.sdram_s1_read                                           (mm_interconnect_0_sdram_s1_read),              //                                                  .read
		.sdram_s1_readdata                                       (mm_interconnect_0_sdram_s1_readdata),          //                                                  .readdata
		.sdram_s1_writedata                                      (mm_interconnect_0_sdram_s1_writedata),         //                                                  .writedata
		.sdram_s1_byteenable                                     (mm_interconnect_0_sdram_s1_byteenable),        //                                                  .byteenable
		.sdram_s1_readdatavalid                                  (mm_interconnect_0_sdram_s1_readdatavalid),     //                                                  .readdatavalid
		.sdram_s1_waitrequest                                    (mm_interconnect_0_sdram_s1_waitrequest),       //                                                  .waitrequest
		.sdram_s1_chipselect                                     (mm_interconnect_0_sdram_s1_chipselect)         //                                                  .chipselect
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~clk_50_reset_reset_n),          // reset_in0.reset
		.clk            (vip_clk_clk),                    //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule