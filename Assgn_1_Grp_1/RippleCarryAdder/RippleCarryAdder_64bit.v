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

module RippleCarryAdder_64bit(
    input [63:0] in1,
    input [63:0] in2,
    input c_in,
    output [63:0] sum,
    output c_out
    );

	 wire carry;
	 //cascaded 2 32bit RCAs using carry wire
    RippleCarryAdder_32bit rca1(in1[31:0], in2[31:0], c_in, sum[31:0], carry);
    RippleCarryAdder_32bit rca2(in1[63:32], in2[63:32], carry, sum[63:32], c_out);

endmodule
