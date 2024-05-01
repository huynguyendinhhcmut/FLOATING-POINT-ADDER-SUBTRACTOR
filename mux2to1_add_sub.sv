module mux2to1_add_sub (
	input logic I0, I1,
	input logic [1:0] sel,
	output logic out
);

always @(*) begin
	unique case (sel)
		2'b00:out = I1;
		2'b01:out = I1;
		2'b10:out = I0;
		2'b11:out = I0;
	endcase
end

endmodule