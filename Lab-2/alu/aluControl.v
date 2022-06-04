module aluControl(i_aluOp, i_func, o_aluControl);
 
localparam [3:0] 
AND = 0, 
OR  = 1, 
ADD = 2, 
SUB = 3, 
SLT = 4, 
NOR = 5,
LW  = 6,
SW  = 7; 

input       [1:0]   i_aluOp;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;
  
always@* begin 
	case (i_aluOp)
		2'b00: begin	// R-type
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
		2'b01: begin	// I-type
			case (i_func)
				6'h20: o_aluControl = 4'bxxxx;
				default: o_aluControl = 4'bxxxx;
			 endcase
		end
		2'b10: begin	// Load and store
			case (i_func)
				6'h23: o_aluControl = LW;
				6'h2b: o_aluControl = SW;
				default: o_aluControl = 4'bxxxx;
			 endcase
		end
	endcase

end

endmodule

/*
	R-type
ADD  = 6'h20,
ADDU = 6'h21,
SUB  = 6'h22,
SUBU = 6'h23,
AND  = 6'h24, 
OR   = 6'h25, 
XOR  = 6'h26, 
NOR  = 6'h27,
-    = 6'h28,
-    = 6'h29,
SLT  = 6'h2a,
SLTU = 6'h2b;

	I-type
LB  = 6'h20,
LH  = 6'h21,
-   = 6'h22,
LW  = 6'h23,
LBU = 6'h24, 
LHU = 6'h25, 
-   = 6'h26, 
-   = 6'h27,
SB  = 6'h28,
SH  = 6'h29,
-   = 6'h2a,
SW  = 6'h2b;


*/


