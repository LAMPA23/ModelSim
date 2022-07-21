module core(i_clk);

    input i_clk;

	wire reg_file_write_en; 	// enable write from ram ro reg
	wire mux_reg_dst_ctrl;		// mux control
	wire mux_alu_src_ctrl; 		// mux control
	wire mux_mem_to_reg_ctrl;	// mux control
	wire ext_op; 				// extender control 
	wire read_mem_ram_en; 		// enable read from ram to reg
	wire write_mem_ram_en; 		// enable write from reg to ram
		
	wire j;
	wire beq;
	wire bne; 
	wire zero; // alu out

	wire wire_1_0;
	
	wire [4:0]  wire_5_0;  	// mux out

	wire [5:0]  wire_6_0;  	// alu_control out

	wire [29:0] wire_30_0;	// pc_adder out
	wire [29:0] wire_30_1;	// mux pc_src out
	wire [29:0] wire_30_2;

	wire [31:0] wire_32_0;  // mux out
	wire [31:0] wire_32_1;	// mux out
	wire [31:0] wire_32_2;	// extender out
	wire [31:0] wire_32_3;	// alu out
	wire [31:0] wire_32_4;	// ram out
	wire [31:0] wire_32_5;	// pc_reg in
	wire [31:0] wire_32_6; 	// rom out
	wire [31:0] wire_32_7; 	// reg_file out
	wire [31:0] wire_32_8; 	// reg_file out
	wire [32:0] wire_32_9;	// next_pc out
	wire [32:0] wire_32_10; // mux pc_src control 
	wire [32:0] wire_32_11;	// 
	wire [32:0] wire_32_12;	// from pc_reg->o_data to pc_adder->i_data and rom->i_addr

	main_control main_control_inst(
		.i_instr_code(wire_32_6[31:26]),//  from Inst_mem->{31:26, 5:0}
        .o_jump(j),     //  for NextPC 
        .o_beq(beq),
        .o_bne(bne),
        .o_mem_to_reg( mux_mem_to_reg_ctrl), //  for mux
        .o_reg_dst(mux_reg_dst_ctrl),   //  for mux
        .o_ext_op(ext_op),    //  for sigbExtend->i_en
        .o_mem_write(write_mem_ram_en), //  for ram->i_we 0-read 1-write
        .o_mem_read(read_mem_ram_en), 
        .o_alu_src(mux_alu_src_ctrl),   //  for mux
        .o_reg_write(reg_file_write_en)
	);

	alu_control alu_control_inst(
		.i_aluOp(wire_32_6[31:26]), 
		.i_func(wire_32_6[5:0]), 
		.o_aluControl(wire_6_0)
	);

	rom rom_inst(
		.i_addr(wire_32_12),
		.o_data(wire_32_6)
	);

	ram ram_inst(
		.i_clk(i_clk), 
		.i_addr(wire_32_3), 
		.i_data(wire_32_8), 
		.i_read_en(read_mem_ram_en),	// enable read from mem to reg
		.i_write_en(write_mem_ram_en),	// enable write from reg to mem
		.o_data(wire_32_4)
	);

	pc_adder pc_adder_inst(
		.i_data(wire_32_12[31:2]),
		.o_data(wire_30_0)
	);

	pc_reg pc_reg_inst(
		.i_clk(i_clk),
		.i_data(wire_30_1),
		.o_data(wire_32_12)
	);

	reg_file reg_file_inst(
		.i_clk(i_clk), 
        .i_raddr1(wire_32_6[25:21]), 
        .i_raddr2(wire_32_6[20:16]), 
        .i_waddr(wire_5_0), 
        .i_wdata(wire_32_1), 
        .i_we(reg_file_write_en), 
        .o_rdata1(wire_32_7),
        .o_rdata2(wire_32_8)
	);

	alu alu_inst(
		.i_op1(wire_32_7), 
		.i_op2(wire_32_0), 
		.i_control(wire_6_0), 
		.o_result(wire_32_3), 
		.o_zf(zero)
	);


	mux #(.data_size(5)) mux_inst_reg_gst( 
		.i_control(mux_reg_dst_ctrl),
        .i_data_0(wire_32_6[20:16]), // if i-tupe
        .i_data_1(wire_32_6[15:11]), // if r-type
        .o_data(wire_5_0)
	);

	mux #(.data_size(32)) mux_inst_alu_src( 
		.i_control(mux_alu_src_ctrl),
        .i_data_0(wire_32_8),
        .i_data_1(wire_32_2),
        .o_data(wire_32_0)
	);

	mux #(.data_size(32)) mux_inst_mem_to_reg( 
		.i_control(mux_mem_to_reg_ctrl),
        .i_data_0(wire_32_3),
        .i_data_1(wire_32_4),
        .o_data(wire_32_1)
	);
	
	mux #(.data_size(30)) mux_inst_pc_src( 
		.i_control(wire_1_0),
        .i_data_0(wire_30_0),
        .i_data_1(wire_30_2),
        .o_data(wire_30_1)
	);

	extender extender_inst(
		.i_control(ext_op),
        .i_data(wire_32_6[15:0]),
        .o_data(wire_32_2)
	);

	next_pc next_pc_inst(
		.i_zero(zero),
        .i_j(j),
        .i_beq(beq),
        .i_bne(bne),
        .i_incr_pc(wire_30_0),
        .i_imm26(wire_32_6[25:0]),
        .o_mux_pc_src(wire_1_0),
        .o_pc30(wire_30_2)
	);

endmodule 