if {[file exists "work"]} {vdel -all}
vlib work
vlog signExtend.v tb_signExtend.v
vsim work.tb_signExtend
add wave -binary tb_signExtend/*
onbreak resum
run -all
wave zoom full