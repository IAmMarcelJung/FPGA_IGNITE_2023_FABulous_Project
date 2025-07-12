module uio_wrapper (
    input  [19:0] to_fabric_i,
    output [19:0] from_fabric_o
);

    // Internal scalar wires
    wire [19:0] FIN;
    wire [19:0] FOUT;

    // Instantiate the scalar version of the User_project_IO module
    User_project_IO user_io_inst (
        .FIN0(FIN[0]), .FOUT0(FOUT[0]),
        .FIN1(FIN[1]), .FOUT1(FOUT[1]),
        .FIN2(FIN[2]), .FOUT2(FOUT[2]),
        .FIN3(FIN[3]), .FOUT3(FOUT[3]),
        .FIN4(FIN[4]), .FOUT4(FOUT[4]),
        .FIN5(FIN[5]), .FOUT5(FOUT[5]),
        .FIN6(FIN[6]), .FOUT6(FOUT[6]),
        .FIN7(FIN[7]), .FOUT7(FOUT[7]),
        .FIN8(FIN[8]), .FOUT8(FOUT[8]),
        .FIN9(FIN[9]), .FOUT9(FOUT[9]),
        .FIN10(FIN[10]), .FOUT10(FOUT[10]),
        .FIN11(FIN[11]), .FOUT11(FOUT[11]),
        .FIN12(FIN[12]), .FOUT12(FOUT[12]),
        .FIN13(FIN[13]), .FOUT13(FOUT[13]),
        .FIN14(FIN[14]), .FOUT14(FOUT[14]),
        .FIN15(FIN[15]), .FOUT15(FOUT[15]),
        .FIN16(FIN[16]), .FOUT16(FOUT[16]),
        .FIN17(FIN[17]), .FOUT17(FOUT[17]),
        .FIN18(FIN[18]), .FOUT18(FOUT[18]),
        .FIN19(FIN[19]), .FOUT19(FOUT[19])
    );

    // Vector-to-scalar mapping
    assign FIN = to_fabric_i;
    assign from_fabric_o = FOUT;

endmodule
