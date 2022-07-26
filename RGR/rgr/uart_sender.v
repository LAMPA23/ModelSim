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

    output reg o_data;
    output reg [31:0] o_read_addres;

    reg data_is_sent; // 1 - if double word is sent 
    reg [39:0] uart_message;

    integer i;

    always @(posedge i_start) begin
        o_read_addres = 0;
        data_is_sent = 1;
    end

    always @(posedge i_clk) begin
        if(i_start) begin
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
    end

endmodule