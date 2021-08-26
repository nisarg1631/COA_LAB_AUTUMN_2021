`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
/*
    Assignment Number: 1
    Problem Number: 1 Ripple Carry Adder
    Semester Number: 5
    Group Number: 1 
    Group Members: Animesh Jha(19CS10010), Nisarg Upadhyaya (19CS30031)
*/
////////////////////////////////////////////////////////////////////////////////

module RippleCarryAdder_16bitTestbench;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg c_in;

	// Outputs
	wire [15:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	RippleCarryAdder_16bit uut (
		.in1(in1), 
		.in2(in2), 
		.c_in(c_in), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
		$monitor ("in1 = %d, in2 = %d, c_in = %d, sum = %d, c_out = %d", in1, in2, c_in, sum, c_out);
		// Initialize Inputs
		in1 = 16'd3245; in2 = 16'd16785; c_in = 0;
		#100;
		in1 = 16'd3245; in2 = 16'd16785; c_in = 1;
		#100;
		in1 = 16'd25000; in2 = 16'd40535; c_in = 0;
		#100;
		in1 = 16'd25001; in2 = 16'd40535; c_in = 0;
		#100;
		in1 = 16'd25001; in2 = 16'd40535; c_in = 1;
	end
      
endmodule

