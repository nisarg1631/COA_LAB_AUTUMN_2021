`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
/*
    Assignment Number: 1
    Problem Number: 2 Carry Look-ahead Adder
    Semester Number: 5
    Group Number: 1 
    Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
*/
////////////////////////////////////////////////////////////////////////////////

module CLA_4bit_augmentedTestbench;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg c_in;

	// Outputs
	wire [3:0] sum;
	wire p;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	CLA_4bit_augmented uut (
		.in1(in1), 
		.in2(in2), 
		.c_in(c_in), 
		.sum(sum), 
		.p(p), 
		.g(g)
	);

	initial begin
		$monitor ("in1 = %d, in2 = %d, c_in = %d, sum = %d, p = %d, g = %d", in1, in2, c_in, sum, p, g);
		// Initialize Inputs
		in1 = 4'b0100; in2 = 4'b0100; c_in = 0;
		#100;
		in1 = 4'd0100; in2 = 4'b1100; c_in = 0;
		#100;
		in1 = 4'd1000; in2 = 4'b0111; c_in = 1;
		#100;
		in1 = 4'b0011; in2 = 4'b0010; c_in = 1;
		#100;
		in1 = 4'b0001; in2 = 4'b0000; c_in = 1;
	end
      
endmodule
