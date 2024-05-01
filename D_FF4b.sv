module D_FF4b
#(parameter WIDTH=4) // fill number of bits 
(
	input logic clk50M, rst, enable,
	input logic [WIDTH-1:0] data_i,
	output logic [WIDTH-1:0] data_o
);

/*logic clk;
clk_1Hz clk1hz ( .clk50M(clk50M), .clk(clk));*/

reg [WIDTH-1:0] data;
always_ff@ (posedge clk50M or negedge rst) 
	if (!rst) begin
		data <= 0;
	end else 
	if (!enable) begin
		data <= data_i;
	end else begin
		data <= data;
	end
assign data_o=data;
endmodule 