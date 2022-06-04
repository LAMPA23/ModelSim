if { [file exists "work"] } { vdel -all }
vlib work
vlog rom.v tb_rom.v
vsim work.tb_rom 
add wave -radix hexadecimal sim:/tb_rom/rom_inst/*
add wave -radix hexadecimal sim:/tb_rom/rom_inst/ROM
onbreak resume 
run -all
wave zoom full