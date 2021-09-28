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
	reg in = 1'b0;
	reg clk = 1'b1;
	reg reset = 1'b0;
	reg[31:0] decimal_num = 32'd0;
	// Outputs
	wire out;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	multiple_of_three_detector_fsm uut(
		.in(in),
		.out(out),
		.clk(clk),
		.reset(reset)
	);
	
	initial begin

		reset = 1'b1; in = 1'b0;
		#4 reset = 1'b0;
		#4
		#8 in = 1'b1; decimal_num = 32'd1;
		#8 in = 1'b0; decimal_num = 32'd2;
		#8 in = 1'b0; decimal_num = 32'd4;
		#8 in = 1'b1; decimal_num = 32'd9;
		#8 in = 1'b0; decimal_num = 32'd18;
		#8 in = 1'b1; decimal_num = 32'd37;
		#8 in = 1'b0; decimal_num = 32'd74;
		#8 in = 1'b1; decimal_num = 32'd149;
		#8 in = 1'b0; decimal_num = 32'd298;
		#8 in = 1'b1; decimal_num = 32'd597;
		#8 $finish; 

	end
	always #8 $monitor($time,"\t new input bit = %b, \t number read till now = %d, \t divisibility by 3 = %b", in, decimal_num, out);
      
endmodule
