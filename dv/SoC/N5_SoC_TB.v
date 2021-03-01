`timescale 1ns/1ns

`define   TEST_FILE   "../../sw/test.hex" 
`define   SIM_TIME    15_000_000
`define   SIM_LEVEL   0

`include "n5_netlists.v"
`include "sst26wf080b.v"
`include "23LC512.v"
`include "M24LC16B.v"

module N5_SoC_TB;

    reg HCLK, HRESETn;

    wire [3:0]		fdi;
    wire [3:0]    	fdo;
    wire [3:0]      fdio;
    wire     	    fdoe;
    wire          	fsclk;
    wire          	fcen;

    wire [15: 0] GPIOIN_Sys0_S2;
    wire [15: 0] GPIOOUT_Sys0_S2;
    wire [15: 0] GPIOPU_Sys0_S2;
    wire [15: 0] GPIOPD_Sys0_S2;
    wire [15: 0] GPIOOEN_Sys0_S2;
    wire [3:0] db_reg_Sys0;

    wire [0: 0] RsRx_Sys0_SS0_S0;
    wire [0: 0] RsTx_Sys0_SS0_S0;
    
    wire [0: 0] RsRx_Sys0_SS0_S1;
    wire [0: 0] RsTx_Sys0_SS0_S1;

    wire [0: 0] MSI_Sys0_SS0_S2;
    wire [0: 0] MSO_Sys0_SS0_S2;
    wire [0: 0] SSn_Sys0_SS0_S2;
    wire [0: 0] SCLK_Sys0_SS0_S2;

    wire [0: 0] MSI_Sys0_SS0_S3;
    wire [0: 0] MSO_Sys0_SS0_S3;
    wire [0: 0] SSn_Sys0_SS0_S3;
    wire [0: 0] SCLK_Sys0_SS0_S3;

    wire [0: 0] scl_i_Sys0_SS0_S4;
    wire [0: 0] scl_o_Sys0_SS0_S4;
    wire [0: 0] scl_oen_o_Sys0_SS0_S4;
    wire [0: 0] sda_i_Sys0_SS0_S4;
    wire [0: 0] sda_o_Sys0_SS0_S4;
    wire [0: 0] sda_oen_o_Sys0_SS0_S4;

    wire [0: 0] scl_i_Sys0_SS0_S5;
    wire [0: 0] scl_o_Sys0_SS0_S5;
    wire [0: 0] scl_oen_o_Sys0_SS0_S5;
    wire [0: 0] sda_i_Sys0_SS0_S5;
    wire [0: 0] sda_o_Sys0_SS0_S5;
    wire [0: 0] sda_oen_o_Sys0_SS0_S5;

    wire [0: 0] pwm_Sys0_SS0_S6;
	wire [0: 0] pwm_Sys0_SS0_S7;

    /* Program Flash */
    assign fdio = fdoe ? fdo : 4'bzzzz;
    assign fdi = fdio;

    sst26wf080b flash(
        .SCK(fsclk),
        .SIO(fdio),
        .CEb(fcen)
    );

    /* N5_SoC Core */
    soc_core MUV (
    `ifdef USE_POWER_PINS
        .VPWR(1'b1),
        .VGND(1'b0),
    `endif
        .HCLK(HCLK),
        .HRESETn(HRESETn),

        .SYSTICKCLKDIV(8'd100),
        .NMI(1'b0),
       
        .fdi_Sys0_S0(fdi),
        .fdo_Sys0_S0(fdo),
        .fdoe_Sys0_S0(fdoe),
        .fsclk_Sys0_S0(fsclk),
        .fcen_Sys0_S0(fcen),

        .GPIOIN_Sys0_S2(GPIOIN_Sys0_S2),
        .GPIOOUT_Sys0_S2(GPIOOUT_Sys0_S2),
        .GPIOPU_Sys0_S2(GPIOPU_Sys0_S2),
        .GPIOPD_Sys0_S2(GPIOPD_Sys0_S2),
        .GPIOOEN_Sys0_S2(GPIOOEN_Sys0_S2),
   		
        .RsRx_Sys0_SS0_S0(RsRx_Sys0_SS0_S0),
        .RsTx_Sys0_SS0_S0(RsTx_Sys0_SS0_S0),

        .RsRx_Sys0_SS0_S1(RsRx_Sys0_SS0_S1),
        .RsTx_Sys0_SS0_S1(RsTx_Sys0_SS0_S1),
       
        .MSI_Sys0_SS0_S2(MSI_Sys0_SS0_S2),
        .MSO_Sys0_SS0_S2(MSO_Sys0_SS0_S2),
        .SSn_Sys0_SS0_S2(SSn_Sys0_SS0_S2),
        .SCLK_Sys0_SS0_S2(SCLK_Sys0_SS0_S2),

        .MSI_Sys0_SS0_S3(MSI_Sys0_SS0_S3),
        .MSO_Sys0_SS0_S3(MSO_Sys0_SS0_S3),
        .SSn_Sys0_SS0_S3(SSn_Sys0_SS0_S3),
        .SCLK_Sys0_SS0_S3(SCLK_Sys0_SS0_S3),

        .scl_i_Sys0_SS0_S4(scl_i_Sys0_SS0_S4),
        .scl_o_Sys0_SS0_S4(scl_o_Sys0_SS0_S4),
        .scl_oen_o_Sys0_SS0_S4(scl_oen_o_Sys0_SS0_S4),
        .sda_i_Sys0_SS0_S4(sda_i_Sys0_SS0_S4),
        .sda_o_Sys0_SS0_S4(sda_o_Sys0_SS0_S4),
        .sda_oen_o_Sys0_SS0_S4(sda_oen_o_Sys0_SS0_S4),

        .scl_i_Sys0_SS0_S5(scl_i_Sys0_SS0_S5),
        .scl_o_Sys0_SS0_S5(scl_o_Sys0_SS0_S5),
        .scl_oen_o_Sys0_SS0_S5(scl_oen_o_Sys0_SS0_S5),
        .sda_i_Sys0_SS0_S5(sda_i_Sys0_SS0_S5),
        .sda_o_Sys0_SS0_S5(sda_o_Sys0_SS0_S5),
        .sda_oen_o_Sys0_SS0_S5(sda_oen_o_Sys0_SS0_S5),

        .pwm_Sys0_SS0_S6(pwm_Sys0_SS0_S6),
	    .pwm_Sys0_SS0_S7(pwm_Sys0_SS0_S7)

    );

    // GPIO Loopback!
    wire [15:0] GPIO_PINS;
    generate
        genvar i;
        for(i=0; i<16; i=i+1)
            assign GPIO_PINS[i] = GPIOOEN_Sys0_S2[i] ? GPIOOUT_Sys0_S2[i] : 1'bz;
    endgenerate
    assign GPIO_PINS[15:8] = GPIO_PINS[7:0];
    assign GPIOIN_Sys0_S2 = GPIO_PINS;


    // Serial Terminal connected to UART0 TX*/
    terminal term(.rx(RsTx_Sys0_SS0_S0));

    // SPI SRAM connected to SPI0
    wire SPI_HOLD = 1'b1;
    M23LC512 SPI_SRAM(
        .RESET(~HRESETn),
        .SO_SIO1(MSI_Sys0_SS0_S2),
        .SI_SIO0(MSO_Sys0_SS0_S2),
        .CS_N(SSn_Sys0_SS0_S2),
        .SCK(SCLK_Sys0_SS0_S2),
        .HOLD_N_SIO3(SPI_HOLD)
	);

      // I2C E2PROM connected to I2C0
    wire    scl, sda;
    delay   m0_scl (scl_oen_o_Sys0_SS0_S4 ? 1'bz : scl_o_Sys0_SS0_S4, scl),
            m0_sda (sda_oen_o_Sys0_SS0_S4 ? 1'bz : sda_o_Sys0_SS0_S4, sda);

    assign  scl_i_Sys0_SS0_S4 = scl;
    assign  sda_i_Sys0_SS0_S4 = sda;
    
	pullup p1(scl); // pullup scl line
	pullup p2(sda); // pullup sda line

    M24LC16B I2C_E2PROM(
        .A0(1'b0), 
        .A1(1'b0), 
        .A2(1'b0), 
        .WP(1'b0), 
        .SDA(sda), 
        .SCL(scl), 
        .RESET(~HRESETn)
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

    // Terminate the smulation with ebreak instruction.
    // Calculate the CPI using the CSRs
    `ifndef GL
        always @ (posedge HCLK) 
            if(MUV.CPU.N5.instr_ebreak) begin
            //$display("CPI=%d.%0d", MUV.N5.CSR_CYCLE/MUV.N5.CSR_INSTRET,(MUV.N5.CSR_CYCLE%MUV.N5.CSR_INSTRET)*10/MUV.N5.CSR_INSTRET );
            $finish;
            end
    `endif
    
    // Monitor Flash memory reads
    //always @(posedge HCLK)
    //    if(MUV.N5.HTRANS[1] & MUV.N5.HREADY & MUV.N5.HSEL_FLASH)
    //    $display("Flash Read A:%X (%0t)", HADDR, $time);


    
endmodule

module terminal #(parameter bit_time = 160) (input rx);

    integer i;
    reg [7:0] char;
    initial begin
        forever begin
            @(negedge rx);
            i = 0;
            char = 0;
            #(3*bit_time/2);
            for(i=0; i<8; i=i+1) begin
                char[i] = rx;
                #bit_time;
            end
            $write("%c", char);
        end
    end


endmodule

module delay (in, out);
  input  in;
  output out;

  assign out = in;

  specify
    (in => out) = (600,600);
  endspecify
endmodule