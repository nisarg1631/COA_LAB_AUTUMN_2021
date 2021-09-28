`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 2 [Two’s Complement Converter FSM]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg in=0;
	reg clk=1;
	reg reset=0;

	// Outputs
	wire out;
	always #40 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	two_complement_converter_fsm uut (
		.out(out), 
		.in(in), 
		.clk(clk), 
		.reset(reset)
	);
	initial begin
		
		reset = 1; 
		#40 reset = 0; 
		#40
		$monitor($time,"\t in = %b \t out = %b", in, out);
		#80 in = 0;
		#80 in = 0;
		#80 in = 0;
		#80 in = 1;
		#80 in = 0;
		#80 in = 1;
		#80 in = 1;
		#80 in = 1;
		#80 in = 0;
		#80 in = 1;
		#80 in = 0;
		#80 in = 0;
		#80 $finish; 

	end
      
endmodule

