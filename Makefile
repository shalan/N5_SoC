CARAVEL_ROOT?=/home/cse-admin1/work/Caravel_N5_SoC

migrate:
	# Verilog Views
	mkdir -p $(CARAVEL_ROOT)/verilog/rtl/user_project
	mkdir -p $(CARAVEL_ROOT)/verilog/gl/user_project

	yes | cp -a -rf verilog/gl $(CARAVEL_ROOT)/verilog/gl/user_project
	yes | cp -a verilog/gl/user_project_wrapper.v  $(CARAVEL_ROOT)/verilog/gl/user_project_wrapper.v
	yes | cp -a verilog/rtl/user_project_wrapper.v  $(CARAVEL_ROOT)/verilog/rtl/user_project_wrapper.v
	yes | cp -r verilog/rtl/*.v $(CARAVEL_ROOT)/verilog/rtl/user_project
	yes | cp -r verilog/rtl/IPs $(CARAVEL_ROOT)/verilog/rtl/user_project
	yes | cp -r verilog/rtl/acc $(CARAVEL_ROOT)/verilog/rtl/user_project
	yes | cp -r verilog/rtl/AHB_sys_0 $(CARAVEL_ROOT)/verilog/rtl/user_project

	# Physical views
	yes | cp -a def/user_project_wrapper.def $(CARAVEL_ROOT)/def/
	yes | cp -a lef/user_project_wrapper.lef $(CARAVEL_ROOT)/lef/
	yes | cp -a mag/user_project_wrapper.mag $(CARAVEL_ROOT)/mag/
	yes | cp -a -rf gds/user_project_wrapper.gds $(CARAVEL_ROOT)/gds/
	


def2gds:
	$(shell ./klayout/def2gds.sh def/user_project_wrapper.def user_project_wrapper "gds/DFFRAM.gds gds/DMC_32x16HC.gds gds/NfiVe32_SYS.gds gds/apb_sys_0.gds")
	mv def/user_project_wrapper.gds gds/user_project_wrapper_klayout.gds
