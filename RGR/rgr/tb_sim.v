`timescale 1ns/10ps
module tb_sim();

	parameter t = 10; 

	reg [31:0] code_help;
	//initial code_help = {6'd0, 5'd5, 5'd4, 5'd1, 5'd0, 6'd42}; // I use these for create commands code
	initial begin 
	 	# (t)
		code_help = {6'd43, 5'd0, 5'd1, 16'd287}; 
		# (t)
		code_help = {6'd8, 5'd0, 5'd1, 16'd1}; 
	end
	//initial code_help = {6'd2, 26'd2}; // I use these for create commands code

	reg clk;
	reg rst;
	
	core core_inst(
		.i_clk(clk),
		.i_uart_rst(rst)
	);

	initial begin
		clk = 0;
		forever #(t / 2) begin
			clk = ~clk;
		end
	end
	initial begin
		rst = 0;
	end

	initial begin
		#(t*10000) $stop;
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

/*
		Lab 5
	8c040000 - Op = 35| Rs = 0 | Rt = 4 | Imm = 0 	number_0 => $4
	8c050001 - Op = 35| Rs = 0 | Rt = 5 | Imm = 1 	number_1 => $5
	8c060002 - Op = 35| Rs = 0 | Rt = 6 | Imm = 2	number_2 => $6

	-----

	00a4082a - Op = 0 | Rs = 5 | Rt = 4 | Rd = 1 | sa = 0 | funct = 42 $4>$5?

	10200003 - Op = 4 | Rs = 1 | Rt = 0 | Imm = 3 - branch on if no

	00852020 - Op = 0 | Rs = 4 | Rt = 5 | Rd = 4 | sa = 0 | funct = 32 $4=$4+$5
	00852822 - Op = 0 | Rs = 4 | Rt = 5 | Rd = 5 | sa = 0 | funct = 34 $5=$4-$5
	00852022 - Op = 0 | Rs = 4 | Rt = 5 | Rd = 4 | sa = 0 | funct = 34 $4=$4-$5

	-----

	00c5082a - Op = 0 | Rs = 5 | Rt = 4 | Rd = 1 | sa = 0 | funct = 42 $5>$6?

	10200004 - Op = 4 | Rs = 1 | Rt = 0 | Imm = 4 - branch on if no

	00a62820 - Op = 0 | Rs = 5 | Rt = 6 | Rd = 5 | sa = 0 | funct = 32 $5=$5+$6
	00a63022 - Op = 0 | Rs = 5 | Rt = 6 | Rd = 6 | sa = 0 | funct = 34 $6=$5-$6
	00a62822 - Op = 0 | Rs = 5 | Rt = 6 | Rd = 5 | sa = 0 | funct = 34 $5=$5-$6

	-----

	00a4082a - Op = 0 | Rs = 5 | Rt = 4 | Rd = 1 | sa = 0 | funct = 42 $4>$5?

	10200003 - Op = 4 | Rs = 1 | Rt = 0 | Imm = 3 - branch on if no

	00852020 - Op = 0 | Rs = 4 | Rt = 5 | Rd = 4 | sa = 0 | funct = 32 $4=$4+$5
	00852822 - Op = 0 | Rs = 4 | Rt = 5 | Rd = 5 | sa = 0 | funct = 34 $5=$4-$5
	00852022 - Op = 0 | Rs = 4 | Rt = 5 | Rd = 4 | sa = 0 | funct = 34 $4=$4-$5

	-----

	20060001 - Op = 8 | Rs = 0 | Rt = 6 | Imm = 1

	-----

	08000003 - Op = 2 | Imm = 4

		all comands
	8c040000
	8c050001
	8c060002
	00a4082a
	10200003
	00852020
	00852822
	00852022
	00c5082a
	10200004
	00a62820
	00a63022
	00a62822
	00a4082a
	10200003
	00852020
	00852822
	00852022
	20060001
	08000003
	
*/

/*
			RGR
	ac00011а - Op = 43| Rs = 0 | Rt = 0 | Imm = 287
*/