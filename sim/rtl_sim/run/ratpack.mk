GHDL=ghdl
GHDLFLAGS=--ieee=synopsys -fexplicit --workdir=work
# Use stop-time = 2340ns for computing Farey series' F1 to F12.
GHDLRUNFLAGS=--stop-time=2340ns

# Default target : elaborate
all : run

# Elaborate target.  Almost useless
elab : force
	$(GHDL) -c $(GHDLFLAGS) -e ratpack_tb

# Run target
run: force
	$(GHDL) --elab-run $(GHDLFLAGS) ratpack_tb $(GHDLRUNFLAGS)

# Targets to analyze libraries
init: force
	mkdir work
	$(GHDL) -a $(GHDLFLAGS) ../../../rtl/vhdl/ratpack.vhd
	$(GHDL) -a $(GHDLFLAGS) ../../../bench/vhdl/ratpack_tb$(TEST).vhd

force:

clean :
	rm -rf *.o work ratpack_results.txt
