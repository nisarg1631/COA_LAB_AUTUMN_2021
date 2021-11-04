`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
/*
    Assignment Number: 1
    Problem Number: 2 Carry Look-ahead Adder
    Semester Number: 5
    Group Number: 1 
    Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
*/
//////////////////////////////////////////////////////////////////////////////////

module CLA_4bit_augmented(
    input [3:0] in1,
    input [3:0] in2,
    input c_in,
    output [3:0] sum,
    output p,
    output g
    );
	 
/*
	Logic:
	
	G[i] = in1[i] & in2[i], 0 <= i <= 3
	P[i] = in1[i] ^ in2[i], 0 <= i <= 3
	
	Take c_in to be carry[0] then
	sum[i] = P[i] ^ carry[i], 0 <= i <= 3
	carry[i] = G[i-1] | (P[i-1] & carry[i-1]), 1 <= i <= 3
	
	Recursively expanding we get
	carry[1] = G[0] | (P[0] & carry[0]) = G[0] | (P[0] & c_in)
	carry[2] = G[1] | (P[1] & carry[1]) = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in)
	carry[3] = G[2] | (P[2] & carry[2]) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
	
	Also block propogate p and generate g are calculated as
	p = P[3] & P[2] & P[1] & P[0]
	g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0])
*/

	wire [3:0] G, P, carry; // wires for bitwise generate, propagate and carries
	
	// calculate bitwise generate and propagate
	assign G = in1 & in2;
	assign P = in1 ^ in2;
	
	// calculate subsequent carries using generates and propagates
	assign carry[0] = c_in;
	assign carry[1] = G[0] | (P[0] & carry[0]);
	assign carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & carry[0]);
	assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & carry[0]);
	
	// calculate final sum using propagate and carries
	assign sum = P ^ carry;
	
	// calculate block propagate and generate for next level
	assign p = P[3] & P[2] & P[1] & P[0];
	assign g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);


endmodule
