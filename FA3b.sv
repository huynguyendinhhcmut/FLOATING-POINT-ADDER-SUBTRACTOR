module FA3b (
	input logic [2:0] a,
	input logic [2:0] b,
	input logic cin,
	output logic [2:0] sum,
	output logic cout
);

logic [2:0] carry;

FA fa1 (.sum(sum[0]), .a(a[0]), .b(b[0]^cin), .cin(cin), .cout(carry[0])); 		
FA fa2 (.sum(sum[1]), .a(a[1]), .b(b[1]^cin), .cin(carry[0]), .cout(carry[1]));	
FA fa3 (.sum(sum[2]), .a(a[2]), .b(b[2]^cin), .cin(carry[1]), .cout(carry[2])); 	

xor (cout, carry[2], cin);

endmodule