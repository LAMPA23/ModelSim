module alu_control(
		i_aluOp, 
		i_func, 
		o_aluControl
	);

	localparam [5:0] 
	AND = 0, 
	OR  = 1, 
	ADD = 2, 
	SUB = 3, 
	SLT = 4, 
	NOR = 5,
    XOR = 6;

	input       [5:0]   i_aluOp, i_func;
	output  reg [5:0]   o_aluControl;
	
	always@* begin 
		case (i_aluOp)
		// R-type
			0: begin	
				case (i_func)
					32: o_aluControl = ADD;
					34: o_aluControl = SUB;
					36: o_aluControl = AND;
					37: o_aluControl = OR;
                    38: o_aluControl = XOR;
					39: o_aluControl = NOR;
					42: o_aluControl = SLT;
					default: o_aluControl = 6'bx;
				endcase
			end
		// I-type
			2: begin    //  jump  
                o_aluControl = ADD;
            end
            4: begin    //  beq
                o_aluControl = SUB;
            end
            5: begin    //  bnq
                o_aluControl = SUB;
            end
            8: begin    //  addi
                o_aluControl = ADD;
            end
            9: begin    //  addiu
                o_aluControl = ADD;
            end
            10: begin   //  slti
                o_aluControl = SLT;
            end
            12: begin   //  andi
                o_aluControl = AND;
            end
            13: begin   //  ori
                o_aluControl = OR;
                end
            14: begin   //  xori
                o_aluControl = XOR;
            end
            35: begin   //  lw
                o_aluControl = ADD;
            end
            43: begin   //  sw
                o_aluControl = ADD;
            end
			default: o_aluControl = 6'bx;
		endcase
	end

endmodule