set script_dir [file dirname [file normalize [info script]]]

# User config
set ::env(DESIGN_NAME) 				NfiVe32_SYS

set ::env(DESIGN_IS_CORE) 			0
set ::env(LVS_INSERT_POWER_PINS) 	1

set ::env(ROUTING_CORES) 			12

# Change if needed
set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/NfiVe32.v"
	
# set ::env(SYNTH_TOP_LEVEL) 1
set ::env(SYNTH_READ_BLACKBOX_LIB) 		1
# Fill this
set ::env(CLOCK_PERIOD) 				"8"
set ::env(CLOCK_PORT) 					"HCLK"
set ::env(CLOCK_NET) 					"HCLK"
set ::env(CLOCK_TREE_SYNTH) 			1

set ::env(FP_PIN_ORDER_CFG) 			$::env(DESIGN_DIR)/pin_order.cfg

set ::env(FP_SIZING) 					absolute
set ::env(DIE_AREA) 					"0 0 800 350"
set ::env(GLB_RT_OBS) 					"met5 $::env(DIE_AREA)"
set ::env(GLB_RT_ADJUSTMENT) 			0.15

set ::env(PDN_CFG) 						$script_dir/pdn.tcl
set ::env(GLB_RT_MAXLAYER) 				5

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 	1
set ::env(PSN_ENABLE_RESIZING)                    1
set ::env(PSN_ENABLE_PIN_SWAP)                   0
set ::env(PL_RESIZER_OVERBUFFER)                0
set ::env(PL_TARGET_DENSITY) 			0.62
set ::env(CELL_PAD) 					0
set ::env(DIODE_INSERTION_STRATEGY) 	4
