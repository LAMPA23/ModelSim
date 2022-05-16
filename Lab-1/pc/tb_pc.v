`timescale 1ns/1ps
module tb_pc();

    parameter T = 10;

    reg i_clk, i_rst_n;
    reg [31:0] i_pc;
    wire [31:0] o_pc;

    pc pc_inst(
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_pc(i_pc),
        .o_pc(o_pc)
        );

    initial begin
        i_clk = 0;
        forever #(T/2) i_clk = ~i_clk;
    end

    initial begin
        i_rst_n = 1;
        forever begin
            #(T*5) i_rst_n = 0;
            #(T/2) i_rst_n = 1;
        end
    end


    initial begin
        forever #(T*2) i_pc = $random;
    end

    initial begin
        #(T*15) $stop;
    end


endmodule 
