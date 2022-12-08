if { [file exists "work"] } { vdel -all }
vlib work
vlog rom.v pc_reg.v pc_adder.v alu.v reg_file.v mux.v 
vlog extender.v ram.v next_pc.v main_control.v 
vlog alu_control.v main_core.v tb_sim.v
vlog uart_mem.v uart_sender.v uart_receiver.v
vsim work.tb_sim 

add wave -radix hexadecimal sim:/tb_sim/clk
#add wave -radix hexadecimal sim:/tb_sim/rst
#add wave -radix decimal sim:/tb_sim/main_core_inst/alu_out
add wave -radix decimal sim:/tb_sim/main_core_inst/reg_file_inst/Registers
add wave -radix unsigned sim:/tb_sim/main_core_inst/uart_out

#add wave -radix hexadecimal sim:/tb_sim/code_help
#add wave -radix decimal sim:/tb_sim/main_core_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/pc_reg_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/ram_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/ram_inst/RAM
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/*
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/ROM_32
#add wave -radix unsigned sim:/tb_sim/main_core_inst/reg_file_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/reg_file_inst/Registers
#add wave -radix decimal sim:/tb_sim/main_core_inst/alu_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/next_pc_inst/*


#add wave -radix unsigned sim:/tb_sim/main_core_inst/uart_receiver_inst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/uart_sender_inst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/uart_mem_inst/*
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/uart_mem_inst/mem








#add wave -radix decimal sim:/tb_sim/main_core_inst/alu_inst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/reg_file_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/reg_file_inst/Registers
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/*
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/ROM_32
#add wave -radix decimal sim:/tb_sim/main_core_inst/next_pc_inst/*
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/*
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/ROM


#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/code_help
#add wave -radix decimal sim:/tb_sim/main_core_inst/alu_inst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/reg_file_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/reg_file_inst/Registers
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/*
#add wave -radix hexadecimal sim:/tb_sim/main_core_inst/rom_inst/ROM
#add wave -radix unsigned sim:/tb_sim/main_core_inst/mux_inst_pc_src/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/pc_adder_inst/*


#add wave -radix decimal sim:/tb_sim/main_core_inst/rom_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/pc_reg_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/mux_inst_pc_src/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/next_pc_inst/*

#add wave -radix unsigned sim:/tb_sim/main_core_inst/reg_file_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/alu_inst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/reg_file_inst/Registers
#add wave -radix decimal sim:/tb_sim/main_core_inst/extender_inst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/mux_inst_reg_gst/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/mux_inst_alu_src/*
#add wave -radix unsigned sim:/tb_sim/main_core_inst/mux_inst_mem_to_reg/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/ram_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/rom_inst/*
#add wave -radix decimal sim:/tb_sim/main_core_inst/ram_inst/RAM
#add wave -radix decimal sim:/tb_sim/main_core_inst/mux_inst_pc_src/*

onbreak resume 
run -all
wave zoom full