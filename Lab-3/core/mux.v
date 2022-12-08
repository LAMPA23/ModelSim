module mux(
        i_control,
        i_data_0,
        i_data_1,
        o_data
    );

    parameter data_size = 32;

    input i_control;
    input [data_size-1:0] i_data_0, i_data_1;
    output reg [data_size-1:0] o_data;

    always @* begin
        if(i_control) o_data = i_data_1;
        else o_data = i_data_0;
    end

endmodule