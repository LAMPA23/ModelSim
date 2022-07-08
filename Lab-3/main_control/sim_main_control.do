if { [file exists "work"] } { vdel -all }
vlib work
vlog main_control.v tb_main_control.v
vsim work.tb_main_control 

add wave -unsigned sim:/tb_main_control/op
add wave -unsigned sim:/tb_main_control/func
add wave -unsigned sim:/tb_main_control/i_instrCode
add wave -unsigned sim:/tb_main_control/o_jump

add wave -binary sim:/tb_main_control/o_regDst
add wave -binary sim:/tb_main_control/o_memToReg
add wave -binary sim:/tb_main_control/o_ExtOp
add wave -binary sim:/tb_main_control/o_memWrite
add wave -binary sim:/tb_main_control/o_aluSrc
add wave -binary sim:/tb_main_control/o_regWrite
add wave -binary sim:/tb_main_control/o_branch

onbreak resume 
run -all
wave zoom full