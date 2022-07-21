module main_control(
        i_instr_code,//  from Inst_mem->{31:26, 5:0}
        o_jump,     //  for NextPC 
        o_beq,
        o_bne,
        o_mem_to_reg, //  for mux
        o_reg_dst,   //  for mux
        o_ext_op,    //  for sigbExtend->i_en
        o_mem_write, //  for ram->i_we 0-read 1-write
        o_mem_read, 
        o_alu_src,   //  for mux
        o_reg_write  //  for regFile->i_ew 0-read 1-write
    );
    
    input       [5:0]  i_instr_code;
    output reg          o_reg_dst;
    output reg          o_jump; 
    output reg          o_beq;
    output reg          o_bne;
    output reg          o_mem_to_reg;
    output reg          o_ext_op;
    output reg          o_mem_write;
    output reg          o_mem_read;
    output reg          o_alu_src;
    output reg          o_reg_write;

    always @(i_instr_code) begin
     //Reset
        o_reg_dst = 0; //6'bxxxxxx;
        o_reg_write = 0; //6'bxxxxxx;
        o_ext_op = 0; //6'bxxxxxx;
        o_alu_src = 0; //6'bxxxxxx;
        o_beq = 0; //6'bxxxxxx;
        o_bne = 0; //6'bxxxxxx;
        o_jump = 0; //6'bxxxxxx;
        o_mem_read = 0; //6'bxxxxxx;
        o_mem_write = 0; //6'bxxxxxx;
        o_mem_to_reg = 0; //6'bxxxxxx;  

     // R-type and I-type
        case(i_instr_code)
            0: begin
                o_reg_dst = 1;
                o_reg_write = 1;
                o_ext_op = 0;
                o_alu_src = 0;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
                end
            2: begin    //  jump  
                o_reg_dst = 0;
                o_reg_write = 0;
                o_ext_op = 0;
                o_alu_src = 0;
                o_beq = 0;
                o_bne = 0;
                o_jump = 1;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            4: begin    //  beq
                o_reg_dst = 0;
                o_reg_write = 0;
                o_ext_op = 0;
                o_alu_src = 0;
                o_beq = 1;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            5: begin    //  bne
                o_reg_dst = 0;
                o_reg_write = 0;
                o_ext_op = 0;
                o_alu_src = 0;
                o_beq = 0;
                o_bne = 1;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            8: begin    //  addi
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 1;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            9: begin    //  addiu
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 1;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            10: begin   //  slti
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 1;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            12: begin   //  andi
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 0;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            13: begin   //  ori
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 0;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            14: begin   //  xori
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 0;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 0;
                o_mem_to_reg = 0;
            end
            35: begin   //  lw
                o_reg_dst = 0;
                o_reg_write = 1;
                o_ext_op = 1;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 1;
                o_mem_write = 0;
                o_mem_to_reg = 1;
            end
            43: begin   //  sw
                o_reg_dst = 0;
                o_reg_write = 0;
                o_ext_op = 1;
                o_alu_src = 1;
                o_beq = 0;
                o_bne = 0;
                o_jump = 0;
                o_mem_read = 0;
                o_mem_write = 1;
                o_mem_to_reg = 0;
            end
        endcase
    end
endmodule