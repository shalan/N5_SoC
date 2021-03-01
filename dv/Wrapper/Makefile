PDK_PATH ?= $(PDK_ROOT)/sky130A
RTL_PATH ?= ../../verilog/rtl
BEH_PATH ?= ../

all: sim
.PHONY: all

test.hex: check_pdk ../../sw/test.c ../../sw/crt0.S ../../sw/link.ld 
	SIM_SOC=0 $(MAKE) -C ../../sw/ all

test.vvp: test.hex
	iverilog -o test.vvp -I $(PDK_PATH) -I $(RTL_PATH) -I $(BEH_PATH) N5_Wrapper_TB.v

test_fast.vvp: test.hex 
	iverilog -o test_fast.vvp -DFAST -DSIM_WRAPPER -I $(PDK_PATH) -I $(RTL_PATH) -I $(BEH_PATH) N5_Wrapper_TB.v

test_gl.vvp: test.hex
	iverilog -o test_gl.vvp -DGL -DSIM_WRAPPER -I $(PDK_PATH) -I $(RTL_PATH) -I $(BEH_PATH) N5_Wrapper_TB.v

sim: test.vvp 
	./test.vvp

sim_fast: test_fast.vvp 
	./test_fast.vvp

sim_gl: test_gl.vvp 
	./test_gl.vvp

check_pdk:
ifndef PDK_ROOT
	$(error PDK_ROOT is undefined, please export it before running make)
endif

clean:
	rm *.vvp *.vcd
	rm -f ../../sw/*.hex ../../sw/*.elf ../../sw/*.lst 
