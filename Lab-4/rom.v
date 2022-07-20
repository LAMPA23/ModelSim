module rom(
        i_addr, 
        o_data
    );

    input [31:0] i_addr;
    output reg [31:0] o_data;

    reg [7:0] ROM [31:0];

    initial $readmemh("rom_init.dat", ROM);

    always@(i_addr) o_data <= { ROM[i_addr], ROM[i_addr + 1], ROM[i_addr + 2], ROM[i_addr + 3] };

endmodule
