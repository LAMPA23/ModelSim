`timescale 1ns/10ps
module tb_signExtend;

parameter T = 10;

reg en;
reg [15:0] i_data;
wire [31:0] o_data;

signExtend signExtend_inst(
	.i_data(i_data),
	.en(en),
	.o_data(o_data)
);

initial begin 
	i_data = 0;
	forever #(T) i_data = $random;
end

initial begin
	en = 0;
	forever #(T*4) en = ~en;
end

initial #(T*24) $stop;

endmodule