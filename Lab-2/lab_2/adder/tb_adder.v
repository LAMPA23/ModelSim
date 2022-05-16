`timescale 1ns/10ps

module tb_adder();

parameter t = 10;

reg [31:0] i_op1, i_op2;
wire [31:0] o_result;
 
adder adder_inst(
	.i_op1(i_op1),
	.i_op2(i_op2),
	.o_result(o_result));

initial begin 
	forever #(t) begin 
		i_op1 = $random % 8;
		i_op2 = $random % 8;
	end
end

initial #(t*100) $stop;

endmodule