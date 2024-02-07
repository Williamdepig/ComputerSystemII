# Replace with your own path, for example:
#   If your Vivado is installed in Windows:   
#        VIVADO_SETUP := call D:\Xilinx\Vivado\2022.2\settings64.bat
#   or in Linux: 
#        VIVADO_SETUP := source /opt/Xilinx/Vivado/2022.2/settings64.sh
VIVADO_SETUP		:=  call D:\software\Vivado\Vivado\2022.2\settings64.bat

DIR_SRC				:=	$(shell realpath src)
DIR_TCL				:=  $(shell realpath tcl)
DIR_BUILD			:=	$(shell realpath build)
CMD_PREFIX			:=	bash -c
PATH_TRANS			:=	realpath

BOARD				?=	xc7a100tcsg324-1
TOP_MODULE			?=	top

ifneq (,$(findstring microsoft,$(shell uname -a)))
WSLENV				:=	$(WSLENV):DIR_SRC/p:DIR_TCL/p:DIR_BUILD/p
DIR_BUILD			:=	/mnt/d/software/git/vivadobit/sys2-lab1-forwarding
CMD_PREFIX			:=	cmd.exe /c
PATH_TRANS			:=	wslpath -w
endif

export DIR_SRC DIR_TCL DIR_BUILD

.PHONY: all

all: clean
	mkdir -p $(DIR_BUILD)
	cd $(DIR_BUILD); cp $(DIR_TCL)/vivado.tcl .; $(CMD_PREFIX) "$(VIVADO_SETUP) && set DIR_SRC && \
		vivado -mode batch -nojournal -source vivado.tcl -tclargs -top-module $(TOP_MODULE) -board $(BOARD)"

vivado:
	mkdir -p $(DIR_BUILD)
	cd $(DIR_BUILD); $(CMD_PREFIX) "$(VIVADO_SETUP) && vivado"

clean:
	rm -rf $(DIR_BUILD)
