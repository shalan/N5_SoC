`timescale 1ns / 1ps
`default_nettype none

module RAM_4Kx32 (
`ifdef USE_POWER_PINS
    VPWR,
    VGND,
`endif
    CLK,
    WE,
    EN,
    Di,
    Do,
    A
);

`ifdef USE_POWER_PINS
	input VPWR;
	input VGND;
`endif

    input           CLK;
    input   [3:0]   WE;
    input           EN;
    input   [31:0]  Di;
    output  [31:0]  Do;
    input   [11:0]   A;

    localparam BLOCKS=4;
    wire  [BLOCKS-1:0]       _EN_ ;
    wire [31:0] _Do_ [BLOCKS-1:0];
    wire [31:0] Do_pre;
    wire [11:10] A_buf;
    
    generate 
        genvar gi;
        for(gi=0; gi<BLOCKS; gi=gi+1) 

`ifdef NO_DFFRAM
	DFFRAM_beh 
`else
	DFFRAM_4K
`endif
            #(.COLS(4)) RAM (
            `ifdef USE_POWER_PINS
                .VPWR(VPWR),
                .VGND(VGND),
            `endif
                .CLK(CLK),
                .WE(WE),
                .EN(_EN_[gi]),
                .Di(Di),
                .Do(_Do_[gi]),
                .A(A[9:0])
            );
        
    endgenerate 
    
    sky130_fd_sc_hd__clkbuf_8 ABUF[11:10] (
    `ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
    `endif
        .X(A_buf), .A(A[11:10]));

    MUX4x1_32 MUX ( 
    `ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
    `endif
        .A0(_Do_[0]), .A1(_Do_[1]), .A2(_Do_[2]), .A3(_Do_[3]), .S(A_buf), .X(Do_pre) );
    DEC2x4 DEC (
    `ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
    `endif
         .EN(EN), .A(A[11:10]), .SEL(_EN_) );

    sky130_fd_sc_hd__clkbuf_4 DOBUF[31:0] (
    `ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
    `endif
        .X(Do), .A(Do_pre));
    
endmodule
