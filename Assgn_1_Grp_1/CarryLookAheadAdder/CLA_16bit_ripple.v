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

module CLA_16bit_ripple(
    input [15:0] in1,
    input [15:0] in2,
    input c_in,
    output [15:0] sum,
    output [16:1] carry
    );

	// 16 bit adder by cascading 4 4bit CLAs and ripple the carry
	CLA_4bit cla1(.in1(in1[3:0]), .in2(in2[3:0]), .c_in(c_in), .sum(sum[3:0]), .carry(carry[4:1]));
	CLA_4bit cla2(.in1(in1[7:4]), .in2(in2[7:4]), .c_in(carry[4]), .sum(sum[7:4]), .carry(carry[8:5]));
	CLA_4bit cla3(.in1(in1[11:8]), .in2(in2[11:8]), .c_in(carry[8]), .sum(sum[11:8]), .carry(carry[12:9]));
	CLA_4bit cla4(.in1(in1[15:12]), .in2(in2[15:12]), .c_in(carry[12]), .sum(sum[15:12]), .carry(carry[16:13]));

endmodule
