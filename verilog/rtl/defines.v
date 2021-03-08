/* SKY130 PDK defines */
`define UNIT_DELAY #1
`define FUNCTIONAL

`ifdef GL
    `define USE_POWER_PINS
`endif

/* N5 SoC defines*/
`ifdef FAST
    // Don't use hand-crafted cache and RAM
    `define NO_HC_CACHE
    `define NO_DFFRAM
`endif

// Don't use hand-crafted register file
`define NO_HC_REGF

// Add ROM block on the AHB bus
// `define USE_ROM