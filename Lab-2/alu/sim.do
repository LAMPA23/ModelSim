if { [file exists "work"] } { vdel -all }
vlib work
vlog aluControl.v alu.v tb_alu.v
vsim work.tb_alu 
add wave -radix decimal sim:/tb_alu/i_op1
add wave -radix decimal sim:/tb_alu/i_op2
add wave -radix decimal sim:/tb_alu/i_aluOp
add wave -radix decimal sim:/tb_alu/o_aluControl_i_control;
add wave -radix decimal sim:/tb_alu/o_result
add wave -radix hexadecimal sim:/tb_alu/i_func
add wave -binary sim:/tb_alu/*
onbreak resume 
run -all
wave zoom full