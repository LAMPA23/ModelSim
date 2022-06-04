`timescale 1ns/10ps
module tb_rom();

parameter t = 10;
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 8;  

reg   [ADDR_WIDTH-1:0]  i_addr;
wire  [DATA_WIDTH-1:0]  o_data;

rom rom_inst(
.i_addr(i_addr),
.o_data(o_data)
);

initial begin
	forever #(2*t) begin
		i_addr = $random % 5 + 4;
	end
end

initial begin
	#(t*100) $stop;
end

endmodule 