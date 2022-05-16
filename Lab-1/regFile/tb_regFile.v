`timescale 1ns/10ps
module tb_regFile;

	parameter T = 10;

reg           i_clk1, i_we;
reg   [4:0]   i_raddr1, i_raddr2, i_waddr;
reg   [31:0]  i_wdata;           
wire  [31:0]  o_rdata1, o_rdata2;

regFile regFile_inst(
	.i_clk(i_clk1),
	.i_raddr1(i_raddr1), 
        .i_raddr2(i_raddr2), 
 	.i_waddr(i_waddr), 
        .i_wdata(i_wdata), 
        .i_we(i_we),
        .o_rdata1(o_rdata1),
        .o_rdata2(o_rdata2) 	
);

initial begin
	i_clk1 = 0;
	forever #(T/2) i_clk1 = ~i_clk1;
end

initial begin
	i_we = 0;
	forever #(T*2.7) i_we = ~i_we;
end

initial begin
	forever #(T*2.7) begin
		i_raddr1 = $random % 16;//чому я в симуляції отримую числа більші 16? Хіба це не остача від ділення на 16, яка впринципі не може бути більше 16? 
		i_raddr2 = $random % 16;
		i_waddr  = $random % 16;
		i_wdata  = $random;
	end
end

initial begin
	#(T*20) $stop;
end

endmodule