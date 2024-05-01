module bigger_smaller_fraction (
	input logic sign_A, sign_B,
	input logic [3:0] Fract_A, Fract_B, 
	input logic [2:0] Exp_A, Exp_B, 
	output logic [2:0] Final_exp, Bigger_exp, Smaller_exp,
	output logic [3:0] Bigger_fract, Smaller_fract,
	output logic [3:0] Exp_diff,
	output logic [4:0] Fract_diff,
	output logic choose, bigger_sign, smaller_sign
);

//logic [3:0] Exp_diff;
//logic [4:0] Fract_diff;
wire decoderExpdiff_out;

Exp_diff expdiff1 (.Exp_A(Exp_A), .Exp_B(Exp_B), .Exp_diff(Exp_diff), .Final_exp(Final_exp), .Bigger_exp(Bigger_exp), .Smaller_exp(Smaller_exp));
Fract_diff fractdiff1 (.Fract_A(Fract_A), .Fract_B(Fract_B), .Fract_diff(Fract_diff));

mux16to1 muxexpdiff (.sel(Exp_diff), .I0(Fract_diff[4]), .I1(Exp_diff[3]), .out(decoderExpdiff_out));
mux2to1 expfractdiff1 (.sel(decoderExpdiff_out), .I0(Fract_B), .I1(Fract_A), .out(Smaller_fract));
mux2to1 expfractdiff2 (.sel(decoderExpdiff_out), .I0(Fract_A), .I1(Fract_B), .out(Bigger_fract));

always @(*) begin
	if (Bigger_fract == Fract_A & Bigger_exp == Exp_A) begin
		choose = 1'b0;
		bigger_sign = sign_A;
		smaller_sign = sign_B;
	end else if (Smaller_fract == Fract_A & Smaller_exp == Exp_A) begin
		choose = 1'b1;
		bigger_sign = sign_B;
		smaller_sign = sign_A;
	end 
end

endmodule