`include "defines.v"

/* Need to export PDK_PATH and pass it to iverilog using -I */
`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

`ifdef FAST
    `include "DFFRAM_beh.v"
`else 
    `ifndef GL
    `include "IPs/DFFRAM_4K.v"
    `include "IPs/DMC_32x16HC.v"
    `endif
`endif

/* Need to export N5_RTL_ROOT and pass it to iverilog using -I */
`include "AHB_sys_0/AHBlite_sys_0.v"
`include "AHB_sys_0/AHBlite_bus0.v"
`include "AHB_sys_0/AHBlite_GPIO.v"
`include "AHB_sys_0/AHBlite_db_reg.v"

`include "AHB_sys_0/APB_sys_0/APB_WDT32.v"
`include "AHB_sys_0/APB_sys_0/APB_TIMER32.v"
`include "AHB_sys_0/APB_sys_0/APB_PWM32.v"
`include "AHB_sys_0/APB_sys_0/AHB_2_APB.v"
`include "AHB_sys_0/APB_sys_0/APB_bus0.v"
`ifndef GL
`include "AHB_sys_0/APB_sys_0/APB_sys_0.v"
`endif

`include "IPs/DFFRAMBB.v"
`include "IPs/TIMER32.v"
`include "IPs/PWM32.v"
`include "IPs/WDT32.v"
`include "IPs/spi_master.v"
`include "IPs/i2c_master.v"
`include "IPs/GPIO.v"
`include "IPs/APB_UART.v"
`include "IPs/APB_SPI.v"
`include "IPs/APB_I2C.v"
`include "IPs/AHBSRAM.v"
`include "IPs/QSPI_XIP_CTRL.v"
`include "IPs/RAM_4Kx32.v"
`include "acc/AHB_SPM.v"

`ifdef USE_ROM
    `include "IPs/AHBROM.v"
    `include "IPs/ROM.v"
`endif

`ifdef GL
    `include "gl/DFFRAM_4K.v"
    `include "gl/DMC_32x16HC.v"
    `include "gl/NfiVe32_SYS.v"
    `include "gl/apb_sys_0.v"
    `ifdef SIM_WRAPPER
         `include "gl/user_project_wrapper.v"
    `endif
`else
    `include "NfiVe32.v" 
    `ifdef SIM_WRAPPER 
         `include "user_project_wrapper.v" 
    `endif
`endif

`include "soc_core.v"
   