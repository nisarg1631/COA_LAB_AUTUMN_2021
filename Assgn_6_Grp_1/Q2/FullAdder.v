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
module FullAdder(
    input in1,
    input in2,
    input c_in,
    output sum,
    output c_out
    );
	 
    // Inputs:                   Outputs:
    // in1 = 0, in2 = 0, c_in = 0     sum = 0, c_out = 0
    // in1 = 0, in2 = 0, c_in = 1     sum = 1, c_out = 0
    // in1 = 0, in2 = 1, c_in = 0     sum = 1, c_out = 0
    // in1 = 0, in2 = 1, c_in = 1     sum = 0, c_out = 1
    // in1 = 1, in2 = 0, c_in = 0     sum = 1, c_out = 0
    // in1 = 1, in2 = 0, c_in = 1     sum = 0, c_out = 1
    // in1 = 1, in2 = 1, c_in = 0     sum = 0, c_out = 1
    // in1 = 1, in2 = 1, c_in = 1     sum = 1, c_out = 1
    
	 // implement full adder using two half adders
	 
    wire carry1,carry2,temp_sum;
    
	HalfAdder ha1(in1, in2, temp_sum, carry1); // temp_sum = in1 ^ in2, carry1 = in1 & in2
    HalfAdder ha2(temp_sum, c_in, sum, carry2); // sum = temp_sum ^ c_in = in1 ^ in2 ^ c_in, carry2 = temp_sum & c_in = (in1 ^ in2) & c_in
    or gate1(c_out, carry1, carry2); // c_out = carry1 | carry2 = (in1 & in2) | ((in1 ^ in2) & c_in)


endmodule
