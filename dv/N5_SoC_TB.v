`timescale 1ns/1ns

`define   TEST_FILE   "../sw/main.hex" 
`define   SIM_TIME    500_000_000
`define   SIM_LEVEL   1

module N5_SoC_TB;

    reg HCLK, HRESETn;

    wire [3:0]		fdi;
    wire [3:0]    	fdo;
    wire [3:0]      fdio;
    wire     	    fdoe;
    wire          	fsclk;
    wire          	fcen;



QSPI_XIP_CTRL qspi (
    // Global Signals
    .HCLK(HCLK),
    .HRESETn(HRESETn),

    // QSPI flash interface
    .din(fdi),
    .dout(fdo),
    .douten(fdoe),
    .sck(fsclk),
    .ce_n(fcen),

    // AHB-Lite Slave Interface
    .HSEL(HSEL_FLASH),
    .HREADY(HREADY),
    .HTRANS(HTRANS),
    //.HSIZE(HSIZE),
    .HWRITE(HWRITE),
    .HADDR(HADDR),
    .HREADYOUT(HREADYOUT_FLASH),
    .HRDATA(HRDATA_FLASH)
);

assign fdio = fdoe ? fdo : 4'bzzzz;
assign fdi = fdio;

sst26wf080b flash(
  .SCK(fsclk),
  .SIO(fdio),
  .CEb(fcen)
);

soc_core MUV (
	.HCLK(HCLK),
	.HRESETn(HRESETn),

	input [7: 0] Input_DATA,
	input [0: 0] Input_irq,
	output Output_DATA,
	input wire [3: 0] fdi_Sys0_S0,
	output wire [3: 0] fdo_Sys0_S0,
	output wire [3: 0] fdoe_Sys0_S0,
	output wire [0: 0] fsclk_Sys0_S0,
	output wire [0: 0] fcen_Sys0_S0,
	input wire [15: 0] GPIOIN_Sys0_S2,
	output wire [15: 0] GPIOOUT_Sys0_S2,
	output wire [15: 0] GPIOPU_Sys0_S2,
	output wire [15: 0] GPIOPD_Sys0_S2,
	output wire [15: 0] GPIOOEN_Sys0_S2,
	output [3:0] db_reg_Sys0,
		
	input wire [0: 0] RsRx_Sys0_SS0_S0,
	output wire [0: 0] RsTx_Sys0_SS0_S0,
	output wire [0: 0] uart_irq_Sys0_SS0_S0,

	input wire [0: 0] RsRx_Sys0_SS0_S1,
	output wire [0: 0] RsTx_Sys0_SS0_S1,
	output wire [0: 0] uart_irq_Sys0_SS0_S1,
	
    input wire [0: 0] MSI_Sys0_SS0_S2,
	output wire [0: 0] MSO_Sys0_SS0_S2,
	output wire [0: 0] SSn_Sys0_SS0_S2,
	output wire [0: 0] SCLK_Sys0_SS0_S2,
	input wire [0: 0] MSI_Sys0_SS0_S3,
	output wire [0: 0] MSO_Sys0_SS0_S3,
	output wire [0: 0] SSn_Sys0_SS0_S3,
	output wire [0: 0] SCLK_Sys0_SS0_S3,
	input wire [0: 0] scl_i_Sys0_SS0_S4,
	output wire [0: 0] scl_o_Sys0_SS0_S4,
	output wire [0: 0] scl_oen_o_Sys0_SS0_S4,
	input wire [0: 0] sda_i_Sys0_SS0_S4,
	output wire [0: 0] sda_o_Sys0_SS0_S4,
	output wire [0: 0] sda_oen_o_Sys0_SS0_S4,
	input wire [0: 0] scl_i_Sys0_SS0_S5,
	output wire [0: 0] scl_o_Sys0_SS0_S5,
	output wire [0: 0] scl_oen_o_Sys0_SS0_S5,
	input wire [0: 0] sda_i_Sys0_SS0_S5,
	output wire [0: 0] sda_o_Sys0_SS0_S5,
	output wire [0: 0] sda_oen_o_Sys0_SS0_S5,
	output wire [0: 0] pwm_Sys0_SS0_S6,
	output wire [0: 0] pwm_Sys0_SS0_S7
);

// Load the application into the flash memory
initial begin
	#1  $readmemh(`TEST_FILE, flash.I0.memory);
end

// Clock and Rest Generation
initial begin
    //Inputs initialization
    HCLK = 0;
    HRESETn = 1'bx;        
    #50;
    HRESETn = 0;
    #100;
    @(posedge HCLK);
    HRESETn <= 1;
end

always #5 HCLK = ~ HCLK;

// Dump file
initial begin
    $dumpfile("N5_SoC_TB.vcd");
    $dumpvars(`SIM_LEVEL, N5_SoC_TB);
    #`SIM_TIME;
    $finish;
end


endmodule