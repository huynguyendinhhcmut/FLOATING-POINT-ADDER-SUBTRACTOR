module normalized (
	input logic cin, sign_A, sign_B, en_A, en_B, en_cin, clk50M, rst,
	input logic [2:0] Exp_A, Exp_B,
	input logic [3:0] Fract_A, Fract_B,
	output logic [3:0] Result_fract, smallerfract, expdiff, fractright, fractleft,
	output logic [2:0] Result_exp, 
	output logic addsubexp, choose, result_sign, bigger_sign, smaller_sign, overflow, zero,
	output logic [7:0] total, total1, total2,
	output logic [6:0] totalshiftedfract, totalbiggerfract,
	output logic [2:0] shift_counter,
	output logic [3:0] Exp_diff,
	output logic [4:0] Fract_diff
);

//logic [3:0] expdiff;
//logic [6:0] totalshiftedfract;
//logic [7:0] total;

//logic [3:0] smallerfract; 
//logic [6:0] totalbiggerfract;

/*logic sign_A, sign_B, cin;
logic [2:0] Exp_A, Exp_B;
logic [3:0] Fract_A, Fract_B;*/

/*D_FF dff0 (.clk50M(clk50M), .rst(rst), .enable(en_cin), .data_i(Cin), .data_o(cin));

D_FF dff1 (.clk50M(clk50M), .rst(rst), .enable(en_A), .data_i(sign), .data_o(sign_A));
D_FF dff2 (.clk50M(clk50M), .rst(rst), .enable(en_B), .data_i(sign), .data_o(sign_B));

D_FF3b dff3b1 (.clk50M(clk50M), .rst(rst), .enable(en_A), .data_i(Exp), .data_o(Exp_A));
D_FF3b dff3b2 (.clk50M(clk50M), .rst(rst), .enable(en_B), .data_i(Exp), .data_o(Exp_B));

D_FF4b dff4b1 (.clk50M(clk50M), .rst(rst), .enable(en_A), .data_i(Fract), .data_o(Fract_A));
D_FF4b dff4b2 (.clk50M(clk50M), .rst(rst), .enable(en_B), .data_i(Fract), .data_o(Fract_B));*/

assign totalbiggerfract [6] = 1'b1;
assign totalbiggerfract [1:0] = 2'b00;

bigger_smaller_fraction bsf1 (.Exp_A(Exp_A), .Exp_B(Exp_B), .Fract_A(Fract_A), .Fract_B(Fract_B), .Bigger_fract(totalbiggerfract[5:2]), .Smaller_fract(smallerfract), .Exp_diff(Exp_diff), .Fract_diff(Fract_diff), .choose(choose), .sign_A(sign_A), .sign_B(sign_B), .bigger_sign(bigger_sign), .smaller_sign(smaller_sign));

Exp_diff ExpDiff (.Exp_A(Exp_A), .Exp_B(Exp_B), .Exp_diff(expdiff));

