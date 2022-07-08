`timescale 1ns/10ps
module tb_alu();

parameter t = 10;

reg [31:0] i_op1, i_op2;
reg [5:0] i_func;
reg [1:0] i_aluOp;
wire [3:0] o_aluControl_i_control;
wire [31:0] o_result;
wire o_zf;

alu alu_inst(
.i_op1(i_op1),
.i_op2(i_op2),
.i_control(o_aluControl_i_control),
.o_result(o_result),
.o_zf(o_zf)
);

aluControl aluControl_inst(
.i_aluOp(i_aluOp),
.i_func(i_func),
.o_aluControl(o_aluControl_i_control)
);


initial begin
	forever #(t) begin
		i_op1 = $random % 8 + 7;	
		i_op2 = $random % 8 + 7;
	end
end

initial begin
	forever #(2*t) begin
		i_func = $random % 6 + 37;
	end
end

initial i_aluOp = 0;

initial begin
	#(t*100) $stop;
end


endmodule