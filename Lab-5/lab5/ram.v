module ram(
		i_clk, 
		i_addr, 
		i_data, 
		i_read_en,	// enable read from ram to reg
		i_write_en,	// enable write from reg to ram
		o_data
	);

	parameter DATA_WIDTH = 32;
	parameter ADDR_WIDTH = 32; 

	input                     i_clk, i_read_en, i_write_en;
	input   [ADDR_WIDTH-1:0]  i_addr;
	input   [DATA_WIDTH-1:0]  i_data;
	output reg [DATA_WIDTH-1:0]  o_data;

	reg [DATA_WIDTH-1:0] RAM [ADDR_WIDTH-1:0];

	integer i;

	initial begin
		for ( i = 0; i < ADDR_WIDTH; i = i + 1 ) begin
			RAM[i] = $random % 16;
		end
	end


	always@(*) begin
		if(i_read_en) o_data = RAM[i_addr];
	end  

	always@(posedge i_clk) begin
		if(i_write_en) RAM[i_addr] = i_data;
	end


endmodule