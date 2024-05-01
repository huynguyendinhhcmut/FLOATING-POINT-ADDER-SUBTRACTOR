module mux2to1real (
	input logic sel, I0, I1,
	output logic out
);

always @(*) begin
	unique case (sel)
		1'b0:out = I0;
		1'b1:out = I1;
	endcase
end

endmodule