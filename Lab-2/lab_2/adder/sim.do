if {[file exists "work"]} {vdel -all}
vlib work
vlog adder.v tb_adder.v
vsim tb_adder
add wave -radix signed sim:/tb_adder/*
onbreak resume
run -all
wave zoom full