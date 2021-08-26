`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
/*
	Assignment Number: 1
	Problem Number: 1 Ripple Carry Adder
	Semester Number: 5
	Group Number: 1 
	Group Members: Animesh Jha(19CS10070), Nisarg Upadhyaya (19CS30031)
*/
////////////////////////////////////////////////////////////////////////////////

module HalfAdderTestbench;

	// Inputs
	reg in1;
	reg in2;

	// Outputs
	wire sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	HalfAdder uut (
		.in1(in1), 
		.in2(in2), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
		$monitor ("in1 = %d, in2 = %d, sum = %d, c_out = %d", in1, in2, sum, c_out);
		in1 = 0; in2 = 0;
		#100;
		in1 = 0; in2 = 1;
		#100;
		in1 = 1; in2 = 0;
		#100;
		in1 = 1; in2 = 1;
	end
      
endmodule

