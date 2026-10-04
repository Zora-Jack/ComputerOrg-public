.PHONY: bhv_sim bhv_sim_cpl wav_chk

SIM_SRC_LOC := fpga/design/ucas-cod/hardware/sim
RTL_SRC_LOC := $(SIM_SRC_LOC)/../sources
SIM_OBJ_LOC := fpga/sim_out/$(SIM_TARGET)
EMU_OBJ_LOC := fpga/emu_out

ifneq ($(SIM_DUT),)
DUT_ISA  := $(shell echo $(SIM_DUT) | awk -F ":" '{print $$1}')
DUT_ARCH := $(shell echo $(SIM_DUT) | awk -F ":" '{print $$2}')
endif

ifneq ($(WORKLOAD),)
BENCH_SUITE   := $(shell echo $(WORKLOAD) | awk -F ":" '{print $$1}')
LIKELY_GROUP  := $(shell echo $(WORKLOAD) | awk -F ":" '{print $$2}')
LIKELY_BENCH  := $(shell echo $(WORKLOAD) | awk -F ":" '{print $$3}')

ifeq ($(LIKELY_BENCH),)
BENCH       := $(LIKELY_GROUP)
BENCH_GROUP :=
else
BENCH       := $(LIKELY_BENCH)
BENCH_GROUP := $(LIKELY_GROUP)
endif
include $(SIM_SRC_LOC)/workload/$(BENCH_SUITE).mk
endif

ifneq ($(SIM_TARGET),)
include $(SIM_SRC_LOC)/$(SIM_TARGET)/sim.mk
endif

VERILATOR_PATH := $(shell pwd)/fpga/sim_out/verilator

$(SIM_OBJ_LOC)/$(SIM_TARGET): $(SIM_SRCS) $(ARCH_OPTION_TCL)
	@mkdir -p $(SIM_OBJ_LOC)
	if [ ! -d $(VERILATOR_PATH) ]; then \
		git clone --depth=1 http://8.152.206.202/ucas-cod-2021-dev/cod-verilator-bin.git $(VERILATOR_PATH); \
		chmod -R +x $(VERILATOR_PATH)/bin; \
	fi
	$(VERILATOR_PATH)/bin/verilator --cc --exe --trace --x-initial 0 -Wno-lint -Wno-unoptflat -CFLAGS -Wall --top-module $(SIM_TOP) -Mdir $(SIM_OBJ_LOC) -o $(SIM_TARGET) $(VL_FLAGS) $(SIM_SRCS) $(SIM_SRCS_VL)
	make -C $(SIM_OBJ_LOC) -f V$(SIM_TOP).mk VERILATOR_ROOT=$(VERILATOR_PATH) $(SIM_TARGET)

bhv_sim_verilator: $(SIM_OBJ_LOC)/$(SIM_TARGET) $(ARCH_OPTION_TCL)
	-$(VERILATOR_PATH)/bin/verilator --lint-only --top-module $(SIM_TOP) $(VL_FLAGS) $(SIM_SRCS) $(SIM_SRCS_VL)
	$(SIM_OBJ_LOC)/$(SIM_TARGET) +DUMP="$(SIM_DUMP)" +INITMEM="$(MEM_FILE)" +TRACE_FILE="$(TRACE_FILE)"


trace_generate: $(SIM_SRCS) $(ARCH_OPTION_TCL)
	@mkdir -p $(SIM_OBJ_LOC)
	if [ ! -d $(VERILATOR_PATH) ]; then \
		git clone --depth=1 http://8.152.206.202/ucas-cod-2021-dev/cod-verilator-bin.git $(VERILATOR_PATH); \
		chmod -R +x $(VERILATOR_PATH)/bin; \
	fi
	$(VERILATOR_PATH)/bin/verilator --cc --exe --trace --x-initial 0 -Wno-lint -Wno-unoptflat -CFLAGS -Wall --top-module $(SIM_TOP) -Mdir $(SIM_OBJ_LOC) -o $(SIM_TARGET) $(VL_FLAGS) $(SIM_SRCS) $(SIM_SRCS_IV)
	make -C $(SIM_OBJ_LOC) -f V$(SIM_TOP).mk VERILATOR_ROOT=$(VERILATOR_PATH) $(SIM_TARGET)
	-$(VERILATOR_PATH)/bin/verilator --lint-only --top-module $(SIM_TOP) $(VL_FLAGS) $(SIM_SRCS) $(SIM_SRCS_IV)
	$(SIM_OBJ_LOC)/$(SIM_TARGET) +DUMP="$(SIM_DUMP)" +INITMEM="$(MEM_FILE)" +TRACE_FILE="$(TRACE_FILE)"

ifndef SIM_TOP_IV
SIM_TOP_IV := $(SIM_TOP)
endif

bhv_sim:
	@mkdir -p $(SIM_OBJ_LOC)
	iverilog -o $(SIM_BIN) -s $(SIM_TOP_IV) $(IV_FLAGS) $(SIM_SRCS) $(SIM_SRCS_IV)
	vvp $(VVP_FLAGS) $(SIM_BIN) +DUMP="$(SIM_DUMP)" $(PLUSARGS) | tee bhv_sim.log && bash fpga/err_det.sh bhv_sim.log

wav_chk:
	@cd fpga/design/ucas-cod/run/ && bash get_wav.sh $(SIM_TARGET) $(SIM_DUMP) $(LIKELY_BENCH)

emu_transform:
	@mkdir -p $(EMU_OBJ_LOC)
	stdbuf -o0 yosys -c fpga/design/ucas-cod/hardware/emu/scripts/yosys.tcl