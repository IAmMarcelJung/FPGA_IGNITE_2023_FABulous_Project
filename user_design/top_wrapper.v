module top_wrapper;
    localparam GPIO_MODE_OUTPUT = 12'h2C6;
    localparam GPIO_MODE_INPUT = 12'h4C1;
    localparam GPIO_MODE_INPUT_WEAK_PULL_UP = 12'h9C2;
    localparam GPIO_MODE_INPUT_WEAK_PULL_DOWN = 12'h1C3;
    localparam GPIO_MODE_BIDIRECTIONAL = 12'h006;
    localparam GPIO_MODE_BIDIRECTIONAL_WPU = 12'h003;
    localparam GPIO_MODE_BIDIRECTIONAL_WPD = 12'h002;
    localparam GPIO_MODE_FORCE_ZERO_OUTPUT = 12'h386;
    localparam GPIO_MODE_FORCE_ONE_OUTPUT = 12'hB86;

    localparam CONFIG_DONE_SEQUENCE = 48'hFEEDBADCA77E;

    localparam CONFIG_BITS_PER_IO_PAD = 12;

    wire [ 0:0] clk;
    wire [11:0] io_in;
    wire [11:0] io_out;
    wire [11:0] io_oeb;

    Global_Clock clk_i (.CLK(clk));

    (* keep, BEL="X0Y1.A" *) IO_1_bidirectional_frame_config_pass io11_i (
        .O(io_in[11]),
        .I(io_out[11]),
        .T(io_oeb[11])
    );
    (* keep, BEL="X0Y1.B" *) IO_1_bidirectional_frame_config_pass io10_i (
        .O(io_in[10]),
        .I(io_out[10]),
        .T(io_oeb[10])
    );
    (* keep, BEL="X0Y2.A" *) IO_1_bidirectional_frame_config_pass io9_i (
        .O(io_in[9]),
        .I(io_out[9]),
        .T(io_oeb[9])
    );
    (* keep, BEL="X0Y2.B" *) IO_1_bidirectional_frame_config_pass io8_i (
        .O(io_in[8]),
        .I(io_out[8]),
        .T(io_oeb[8])
    );
    (* keep, BEL="X0Y3.A" *) IO_1_bidirectional_frame_config_pass io7_i (
        .O(io_in[7]),
        .I(io_out[7]),
        .T(io_oeb[7])
    );
    (* keep, BEL="X0Y3.B" *) IO_1_bidirectional_frame_config_pass io6_i (
        .O(io_in[6]),
        .I(io_out[6]),
        .T(io_oeb[6])
    );
    (* keep, BEL="X0Y4.A" *) IO_1_bidirectional_frame_config_pass io5_i (
        .O(io_in[5]),
        .I(io_out[5]),
        .T(io_oeb[5])
    );
    (* keep, BEL="X0Y4.B" *) IO_1_bidirectional_frame_config_pass io4_i (
        .O(io_in[4]),
        .I(io_out[4]),
        .T(io_oeb[4])
    );
    (* keep, BEL="X0Y5.A" *) IO_1_bidirectional_frame_config_pass io3_i (
        .O(io_in[3]),
        .I(io_out[3]),
        .T(io_oeb[3])
    );
    (* keep, BEL="X0Y5.B" *) IO_1_bidirectional_frame_config_pass io2_i (
        .O(io_in[2]),
        .I(io_out[2]),
        .T(io_oeb[2])
    );
    (* keep, BEL="X0Y6.A" *) IO_1_bidirectional_frame_config_pass io1_i (
        .O(io_in[1]),
        .I(io_out[1]),
        .T(io_oeb[1])
    );
    (* keep, BEL="X0Y6.B" *) IO_1_bidirectional_frame_config_pass io0_i (
        .O(io_in[0]),
        .I(io_out[0]),
        .T(io_oeb[0])
    );

    `define CONFIG_INST(X, Y, MODE, BEL_LETTER) \
      (* keep, BEL = {"X", `"X`", "Y", `"Y`", ".", `"BEL_LETTER`"} *) \
      Config_access #(.INIT(MODE)) config_access_inst_x``X``y``Y``_``BEL_LETTER`` ();

      `define UIO_PIN_0_CONFIG(MODE)  `CONFIG_INST(9, 6, MODE, L)
      `define UIO_PIN_1_CONFIG(MODE)  `CONFIG_INST(9, 6, MODE, M)
      `define UIO_PIN_2_CONFIG(MODE)  `CONFIG_INST(9, 6, MODE, N)
      `define UIO_PIN_3_CONFIG(MODE)  `CONFIG_INST(9, 6, MODE, O)

      `define UIO_PIN_4_CONFIG(MODE)  `CONFIG_INST(9, 5, MODE, L)
      `define UIO_PIN_5_CONFIG(MODE)  `CONFIG_INST(9, 5, MODE, M)
      `define UIO_PIN_6_CONFIG(MODE)  `CONFIG_INST(9, 5, MODE, N)
      `define UIO_PIN_7_CONFIG(MODE)  `CONFIG_INST(9, 5, MODE, O)

      `define UIO_PIN_8_CONFIG(MODE)  `CONFIG_INST(9, 4, MODE, L)
      `define UIO_PIN_9_CONFIG(MODE)  `CONFIG_INST(9, 4, MODE, M)
      `define UIO_PIN_10_CONFIG(MODE) `CONFIG_INST(9, 4, MODE, N)
      `define UIO_PIN_11_CONFIG(MODE) `CONFIG_INST(9, 4, MODE, O)

      `define UIO_PIN_12_CONFIG(MODE) `CONFIG_INST(9, 3, MODE, L)
      `define UIO_PIN_13_CONFIG(MODE) `CONFIG_INST(9, 3, MODE, M)
      `define UIO_PIN_14_CONFIG(MODE) `CONFIG_INST(9, 3, MODE, N)
      `define UIO_PIN_15_CONFIG(MODE) `CONFIG_INST(9, 3, MODE, O)

      `define UIO_PIN_16_CONFIG(MODE) `CONFIG_INST(9, 2, MODE, L)
      `define UIO_PIN_17_CONFIG(MODE) `CONFIG_INST(9, 2, MODE, M)

      // `UIO_PIN_0_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_1_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_2_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_3_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_4_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_5_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_6_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_7_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_8_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_9_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_10_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_11_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_12_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_13_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_14_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_15_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      //
      // `UIO_PIN_16_CONFIG(GPIO_MODE_BIDIRECTIONAL)
      // `UIO_PIN_17_CONFIG(GPIO_MODE_BIDIRECTIONAL)


    // Config for IOs 0 through 11
    `CONFIG_INST(0, 6, GPIO_MODE_FORCE_ONE_OUTPUT, C)
    `CONFIG_INST(0, 6, GPIO_MODE_BIDIRECTIONAL, D)
    `CONFIG_INST(0, 5, GPIO_MODE_BIDIRECTIONAL, C)
    `CONFIG_INST(0, 5, GPIO_MODE_BIDIRECTIONAL, D)
    `CONFIG_INST(0, 4, GPIO_MODE_BIDIRECTIONAL, C)
    `CONFIG_INST(0, 4, GPIO_MODE_BIDIRECTIONAL, D)
    `CONFIG_INST(0, 3, GPIO_MODE_BIDIRECTIONAL, C)
    `CONFIG_INST(0, 3, GPIO_MODE_BIDIRECTIONAL, D)
    `CONFIG_INST(0, 2, GPIO_MODE_BIDIRECTIONAL, C)
    `CONFIG_INST(0, 2, GPIO_MODE_BIDIRECTIONAL, D)
    `CONFIG_INST(0, 1, GPIO_MODE_BIDIRECTIONAL, C)
    `CONFIG_INST(0, 1, GPIO_MODE_BIDIRECTIONAL, D)

    // NOTE: These are unused
    `CONFIG_INST(0, 1, GPIO_MODE_BIDIRECTIONAL, E)
    `CONFIG_INST(0, 1, GPIO_MODE_BIDIRECTIONAL, F)
    `CONFIG_INST(0, 2, GPIO_MODE_BIDIRECTIONAL, E)
    `CONFIG_INST(0, 2, GPIO_MODE_BIDIRECTIONAL, F)
    `CONFIG_INST(0, 3, GPIO_MODE_BIDIRECTIONAL, E)
    `CONFIG_INST(0, 3, GPIO_MODE_BIDIRECTIONAL, F)
    `CONFIG_INST(0, 4, GPIO_MODE_BIDIRECTIONAL, E)
    `CONFIG_INST(0, 4, GPIO_MODE_BIDIRECTIONAL, F)

    `CONFIG_INST(0, 5, CONFIG_DONE_SEQUENCE[CONFIG_BITS_PER_IO_PAD*1+:CONFIG_BITS_PER_IO_PAD], E)
    `CONFIG_INST(0, 5, CONFIG_DONE_SEQUENCE[CONFIG_BITS_PER_IO_PAD*3+:CONFIG_BITS_PER_IO_PAD] , F)
    `CONFIG_INST(0, 6, CONFIG_DONE_SEQUENCE[CONFIG_BITS_PER_IO_PAD*0+:CONFIG_BITS_PER_IO_PAD], E)
    `CONFIG_INST(0, 6, CONFIG_DONE_SEQUENCE[CONFIG_BITS_PER_IO_PAD*2+:CONFIG_BITS_PER_IO_PAD], F)

        top top_i (
        .clk(clk),
        .io_in(io_in),
        .io_out(io_out),
        .io_oeb(io_oeb)
    );
endmodule
