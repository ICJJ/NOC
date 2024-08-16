SEED     ?= 1
TESTNAME ?= full_duplex_test

VCS_OPTION = -full64 -override_timescale=1ns/1ps -ntb_opts uvm-1.2 -sverilog -debug_access+all -Mupdate -notice +nospecify +notimingchecks +v2k +lint=all,noVCDE,noTMR +warn=all,noRVOSFD -kdb\
	     -sverilog +lint=none \
	     -f filelist.f \
		 +libext+.v -lca  \
	     +libext+.v+.vp+

VCS_OPTION += -P $(VERDI_HOME)/share/PLI/VCS/$(VERDI_PLATFORM)/novas.tab \
	      $(VERDI_HOME)/share/PLI/VCS/$(VERDI_PLATFORM)/pli.a

COV_ARGS += -cm line+cond+fsm+tgl+branch+assert

ifeq ($(shell uname -m),x86_64)
	VERDI_PLATFORM = LINUXAMD64
	BFM_PLATFORM = Linux-RHE64
	VCS_OPTION += -full64
else
	VERDI_PLATFORM = LINUX
	BFM_PLATFORM = Linux
endif

all: vcs_com sim

vcs_com:
	@echo $(shell if [ -d $(TESTNAME) ]; then echo "exist $(TESTNAME) directory"; else mkdir $(TESTNAME); fi)
	cd ./$(TESTNAME) ; \
	cp ../filelist.f ./ ; \
	cp ../Makefile ./ ; \
	vcs $(VCS_OPTION) $(COV_ARGS) -l vcs_com.log 


sim:
	cd ./$(TESTNAME) ; \
	./simv +ntb_random_seed=$(SEED) +UVM_TESTNAME=$(TESTNAME) $(COV_ARGS) -l result.log \
	+UVM_NO_RELNOTES +UVM_VERDI_TRACE=UVM_AWARE+HIER+RAL+COMPWAVE +UVM_VERBOSITY=UVM_NONE -gui=verdi


verdi:
	verdi -sv -f filelist.f -ssf testbench.fsdb &

cov:
	dve -full64 -covdir simv.vdb &

viewcov:
	urg -full64 -format both -dir simv.vdb &
	firefox urgReport/dashboard.html &

clean:
	rm -rf *.log *.fsdb stack* csrc simv* *.key *.h novas.*

