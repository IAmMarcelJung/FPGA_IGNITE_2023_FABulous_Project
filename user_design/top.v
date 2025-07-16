module top (
    input wire clk,
    // verilator lint_off UNUSEDSIGNAL
    input wire [11:0] io_in,
    // verilator lint_on UNUSEDSIGNAL
    // verilator lint_off UNDRIVEN
    output wire [11:0] io_out,
    // verilator lint_on UNDRIVEN
    io_oeb,

    output wire [19:0] uio_to_fabric_x1_y7_o,
    input  wire [19:0] uio_from_fabric_x1_y7_i,
    output wire [19:0] uio_to_fabric_x2_y7_o,
    input  wire [19:0] uio_from_fabric_x2_y7_i,
    output wire [19:0] uio_to_fabric_x3_y7_o,
    input  wire [19:0] uio_from_fabric_x3_y7_i,
    output wire [19:0] uio_to_fabric_x4_y7_o,
    input  wire [19:0] uio_from_fabric_x4_y7_i,
    output wire [19:0] uio_to_fabric_x5_y7_o,
    input  wire [19:0] uio_from_fabric_x5_y7_i,
    output wire [19:0] uio_to_fabric_x6_y7_o,
    input  wire [19:0] uio_from_fabric_x6_y7_i,
    output wire [19:0] uio_to_fabric_x7_y7_o,
    input  wire [19:0] uio_from_fabric_x7_y7_i,
    output wire [19:0] uio_to_fabric_x8_y7_o,
    input  wire [19:0] uio_from_fabric_x8_y7_i,

    output wire [19:0] uio_to_fabric_x1_y0_o,
    input  wire [19:0] uio_from_fabric_x1_y0_i,
    output wire [19:0] uio_to_fabric_x2_y0_o,
    input  wire [19:0] uio_from_fabric_x2_y0_i,
    output wire [19:0] uio_to_fabric_x3_y0_o,
    input  wire [19:0] uio_from_fabric_x3_y0_i,
    output wire [19:0] uio_to_fabric_x4_y0_o,
    input  wire [19:0] uio_from_fabric_x4_y0_i,
    output wire [19:0] uio_to_fabric_x5_y0_o,
    input  wire [19:0] uio_from_fabric_x5_y0_i,
    output wire [19:0] uio_to_fabric_x6_y0_o,
    input  wire [19:0] uio_from_fabric_x6_y0_i,
    output wire [19:0] uio_to_fabric_x7_y0_o,
    input  wire [19:0] uio_from_fabric_x7_y0_i,
    output wire [19:0] uio_to_fabric_x8_y0_o,
    input  wire [19:0] uio_from_fabric_x8_y0_i
);
// module top (
//     input wire clk,
// // verilator lint_off UNUSEDSIGNAL
//     input wire [11:0] io_in,
// // verilator lint_on UNUSEDSIGNAL
// // verilator lint_off UNDRIVEN
//     output wire [11:0] io_out,
// // verilator lint_on UNDRIVEN
//     io_oeb
// );
//
    localparam COUNTER_WIDTH = 26;
    localparam PRESCALE_WIDTH = 15;
    localparam PRESCALE_LIMIT = 10;

    // WARNING: Don't change these values since FABulous inverts them
    // internally!
    localparam OUTPUT_ENABLE = 1'b1;
    localparam OUTPUT_DISABLE = 1'b0;

    localparam RESET_PIN = 11;
    // localparam PRESCALE_PIN = RESET_PIN - 1;
    // localparam RESET_OUT = PRESCALE_PIN - 1;
    localparam OSC_ENABLE_PIN = RESET_PIN - 1;
    localparam RESET_OUT = OSC_ENABLE_PIN - 1;
    localparam OSC_OUT = RESET_OUT - 2;

    wire rst;
    wire use_prescaler;
    reg [COUNTER_WIDTH-1:0] ctr;
    reg [PRESCALE_WIDTH-1:0] prescale;

    always @(posedge clk) begin
        // if (rst) ctr <= 0;
        // else begin
            // if (use_prescaler) begin
                // if (prescale == PRESCALE_LIMIT) ctr <= ctr + 1'b1;
            // end else begin
                ctr <= ctr + 1'b1;
            // end
        // end
    end

    // always @(posedge clk) begin
    //     if (rst) prescale <= 0;
    //     else begin
    //         if (prescale == PRESCALE_LIMIT) prescale <= 0;
    //         else prescale <= prescale + 1'b1;
    //     end
    // end

    // localparam N = 170;
    localparam N = 80;
    (* keep *) wire [N:0] osc;
    wire enable;

    genvar ii;
    generate
        for (ii = 0; ii < N; ii = ii + 1'b1) begin
            LUT4 #(
                .INIT(16'h00FF)
            ) l0 (
                .I3(osc[ii] & enable),
                .O (osc[ii+1'b1])
            );
        end
    endgenerate

    assign osc[0] = osc[N] & enable;

    wire osco;
    LUT1 #(
        .INIT(2'b01)
    ) lo (
        .I0(osc[0]),
        .O (osco)
    );

    // Inputs

    // assign io_oeb[RESET_PIN:PRESCALE_PIN] = {2{OUTPUT_DISABLE}};
    assign io_oeb[RESET_PIN:OSC_ENABLE_PIN] = {2{OUTPUT_DISABLE}};
    assign rst = io_in[RESET_PIN];
    // assign use_prescaler = io_in[PRESCALE_PIN];
    // assign enable = io_in[OSC_ENABLE_PIN];
    assign enable = ctr[14] | io_in[OSC_ENABLE_PIN];

    // Outputs

    // Route the reset through for debugging
    assign io_out[RESET_OUT] = rst;
    assign io_out[OSC_OUT] = osco;

    // Don't use high frequency signals for easier
    // observability
    assign io_out[OSC_OUT-1:0] = ctr[22:16];

    assign io_oeb[RESET_OUT:0] = {10{OUTPUT_ENABLE}};
// endmodule

//     localparam COUNTER_WIDTH = 24;
//     localparam PRESCALE_WIDTH = 15;
//     localparam PRESCALE_LIMIT = 10;
//
//     // WARNING: Don't change these values since FABulous inverts them
//     // internally!
//     localparam OUTPUT_ENABLE = 1'b1;
//     localparam OUTPUT_DISABLE = 1'b0;
//
//     localparam RESET_PIN = 11;
//     // localparam PRESCALE_PIN = RESET_PIN - 1;
//     localparam RESET_OUT = RESET_PIN - 1;
//
//     wire rst;
//     // wire use_prescaler;
//     reg [COUNTER_WIDTH-1:0] ctr;
//     // reg [PRESCALE_WIDTH-1:0] prescale;
//
//     always @(posedge clk) begin
//         if (rst) ctr <= 0;
//         else begin
//             // if (use_prescaler) begin
//                 ctr <= ctr + 1'b1;
//         end
//     end
//
//     // always @(posedge clk) begin
//     //     if (rst) prescale <= 0;
//     //     else begin
//     //         if (prescale == PRESCALE_LIMIT) prescale <= 0;
//     //         else prescale <= prescale + 1'b1;
//     //     end
//     // end
//
//     // Inputs
//
//     assign io_oeb[RESET_PIN] = OUTPUT_DISABLE;
//     assign rst = io_in[RESET_PIN];
//     // assign use_prescaler = io_in[PRESCALE_PIN];
//
//     // Outputs
//
//     // Route the reset through for debugging
//     assign io_out[RESET_OUT] = rst;
//     assign io_out[RESET_OUT-1] = rst;
//
//     // Don't use high frequency signals for easier
//     // observability
//     // assign io_out[RESET_OUT-1:0] = ctr[COUNTER_WIDTH-1:COUNTER_WIDTH - RESET_OUT];
//     assign io_out[0] = 1'b1;
//     assign io_out[RESET_OUT-4:1] = ctr[RESET_OUT-4:1];
//     assign io_out[RESET_OUT-2:RESET_OUT-3] = ctr[RESET_OUT-2:RESET_OUT-3];
//     // assign io_out[RESET_OUT-2:0] = 9'b1_1111_1111;
//     // NOTE: This value will not propagate due to the oeb setting
//     assign io_out[RESET_PIN] = 1'b0;
//
//     assign io_oeb[RESET_OUT:0] = {11{OUTPUT_ENABLE}};
endmodule
