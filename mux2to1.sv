module mux2to1 (
	input logic [3:0] I0, I1,
	input logic [0:0] sel,
	output logic [3:0] out
);

always @(*) begin
	unique case (sel)
		1'b0:out = I0;
		1'b1:out = I1;
	endcase
end

endmodule