module mux2to1real8b (
	input logic sel, result_signBS, result_signSB,
	output logic out_sign
);

always @(*) begin
	unique case (sel)
		1'b0: begin
				out_sign = result_signBS;
				end
		1'b1: begin
				out_sign = result_signSB;
				end
	endcase
end

endmodule