`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 1 [Linear Feedback Shift Register (LFSR)]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg[3:0] seed=4'b1111;
	reg clk=1;
	reg reset=0;
	reg select=0;

	// Outputs
	wire[3:0] out;
	always #10 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	linear_feedback_shift_register uut(
		.sel(select),
		.seed(seed),
		.clk(clk),
		.reset(reset),
		.w(out)
	);
	initial begin

      $monitor("out = %b %b %b %b",out[0],out[1],out[2],out[3]);
		reset = 1; 
		#10 reset = 0; 
		select=1;
		#10 select = 0; 
		
	end
      
endmodule
