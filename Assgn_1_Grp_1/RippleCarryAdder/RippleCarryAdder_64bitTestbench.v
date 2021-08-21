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

module RippleCarryAdder_64bitTestbench;

	// Inputs
	reg [63:0] in1;
	reg [63:0] in2;
	reg c_in;

	// Outputs
	wire [63:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	RippleCarryAdder_64bit uut (
		.in1(in1), 
		.in2(in2), 
		.c_in(c_in), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
				// Initialize Inputs
		in1 = 64'd12345678912345; in2 = 64'd98765432198765; c_in = 0;
		#100;
		in1 = 64'd12345678912345; in2 = 64'd98765432198765; c_in = 1;
		#100;
		in1 = -64'd12345678912345; in2 = 64'd98765432198765; c_in = 0;
        
		$monitor ("in1 = %d, in2 = %d, c_in = %d, sum = %d, c_out = %d", in1, in2, c_in, sum, c_out);

	end
      
endmodule

