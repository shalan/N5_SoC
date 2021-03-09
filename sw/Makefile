GCC_PATH ?= /usr/local/opt/riscv-gnu-toolchain/bin
GCC_PREFIX ?= riscv64-unknown-elf
LINKER_SCRIPT ?= link.ld
STARTUP_CODE  ?= crt0.S
SIM_SOC ?= 1

NAME ?= gpio

%.hex: $(NAME).c n5_drv.c $(STARTUP_CODE) $(LINKER_SCRIPT)
	$(GCC_PATH)/$(GCC_PREFIX)-gcc -DSIM_SOC=$(SIM_SOC) -Wall  -falign-functions=4 -march=rv32ic -mabi=ilp32 -nostdlib -mstrict-align -T $(LINKER_SCRIPT) -o $(NAME).elf -lgcc $(STARTUP_CODE) n5_drv.c $(NAME).c  -lgcc
	$(GCC_PATH)/$(GCC_PREFIX)-objcopy -O binary $(NAME).elf $(NAME).bin
	$(GCC_PATH)/$(GCC_PREFIX)-objcopy -O verilog $(NAME).elf $(NAME).hex
	$(GCC_PATH)/$(GCC_PREFIX)-objdump -D $(NAME).elf > $(NAME).lst

all: $(NAME).hex