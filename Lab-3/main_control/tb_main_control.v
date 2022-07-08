`timescale 1 ns / 10 ps
module tb_main_control();

    parameter t = 10;

    wire  [11:0]  i_instrCode;
    wire          o_regDst;
    wire [1:0]    o_jump;         
    wire          o_memToReg;
    wire          o_ExtOp;
    wire          o_memWrite;
    wire          o_aluSrc;
    wire          o_regWrite; 
    wire          o_branch;

    reg [5:0] op, func;

    assign i_instrCode [11:6] = op;
    assign i_instrCode [5:0] = func;

    main_control inst_main_control(
        .i_instrCode(i_instrCode),  //  from Inst_mem->{31:26, 5:0}
        .o_regDst(o_regDst),        //  for mux
        .o_jump(o_jump),            //  for NextPC 
        .o_memToReg(o_memToReg),    //  for mux
        .o_ExtOp(o_ExtOp),          //  for sigbExtend->i_en
        .o_memWrite(o_memWrite),    //  for ram->i_we 0-read 1-write
        .o_aluSrc(o_aluSrc),        //  for mux
        .o_regWrite(o_regWrite),    //  for regFile->i_ew 0-read 1-write
        .o_branch(o_branch)
    );

    initial begin
        op = 0;
        #(t) func = 32;
        #(t) func = 33;
        #(t) func = 34;
        #(t) func = 35;
        #(t) op = 2;
        #(t) op = 4;
        #(t) op = 8;
        #(t) op = 9;
        #(t) op = 35;
        #(t) op = 43;
        #(t) op = 43;
    end

    initial begin
        #(t * 13) $stop;
    end


endmodule