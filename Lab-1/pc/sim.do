if { [file exists "work"] } { vdel -all }
vlib work
vlog pc.v tb_pc.v
vsim work.tb_pc 
add wave -radix unsigned sim:/tb_pc/*
onbreak resume 
run -all
wave zoom full