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

module RippleCarryAdder_16bit(
    input [15:0] in1,
    input [15:0] in2,
    input c_in,
    output [15:0] sum,
    output c_out
    );
	 
	 wire carry;
	 //cascaded 2 8bit RCAs using carry wire
    RippleCarryAdder_8bit rca1(in1[7:0], in2[7:0], c_in, sum[7:0], carry);
    RippleCarryAdder_8bit rca2(in1[15:8], in2[15:8], carry, sum[15:8], c_out);


endmodule
