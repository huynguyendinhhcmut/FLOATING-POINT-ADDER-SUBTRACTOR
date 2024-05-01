module totalBS (
	input logic cin, A, B, choose,
	output logic sign_result, 
	input logic [7:0] total1, total2, 
	output logic [7:0] total
);

logic [2:0] sel;
assign sel = {cin, A, B};

always @(*) begin
	unique case (sel)
		3'b000: begin
					sign_result = 1'b0;
					total = total1;
				  end
		3'b001: begin
					sign_result = (1'b0 ^ choose);
					total = total2;
				  end
		3'b010: begin
					sign_result = (1'b1 ^ choose);
					total = total2;
				  end
		3'b011: begin
					sign_result = 1'b1;
					total = total1;
				  end
		3'b100: begin
					sign_result = (1'b0 ^ choose);
					total = total2;
				  end
		3'b101: begin
					sign_result = 1'b0;
					total = total1;
				  end
		3'b110: begin
					sign_result = 1'b1;
					total = total1;
				  end
		3'b111: begin
					sign_result = (1'b1 ^ choose);
					total = total2;
				  end
endcase
end

endmodule
				  