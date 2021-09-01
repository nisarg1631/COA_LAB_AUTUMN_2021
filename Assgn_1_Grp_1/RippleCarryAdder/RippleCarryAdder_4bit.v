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

module RippleCarryAdder_4bit(
    input [3:0] in1,
    input [3:0] in2,
    input c_in,
    output [3:0] sum,
    output c_out
    );

	wire [2:0] carry;
	// cascade 4 FullAdders using carry wire
	FullAdder fa1(in1[0], in2[0], c_in, sum[0], carry[0]);
   FullAdder fa2(in1[1], in2[1], carry[0], sum[1], carry[1]);
   FullAdder fa3(in1[2], in2[2], carry[1], sum[2], carry[2]);
   FullAdder fa4(in1[3], in2[3], carry[2], sum[3], c_out);

endmodule
