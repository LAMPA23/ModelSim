module uart_mem(
        i_addres_read,
		i_addres_write, 
        i_write_en,	// enable write from reg to ram
		i_data,
        o_start,
		o_data
	);

    input i_write_en;
    input [31:0] i_addres_read;
	input [31:0] i_addres_write;
    input [31:0] i_data;
   
    output o_start;
    output reg [31:0] o_data;

    reg [31:0] mem [255:0];

    initial $readmemh("uart_mem_init.dat", mem);

    assign o_start = ~|mem[255];

	always@(*) begin
		o_data = mem[i_addres_read];
	end  

	always@(*) begin
		if(i_write_en) mem[i_addres_write - 32] = i_data;
	end


endmodule