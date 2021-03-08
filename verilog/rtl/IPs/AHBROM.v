// ROM Controller
module AHBROM #(
    parameter AW = 14
)(
  input  wire          HCLK,     
  input  wire          HRESETn,   
  input  wire          HSEL,      
  input  wire          HREADY,   
  input  wire [1:0]    HTRANS,    
  input  wire          HWRITE,    
  input  wire [31:0]   HADDR,     
  output wire          HREADYOUT, 
  output wire [1:0]    HRESP,     
  output wire [31:0]   HRDATA,   

  input  wire   [31:0] ROMRDATA, 
  output wire          ROMCS0,
  output wire [AW-2:0] ROMADDR  
);   
  
   wire ahb_access = HTRANS[1] & HSEL & HREADY;
   wire ahb_read   = ahb_access & (~HWRITE);

   assign HREADYOUT = 1'b1;
   assign HRESP     = 2'b0;
   assign ROMADDR = HADDR[AW-1:2];
   assign ROMCS0 = ahb_read;
   assign HRDATA = ROMRDATA;

endmodule
