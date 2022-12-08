module extender(
        i_control,
        i_data,
        o_data
    );

    input i_control;
    input [15:0] i_data;
    output [31:0] o_data;

    assign o_data = (i_control) ? { (i_data[15]) ? 16'b_1111_1111_1111_1111 : 16'b0, i_data} : {16'b0, i_data};

endmodule

// i_control = 0 - unsigned 
// i_control = 1 - signed 