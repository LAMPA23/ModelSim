module pc(i_clk, i_rst_n, i_pc, o_pc);

	input               i_clk, i_rst_n;
	input       [31:0]  i_pc;
	output  reg [31:0]  o_pc;

	always @(posedge i_clk, negedge i_rst_n) begin
		if(~i_rst_n) begin
			o_pc = 0;
		end else begin
			o_pc = i_pc;
		end
	end

endmodule 
