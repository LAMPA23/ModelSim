`timescale 1ns/10ps
module tb_sim();

	//reg [31:0] code_help;
	//initial code_help = {6'd0, 5'd20, 5'd15, 5'd2, 5'd0, 6'd42}; // I use these for create commands code
	//initial code_help = {6'd5, 5'd20, 5'd0, -16'd4}; // I use these for create commands code
	//initial code_help = {6'd2, 26'd2}; // I use these for create commands code

	parameter t = 10; 

	reg clk;
	
	core core_inst(.i_clk(clk));

	initial begin
		clk = 0;
		forever #(t / 2) begin
			clk = ~clk;
		end
	end

	initial begin
		#(t*11) $stop;
	end

endmodule 

/*
		Codes from rom_init.dat in unsigned decimal value
 R-type
	028f1020 - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 32 ADD
	028f1022 - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 34 SUB
	028f1024 - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 36 AND
	028f1025 - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 37 OR
	028f1026 - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 38 XOR
	028f1027 - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 39 NOR
	028f102a - Op = 0 | Rs = 20 | Rt = 15 | Rd = 2 | sa = 0 | funct = 42 SLT
 I-type
	228fffff - Op = 8 | Rs = 20 | Rt = 15 | Imm = -1 ADDI
	2a8fffff - Op = 10| Rs = 20 | Rt = 15 | Imm = -1 SLTI
 Load
	8e8f0002 - Op = 35| Rs = 20 | Rt = 15 | Imm = 2 
	8e8ffffe - Op = 35| Rs = 20 | Rt = 15 | Imm = -2
 Store
	ae8f0002 - Op = 43| Rs = 20 | Rt = 15 | Imm = 2
	ae8ffffe - Op = 43| Rs = 20 | Rt = 15 | Imm = -2
 Jump
	08000002 - Op = 2 | Imm = 2
 Beq
	1280fffe - Op = 4 | Rs = 20 | Rt = 0 | Imm = -2 
	1293fffe - Op = 4 | Rs = 20 | Rt = 19| Imm = -2 
	12930002 - Op = 4 | Rs = 20 | Rt = 19| Imm = 2 
 Bne
	1680fffe - Op = 5 | Rs = 20 | Rt = 0 | Imm = -2 
	1680fffd - Op = 5 | Rs = 20 | Rt = 0 | Imm = -3 
	1680fffc - Op = 5 | Rs = 20 | Rt = 0 | Imm = -4 
*/