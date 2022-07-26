module rom(
        i_addr, 
        o_data
    );

    input [31:0] i_addr;
    output reg [31:0] o_data;

    integer i;

    reg [7:0] ROM_8 [840:0];
    reg [31:0] ROM_32 [200:0];

    initial $readmemh("rom_init.dat", ROM_32);

    initial begin
        for(i = 0; i < 200; i = i + 1 ) begin
            ROM_8[i*4+0] = ROM_32[i][31:24];
            ROM_8[i*4+1] = ROM_32[i][23:16];
            ROM_8[i*4+2] = ROM_32[i][15:8];
            ROM_8[i*4+3] = ROM_32[i][7:0];
        end
    end

    always@(i_addr) o_data <= { ROM_8[i_addr], ROM_8[i_addr + 1], ROM_8[i_addr + 2], ROM_8[i_addr + 3] };

endmodule