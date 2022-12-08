module pc_adder(
        i_data,
        o_data
    );
    
    input [29:0] i_data;
    output [29:0] o_data;

    assign o_data = i_data + 1;  

endmodule