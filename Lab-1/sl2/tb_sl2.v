`timescale 1ns/1ps
module tb_sl2();
    parameter
        WIDTH = 32,
        T = 10;

    reg [WIDTH-1:0] i_data;
    wire [WIDTH-1:0] o_data;

    sl2 sl2_inst(
        .i_data(i_data),
        .o_data(o_data)
        );

    initial begin
	    i_data = $random;
        forever begin
            #T i_data = $random;
        end
    end

    initial begin
        # ( T * 8) $stop;
    end

endmodule
