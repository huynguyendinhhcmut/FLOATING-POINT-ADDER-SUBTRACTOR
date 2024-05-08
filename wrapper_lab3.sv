/*module wrapper_lab3 (
	input logic CLOCK_50,
	input logic [8:0] SW,
	input logic [3:0] KEY,
	output logic [9:0] LEDR
);

normalized normalized (
	.Cin(SW[8]), .clk50M(CLOCK_50), .rst(KEY[0]), 
	.en_A(KEY[1]), .en_B(KEY[2]), .en_cin(KEY[3]), 
	.sign(SW[7]), .Exp(SW[6:4]), .Fract(SW[3:0]), 
	.Result_fract(LEDR[3:0]), .Result_exp(LEDR[6:4]), .result_sign(LEDR[7])
);

endmodule*/
