module sl2(i_data, o_data);
    parameter WIDTH = 32;
    input   [WIDTH-1:0]   i_data;
    output reg [WIDTH-1:0]   o_data;

    always @(i_data) begin
        o_data <= {i_data[WIDTH-3:0], 2'b0};
    end

endmodule
