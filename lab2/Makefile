DIR_COSIM_IP	?= $(CURDIR)/ip
DIR_SIM			?= $(CURDIR)/sim
DIR_BUILD		?= $(CURDIR)/build
DIR_SRC			?= $(CURDIR)/submit

VERILATOR_TOP		:= Testbench
VERILATOR_SRCS		=  $(shell find $(DIR_SIM) -name "*.v" -o -name "*.sv" -o -name "*.cpp") \
					   $(shell find $(DIR_SRC) -name "*.v" -o -name "*.sv" -o -name "*.cpp")
VERILATOR_TFLAGS	:= -Wno-WIDTH -Wno-STMTDLY --no-timing --timescale 1ns/1ps --trace
VERILATOR_FLAGS		:= --cc --exe --Mdir $(DIR_BUILD) --top-module $(VERILATOR_TOP) -o $(VERILATOR_TOP) -I$(DIR_SIM) -CFLAGS "-DVL_DEBUG -DTOP=${VERILATOR_TOP} -std=c++17 -iquote$(DIR_COSIM_IP)/include/riscv -iquote$(DIR_COSIM_IP)/include/cosim -iquote$(DIR_COSIM_IP)/include/fesvr" -LDFLAGS "-L$(DIR_COSIM_IP)/lib  -l:libcosim.a -l:libriscv.a -l:libdisasm.a -l:libsoftfloat.a -l:libfdt.a -l:libspike_dasm.a -l:libfesvr.a -l:libspike_main.a -l:libcontroller.a"

TESTCASE ?= sample

all: verilator

verilator:
	mkdir -p $(DIR_BUILD)
	cp testcase/$(TESTCASE)/*.elf $(DIR_BUILD)/testcase.elf
	cp testcase/$(TESTCASE)/*.hex $(DIR_BUILD)/testcase.hex
	verilator $(VERILATOR_TFLAGS) $(VERILATOR_FLAGS) $(VERILATOR_SRCS)
	cd $(DIR_BUILD); cp V${VERILATOR_TOP}.h VTOP.h
	make -C $(DIR_BUILD) -f V$(VERILATOR_TOP).mk $(VERILATOR_TOP)
	cd $(DIR_BUILD); ./$(VERILATOR_TOP)

wave:
	gtkwave $(DIR_BUILD)/$(VERILATOR_TOP).vcd --rcvar 'fontname_signals Monospace 14' --rcvar 'fontname_waves Monospace 14'

clean:
	rm -rf $(DIR_BUILD)
