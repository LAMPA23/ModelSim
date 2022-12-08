module next_pc(
        i_zero,
        i_j,
        i_beq,
        i_bne,
        i_incr_pc,
        i_imm26,
        o_mux_pc_src,
        o_pc30
    );

    input i_zero;
    input i_j;
    input i_beq;
    input i_bne;
    input [25:0] i_imm26;
    input [29:0] i_incr_pc;

    output o_mux_pc_src;
    output reg [31:0] o_pc30;

    assign o_mux_pc_src = (i_j) | (i_beq & i_zero) | (i_bne & ~i_zero);

    always@(*) begin 
        if (i_j) o_pc30 = {i_incr_pc[29:26], i_imm26};
        else o_pc30 = i_incr_pc + { (i_imm26[15]) ? 14'b11_1111_1111_1111 : 14'b0, i_imm26[15:0] };
    end

endmodule