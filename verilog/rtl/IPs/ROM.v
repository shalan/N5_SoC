module ROM # (
    parameter MEM_WORDS = 8192
)(
    CLK,
    EN,
    Do,
    A
);

    localparam ADR_WIDTH =  13;       // $clog2(MEM_WORDS);

    input  wire     CLK;
    input  wire      EN;
    output reg  [31:0]  Do;
    input wire  [ADR_WIDTH-1:0]   A;

    reg [31:0] ROM[MEM_WORDS-1 : 0];
     
    always @(posedge CLK) 
    if (EN) Do <= ROM[A];

    `ifdef INIT_ROM
        initial begin
            $readmemh(`ROM_FILE_PATH, ROM);
            $display("Memory[0]: %0h, Memory[1]: %0h, Memory[2]: %0h, Memory[3]: %0h", 
                    ROM[0], ROM[1], ROM[2], ROM[3]);
        end
    `endif

endmodule