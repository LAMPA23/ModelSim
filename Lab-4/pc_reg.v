module pc_reg(
        i_clk,
        i_data,
        o_data
    );

    input i_clk;
    input [29:0] i_data;
    output reg [31:0] o_data;

    initial o_data = -1;

    always @(posedge i_clk) o_data = {i_data[29:0], 2'b0};

endmodule