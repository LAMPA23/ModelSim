module aluControl(i_aluOp i_func o_aluControl);
 
localparam [3:0] 
AND = 0, 
OR  = 1, 
ADD = 2, 
SUB = 3, 
SLT = 4, 
NOR = 5,
LW  = 6,
SW  = 7; 

input       [5:0]   i_aluOp;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;
  
always@* begin 
	case (i_aluOp)
	// R-type
		6'h0: begin	
			case (i_func)
				6'h20: o_aluControl = ADD;
				6'h22: o_aluControl = SUB;
				6'h24: o_aluControl = AND;
				6'h25: o_aluControl = OR;
				6'h27: o_aluControl = NOR;
				6'h2a: o_aluControl = SLT;
				default: o_aluControl = 4'bxxxx;
			 endcase
		end
	// I-type
		6'h1: 	6'h20: o_aluControl = 4'bxxxx;//BLTZ BGEZ
		6'h2: 	6'h20: o_aluControl = 4'bxxxx;
		6'h3: 	6'h20: o_aluControl = 4'bxxxx;
		6'h4: 	6'h20: o_aluControl = 4'bxxxx;//BEQ
		6'h5: 	6'h20: o_aluControl = 4'bxxxx;//BNE
		6'h6: 	6'h20: o_aluControl = 4'bxxxx;//BLEZ
		6'h7: 	6'h20: o_aluControl = 4'bxxxx;//BGTZ
		end
	// Load and store
		6'b10: begin	
			case (i_func)
				6'h23: o_aluControl = LW;
				6'h2b: o_aluControl = SW;
				default: o_aluControl = 4'bxxxx;
			 endcase
		end
		default: o_aluControl = 4'bxxxx;
	endcase

end

endmodule

/*
	R-type (funct[5:0])
SLL  = 6'h0
XXXX = 6'h1
SRL  = 6'h2
SRA  = 6'h3
SLLV = 6'h4
XXXX = 6'h5 
SRLV = 6'h6 
SRAV = 6'h7
XXXX = 6'h8
XXXX = 6'h9
XXXX = 6'h10
XXXX = 6'h11
XXXX = 6'h12
XXXX = 6'h13
XXXX = 6'h14
XXXX = 6'h15
XXXX = 6'h16
XXXX = 6'h17
XXXX = 6'h18
XXXX = 6'h19
ADD  = 6'h20
ADDU = 6'h21
SUB  = 6'h22
SUBU = 6'h23
AND  = 6'h24 
OR   = 6'h25 
XOR  = 6'h26 
NOR  = 6'h27
XXXX = 6'h28
XXXX = 6'h29
SLT  = 6'h2a
SLTU = 6'h2b

	I-type (Op[5:0])

ADDI   	= 6'h8
ADDDIU 	= 6'h9
XXXX 	= 6'hA
XXXX	= 6'hB
ANDI	= 6'hC
ORI 	= 6'hD
XORI 	= 6'hE
LUI 	= 6'hF


LB  = 6'h20
LH  = 6'h21
-   = 6'h22
LW  = 6'h23
LBU = 6'h24 
LHU = 6'h25 
-   = 6'h26 
-   = 6'h27
SB  = 6'h28
SH  = 6'h29
-   = 6'h2a
SW  = 6'h2b;


*/