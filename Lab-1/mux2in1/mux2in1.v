module mux2in1(
    i_dat0,
    i_dat1,
    i_control,
    o_dat
    );

    parameter WIDTH = 32;

    input   [WIDTH-1:0]   i_dat0, i_dat1;
    input                 i_control;
    output  reg [WIDTH-1:0]   o_dat;

    always @(i_control, i_dat0, i_dat1) begin
        if(i_control) begin
            o_dat = i_dat1;
        end else begin
            o_dat = i_dat0;
        end
    end


endmodule
