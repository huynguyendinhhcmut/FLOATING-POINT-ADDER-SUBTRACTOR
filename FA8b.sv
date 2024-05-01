module FA8b (
	input logic [7:0] a,
	input logic [7:0] b,
	input logic cin,
	output logic [7:0] sum,
	output logic cout
);

logic [7:0] carry;

FA fa1 (.sum(sum[0]), .a(a[0]), .b(b[0]^cin), .cin(cin), .cout(carry[0])); 		
FA fa2 (.sum(sum[1]), .a(a[1]), .b(b[1]^cin), .cin(carry[0]), .cout(carry[1]));	
FA fa3 (.sum(sum[2]), .a(a[2]), .b(b[2]^cin), .cin(carry[1]), .cout(carry[2]));	
FA fa4 (.sum(sum[3]), .a(a[3]), .b(b[3]^cin), .cin(carry[2]), .cout(carry[3]));	
FA fa5 (.sum(sum[4]), .a(a[4]), .b(b[4]^cin), .cin(carry[3]), .cout(carry[4]));	
FA fa6 (.sum(sum[5]), .a(a[5]), .b(b[5]^cin), .cin(carry[4]), .cout(carry[5]));
FA fa7 (.sum(sum[6]), .a(a[6]), .b(b[6]^cin), .cin(carry[5]), .cout(carry[6]));	
FA fa8 (.sum(sum[7]), .a(a[7]), .b(b[7]^cin), .cin(carry[6]), .cout(carry[7]));	

xor (cout, carry[7], cin);

endmodule