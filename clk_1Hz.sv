/*module clk_1Hz (
	input logic clk50M,
	output logic clk
);

integer t = 0;
reg f = 1'b0;

always_ff @(posedge clk50M) 
begin : conversion
	t <= t+1;
	if (t == 25000000) begin
		f <= !f;
		t <= 0;
	end
	clk <= f;
end
endmodule*/