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
	reg in = 1'b0;
	reg clk = 1'b1;
	reg reset = 1'b0;

	// Outputs
	wire out;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	two_complement_converter_fsm uut (
		.out(out), 
		.in(in), 
		.clk(clk), 
		.reset(reset)
	);
	initial begin
	
		$display("TC 1\n");
		reset = 1'b1; in = 1'b0;
		#4 reset = 1'b0; 
		#4		
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b1;
		#8 in = 1'b0;
		#8 in = 1'b1;
		#8 in = 1'b1;
		#8 in = 1'b1;
		#8 in = 1'b0;
		#8 in = 1'b1;
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b0;
		
		#8
		$display("TC 2\n");
		reset = 1'b1; in = 1'b0;
		#4 reset = 1'b0; 
		#4
		#8 in = 1'b1;
		#8 in = 1'b1;
		#8 in = 1'b1;
		#8 in = 1'b1;
		#8 in = 1'b1;
		
		#8
		$display("TC 3\n");
		reset = 1'b1; in = 1'b0;
		#4 reset = 1'b0; 
		#4
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b0;
		
		#8
		$display("TC 4\n");
		reset = 1'b1; in = 1'b0;
		#4 reset = 1'b0; 
		#4
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b0;
		#8 in = 1'b1;
		#8 in = 1'b0;
		
		#8 $finish; 

	end
   	always #8 $monitor($time,"\t in = %b \t out = %b", in, out);
	
endmodule

