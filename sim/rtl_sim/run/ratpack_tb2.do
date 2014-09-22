# Filename : ratpack_tb2.do
# Author   : Nikolaos Kavvadias 2012, 2013, 2014
# Copyright: (C) 2012, 2013, 2014 Nikolaos Kavvadias

vlib work
vcom ../../../rtl/vhdl/ratpack.vhd
vcom ../../../bench/vhdl/ratpack_tb2.vhd
vsim ratpack_tb
onbreak {quit -f}
run -all
exit -f
