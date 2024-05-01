module Zero (
	input logic sign_A, sign_B,
	input logic [3:0] exp_diff,
	input logic [4:0] fract_diff,
	output logic zero
);
always @(*) begin
	if ((sign_A != sign_B) && (exp_diff == 4'b0000) && (fract_diff == 5'b00000)) begin
		zero = 1'b1;
	end else
		zero = 1'b0;
end
endmodule