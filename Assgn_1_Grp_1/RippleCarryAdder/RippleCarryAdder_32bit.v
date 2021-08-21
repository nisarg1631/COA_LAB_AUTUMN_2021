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

module RippleCarryAdder_32bit(
    input [31:0] in1,
    input [31:0] in2,
    input c_in,
    output [31:0] sum,
    output c_out
    );

	 wire carry;
	 //cascaded 2 16bit RCAs using carry wire
    RippleCarryAdder_16bit rca1(in1[15:0], in2[15:0], c_in, sum[15:0], carry);
    RippleCarryAdder_16bit rca2(in1[31:16], in2[31:16], carry, sum[31:16], c_out);

endmodule