mux8to1 mux82(.sel(expdiff), .I0(1'b1), .I1(1'b0), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .out(totalshiftedfract[6]));
mux8to1 mux83(.sel(expdiff), .I0(smallerfract[3]), .I1(1'b1), .I2(1'b0), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .out(totalshiftedfract[5]));
mux8to1 mux84(.sel(expdiff), .I0(smallerfract[2]), .I1(smallerfract[3]), .I2(1'b1), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .out(totalshiftedfract[4]));
mux8to1 mux85(.sel(expdiff), .I0(smallerfract[1]), .I1(smallerfract[2]), .I2(smallerfract[3]), .I3(1'b1), .I4(1'b0), .I5(1'b0), .I6(1'b0), .I7(1'b0), .out(totalshiftedfract[3]));
mux8to1 mux86(.sel(expdiff), .I0(smallerfract[0]), .I1(smallerfract[1]), .I2(smallerfract[2]), .I3(smallerfract[3]), .I4(1'b1), .I5(1'b0), .I6(1'b0), .I7(1'b0), .out(totalshiftedfract[2]));
mux8to1 mux87(.sel(expdiff), .I0(1'b0), .I1(smallerfract[0]), .I2(smallerfract[1]), .I3(smallerfract[2]), .I4(smallerfract[3]), .I5(1'b1), .I6(1'b0), .I7(1'b0), .out(totalshiftedfract[1]));
mux8to1 mux88(.sel(expdiff), .I0(1'b0), .I1(1'b0), .I2(smallerfract[0]), .I3(smallerfract[1]), .I4(smallerfract[2]), .I5(smallerfract[3]), .I6(1'b1), .I7(1'b0), .out(totalshiftedfract[0]));

FA7b fa7b5 (.a(totalbiggerfract), .b(totalshiftedfract), .cin(1'b0), .sum(total1[6:0]), .cout(total1[7]));				
FA7b fa7b6 (.a(totalbiggerfract), .b(totalshiftedfract), .cin(1'b1), .sum(total2[6:0]), .cout(total2[7]));

totalBS (.cin(cin), .A(sign_A), .B(sign_B), .choose(choose), .total1(total1), .total2(total2), .total(total), .sign_result(result_sign));

encoder encoder1 (.i(total), .y(shift_counter));

mux2to1_add_sub mux21 (.I0(1'b0), .I1(1'b1), .sel(total[7:6]), .out(addsubexp));

logic [2:0] biggerexp0;
Exp_diff expdiff187 (.Exp_A(Exp_A), .Exp_B(Exp_B), .Final_exp(biggerexp0));

logic [3:0] resultexp;
FA3b fa3b1 (.a(biggerexp0), .b(shift_counter), .cin(addsubexp), .sum(resultexp[2:0]), .cout(resultexp[3]));
assign Result_exp [2:0] = resultexp [2:0];

mux_resultfract muxresultfract1 (.enable(~total[7]), .sel(shift_counter), .I0(total[5]), .I1(total[4]), .I2(total[3]), .I3(total[2]), .I4(total[1]), .I5(total[0]), .I6(1'b0), .out(fractright[3]));
mux_resultfract muxresultfract2 (.enable(~total[7]), .sel(shift_counter), .I0(total[4]), .I1(total[3]), .I2(total[2]), .I3(total[1]), .I4(total[0]), .I5(1'b0), .I6(1'b0), .out(fractright[2]));
mux_resultfract muxresultfract3 (.enable(~total[7]), .sel(shift_counter), .I0(total[3]), .I1(total[2]), .I2(total[1]), .I3(total[0]), .I4(1'b0), .I5(1'b0), .I6(1'b0), .out(fractright[1]));
mux_resultfract muxresultfract4 (.enable(~total[7]), .sel(shift_counter), .I0(total[2]), .I1(total[1]), .I2(total[0]), .I3(1'b0), .I4(1'b0), .I5(1'b0), .I6(1'b0), .out(fractright[0]));

mux_resultfract muxresultfract5 (.enable(total[7]), .sel(shift_counter), .I1(total[6]), .out(fractleft[3]));
mux_resultfract muxresultfract6 (.enable(total[7]), .sel(shift_counter), .I1(total[5]), .out(fractleft[2]));
mux_resultfract muxresultfract7 (.enable(total[7]), .sel(shift_counter), .I1(total[4]), .out(fractleft[1]));
mux_resultfract muxresultfract8 (.enable(total[7]), .sel(shift_counter), .I1(total[3]), .out(fractleft[0]));

mux2to1real muxprestige1 (.sel(total[7]), .I0(fractright[3]), .I1(fractleft[3]), .out(Result_fract[3]));
mux2to1real muxprestige2 (.sel(total[7]), .I0(fractright[2]), .I1(fractleft[2]), .out(Result_fract[2]));
mux2to1real muxprestige3 (.sel(total[7]), .I0(fractright[1]), .I1(fractleft[1]), .out(Result_fract[1]));
mux2to1real muxprestige4 (.sel(total[7]), .I0(fractright[0]), .I1(fractleft[0]), .out(Result_fract[0]));

Overflow Overflow1 (.Result_exp(Result_exp), .overflow(overflow));
Zero zero1 (.sign_A(sign_A), .sign_B(sign_B), .exp_diff(Exp_diff), .fract_diff(Fract_diff), .zero(zero));

endmodule