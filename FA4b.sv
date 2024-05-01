module FA4b (
	input logic [3:0] a,
	input logic [3:0] b,
	input logic cin,
	output logic [3:0] sum,
	output logic cout
);

logic [3:0] carry;

FA fa1 (.sum(sum[0]), .a(a[0]), .b(b[0]^cin), .cin(cin), .cout(carry[0])); 		
FA fa2 (.sum(sum[1]), .a(a[1]), .b(b[1]^cin), .cin(carry[0]), .cout(carry[1]));	
FA fa3 (.sum(sum[2]), .a(a[2]), .b(b[2]^cin), .cin(carry[1]), .cout(carry[2]));	
FA fa4 (.sum(sum[3]), .a(a[3]), .b(b[3]^cin), .cin(carry[2]), .cout(carry[3]));	

xor (cout, carry[3], cin);

endmodule