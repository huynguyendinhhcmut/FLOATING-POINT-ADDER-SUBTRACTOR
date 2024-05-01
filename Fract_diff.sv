module Fract_diff (
	input logic [3:0] Fract_A, Fract_B,
	output logic [4:0] Fract_diff
);

FA4b fa4b1 ( .a(Fract_A), .b(Fract_B), .cin(1'b1), .sum(Fract_diff[3:0]), .cout(Fract_diff[4]));

endmodule