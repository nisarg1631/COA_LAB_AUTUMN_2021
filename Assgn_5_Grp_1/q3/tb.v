`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 3 [Multiple-of-three Detector FSM]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg in;
	reg clk=1;
	reg reset=0;
	// Outputs
	wire out;
	always #40 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	multiple_of_three_detector_fsm uut(
		.in(in),
		.out(out),
		.clk(clk),
		.reset(reset)
	);
	initial begin
	// Initialize Inputs
    $monitor($time,"\t in = %b \t out = %b", in, out);
	reset=1;
	#40 reset=0;
	#40 in = 0;
   	#80 in = 1;
   	#80 in = 1;
   	#80 in = 0;
   	#80 in = 1;
   	#80 in = 1;
   	#80 in = 0;
   	#80 in = 1; 
   	#80 $finish; 
	end
      
endmodule

