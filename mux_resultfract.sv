module mux_resultfract (
	input logic enable, I0, I1, I2, I3, I4, I5, I6,
	input logic [2:0] sel,
	output logic out
);

always @(*) begin
	if (enable) begin
	unique case (sel)
		3'b000:out = I0;
		3'b001:out = I1;
		3'b010:out = I2;
		3'b011:out = I3;
		3'b100:out = I4;
		3'b101:out = I5;
		3'b110:out = I6;
	endcase
	end else out = 1'b0;
end

endmodule