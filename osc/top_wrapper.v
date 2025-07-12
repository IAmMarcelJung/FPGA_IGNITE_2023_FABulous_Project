module top_wrapper;
    localparam GPIO_MODE_OUTPUT = 12'h2C6;
    localparam GPIO_MODE_INPUT = 12'h4C1;
    localparam GPIO_MODE_INPUT_WEAK_PULL_UP = 12'h9C2;
    localparam GPIO_MODE_INPUT_WEAK_PULL_DOWN = 12'h1C3;
    localparam GPIO_MODE_BIDIRECTIONAL = 12'h006;
    localparam GPIO_MODE_FORCE_ZERO_OUTPUT = 12'h386;
    localparam GPIO_MODE_FORCE_ONE_OUTPUT = 12'hB86;

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

    // (* keep, BEL="X0Y6.B" *)
    // Config_access #(.C_bit(GPIO_MODE_BIDIRECTIONAL)) access  (
    // );

    top top_i (
        .clk(clk),
        .io_in(io_in),
        .io_out(io_out),
        .io_oeb(io_oeb)
    );
endmodule
