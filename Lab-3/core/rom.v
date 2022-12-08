module rom(
        i_addr, 
        o_data
    );

    input [31:0] i_addr;
    output reg [31:0] o_data;

    reg [31:0] ROM_32 [200:0];

    initial $readmemh("rom_init.dat", ROM_32);

    always@(i_addr) o_data <= ROM_32[i_addr[31:2]];  

endmodule