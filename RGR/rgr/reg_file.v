module reg_file(
        i_clk, 
        i_raddr1, 
        i_raddr2, 
        i_waddr, 
        i_wdata, 
        i_we, // from main_control->o_regWrite
        o_rdata1,
        o_rdata2 
    );
                
    input           i_clk, i_we;
    input   [4:0]   i_raddr1, i_raddr2, i_waddr;
    input   [31:0]  i_wdata;           
    output reg [31:0]  o_rdata1, o_rdata2;

    reg [31:0] Registers [31:0];
    integer i;

    initial begin
        Registers[0] = 0;
        for(i=1; i<=31; i=i+1) begin
            Registers[i] = $random % 8 + 8;
        end
    end

    always @(posedge i_clk) if(i_we && (i_waddr != 0)) Registers[i_waddr]=i_wdata;

    always @(*) begin
        o_rdata1 = Registers[i_raddr1];
        o_rdata2 = Registers[i_raddr2];
    end
 
endmodule