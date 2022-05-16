module regFile(i_clk, 
               i_raddr1, 
               i_raddr2, 
               i_waddr, 
               i_wdata, 
               i_we,
               o_rdata1,
               o_rdata2 
               );
               
input           i_clk, i_we;
input   [4:0]   i_raddr1, i_raddr2, i_waddr;
input   [31:0]  i_wdata;           
output reg [31:0]  o_rdata1, o_rdata2;

reg [31:0] Registers [15:0];
integer i;

initial begin
	for(i=0; i<32; i=i+1) begin
		Registers[i]=$random;
	end
end

always @(posedge i_clk) if(i_we && (i_waddr != 0)) Registers[i_waddr]=i_wdata;

always @(negedge i_clk) begin
	o_rdata1 = Registers[i_raddr1];
	o_rdata2 = Registers[i_raddr2];
end

  
endmodule