`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
/*
    Assignment Number: 1
    Problem Number: 1 Ripple Carry Adder
    Semester Number: 5
    Group Number: 1 
    Group Members: Animesh Jha(19CS10010), Nisarg Upadhyaya (19CS30031)
*/
//////////////////////////////////////////////////////////////////////////////////

module CLA_4bit(
    input [3:0] in1,
    input [3:0] in2,
    input c_in,
    output [3:0] sum,
    output [4:1] carry
    );

/*
	Logic:
	
	G[i] = in1[i] & in2[i], 0 <= i <= 3
	P[i] = in1[i] ^ in2[i], 0 <= i <= 3
	
	Take c_in to be carry[0] then
	sum[i] = P[i] ^ carry[i], 0 <= i <= 3
	carry[i] = G[i-1] | (P[i] & carry[i]), 1 <= i <= 4 
	
	Recursively expanding we get
	carry[1] = G[0] | (P[0] & carry[0]) = G[0] | (P[0] & c_in)
	carry[2] = G[1] | (P[1] & carry[1]) = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in)
	carry[3] = G[2] | (P[2] & carry[2]) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
	carry[4] = G[3] | (P[3] & carry[3]) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in)
*/
	
	genvar i;
	wire [3:0] G, P;
	
	generate 
	for(i=0; i<4; i=i+1) begin
		assign G[i] = in1[i] & in2[i];
		assign P[i] = in1[i] ^ in2[i];
	end
	endgenerate
	
	assign carry[1] = G[0] | (P[0] & c_in);
	assign carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in);
	assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);
	assign carry[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in);
	
	assign sum[0] = P[0] ^ c_in;
	
	generate
	for(i=1; i<4; i=i+1) begin
		assign sum[i] = P[i] ^ carry[i];
	end
	endgenerate

endmodule
