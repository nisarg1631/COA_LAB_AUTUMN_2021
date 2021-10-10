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
// Used old code
module HalfAdder(
    input in1,
    input in2,
    output sum,
    output c_out
    );

	// Inputs:          Outputs:
	// in1 = 0, in2 = 0     sum = 0, c_out = 0
	// in1 = 0, in2 = 1     sum = 1, c_out = 0
	// in1 = 1, in2 = 0     sum = 1, c_out = 0
	// in1 = 1, in2 = 1     sum = 0, c_out = 1
	assign sum = in1 ^ in2;
	assign c_out = in1 & in2;

endmodule
