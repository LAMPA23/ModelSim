module uart_receiver(
    i_clk,
    i_rst,
    i_data,
    o_data
);

    input i_clk;
    input i_rst;
    input i_data;
    output reg [7:0] o_data;
    
    reg [9:0] data; 

    reg start;

    integer i;

    always @(i_rst) begin
        start = 0;
        i = 0;
    end

    always @(negedge i_data) begin
        start = 1;
    end

    always @(posedge i_clk) begin
        if (start && (i != 10)) begin
            data = {data[8:0], i_data}; 
            i =  i + 1;
        end 
        if (start && (i == 10)) begin
            o_data[0] = data[8];
            o_data[1] = data[7];
            o_data[2] = data[6];
            o_data[3] = data[5];
            o_data[4] = data[4];
            o_data[5] = data[3];
            o_data[6] = data[2];
            o_data[7] = data[1];
            i = 0;
        end
    end

endmodule