if { [file exists "work"] } { vdel -all }
vlib work
vlog ram.v tb_ram.v
vsim work.tb_ram 
add wave -radix hexadecimal sim:/tb_ram/ram_inst/*
add wave -radix hexadecimal sim:/tb_ram/ram_inst/RAM
onbreak resume 
run -all
wave zoom full