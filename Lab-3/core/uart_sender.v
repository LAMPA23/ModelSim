module uart_sender(
    i_clk,  //  4800 1/s
    i_start,
    i_data, 
    o_read_addres,
    o_data
);
    input i_clk;
    input i_start;
    input [31:0] i_data;

    output reg o_data = 1;
    output reg [31:0] o_read_addres = 0;

    reg data_is_sent; // 1 - if double word is sent 
    reg state_is_work = 0;
    reg [39:0] uart_message;

    integer i;

    always @(posedge i_clk) begin
        if(i_start==1 & state_is_work==0) begin
            data_is_sent = 1;
            state_is_work = 1;
        end
        if(state_is_work) begin
            if(data_is_sent) begin
                uart_message = { 1'b1, i_data[7:0], 1'b0, 1'b1, i_data[15:8], 1'b0, 1'b1, i_data[23:16], 1'b0, 1'b1, i_data[31:24], 1'b0 };
                o_read_addres = o_read_addres + 1; 
                data_is_sent = 0;
                i = 0;
            end else begin
                o_data = uart_message[i];
                i = i + 1;
                if (i==39) data_is_sent = 1;
            end
        end
        if(o_read_addres==256) state_is_work = 0;      
    end

endmodule