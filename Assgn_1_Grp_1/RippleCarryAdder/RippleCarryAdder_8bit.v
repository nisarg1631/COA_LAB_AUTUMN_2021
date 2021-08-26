`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
/*
    Assignment Number: 1
    Problem Number: 1 Ripple Carry Adder
    Semester Number: 5
    Group Number: 1 
    Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
*/
//////////////////////////////////////////////////////////////////////////////////

module RippleCarryAdder_8bit(
    input [7:0] in1,
    input [7:0] in2,
    input c_in,
    output [7:0] sum,
    output c_out
    );

	wire [6:0] carry; // carry wire bus for internal carries
	
	// cascade 8 FullAdders using carry wire
	FullAdder fa1(in1[0], in2[0], c_in, sum[0], carry[0]);
   FullAdder fa2(in1[1], in2[1], carry[0], sum[1], carry[1]);
   FullAdder fa3(in1[2], in2[2], carry[1], sum[2], carry[2]);
   FullAdder fa4(in1[3], in2[3], carry[2], sum[3], carry[3]);
   FullAdder fa5(in1[4], in2[4], carry[3], sum[4], carry[4]);
   FullAdder fa6(in1[5], in2[5], carry[4], sum[5], carry[5]);
   FullAdder fa7(in1[6], in2[6], carry[5], sum[6], carry[6]);
   FullAdder fa8(in1[7], in2[7], carry[6], sum[7], c_out);
	
endmodule
