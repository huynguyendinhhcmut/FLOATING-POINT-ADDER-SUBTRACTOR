module encoder(
	input logic [7:0] i,
	output logic [2:0] y
);

assign y[0] = (~i[6] & ~i[4] & ~i[2] & i[1]) | (~i[6] & ~i[4] & i[3]) | (~i[6] & i[5]) | (i[7]);
assign y[1] = (~i[7] & ~i[6] & ~i[5] & ~i[2] & ~i[1] & i[0]) | (~i[7] & ~i[6] & ~i[5] & i[3]) | (~i[7] & ~i[6] & ~i[5] & i[4]);
assign y[2] = (~i[7] & ~i[6] & ~i[5] & ~i[4] & ~i[3] & i[0]) | (~i[7] & ~i[6] & ~i[5] & ~i[4] & ~i[3] & i[1]) | (~i[7] & ~i[6] & ~i[5] & ~i[4] & ~i[3] & i[2]);

endmodule