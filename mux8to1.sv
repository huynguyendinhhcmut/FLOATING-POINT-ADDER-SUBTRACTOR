module mux8to1 (
	input logic I0, I1, I2, I3, I4, I5, I6, I7,
	input logic [3:0] sel,
	output logic out
);

always @(*) begin
	unique case (sel)
		4'b0000:out = I0;
		4'b0001:out = I1;
		4'b0010:out = I2;
		4'b0011:out = I3;
		4'b0100:out = I4;
		4'b0101:out = I5;
		4'b0110:out = I6;
		4'b0111:out = I7;
		
		4'b1000:out = I0;
		4'b1001:out = I7;
		4'b1010:out = I6;
		4'b1011:out = I5;
		4'b1100:out = I4;
		4'b1101:out = I3;
		4'b1110:out = I2;
		4'b1111:out = I1;
	endcase
end

endmodule