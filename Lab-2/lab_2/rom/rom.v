module rom(i_addr, o_data);

parameter DATA_WIDTH=32, ADDR_WIDTH=8;

input [ADDR_WIDTH-1:0] i_addr;
output reg [DATA_WIDTH-1:0] o_data;

reg [DATA_WIDTH-1:0] ROM [ADDR_WIDTH-1:0];

initial $readmemh("rom_init.dat", ROM);

always@(i_addr) o_data <= ROM[i_addr];

endmodule
