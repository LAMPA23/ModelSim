if {[file exists "work"]} {vdel -all}
vlib work
vlog regFile.v tb_regFile.v
vsim work.tb_regFile
add wave -radix unsigned tb_regFile/*
add wave -radix unsigned tb_regFile/regFile_inst/Registers
onbreak resum
run -all
wave zoom full