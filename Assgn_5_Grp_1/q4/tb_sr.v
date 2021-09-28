`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 3 [Multiple-of-three Detector FSM]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_sr;

	// Inputs
	reg clk = 1'b1;
	reg reset = 1'b0;
	reg[31:0] decimal_num_1 = 32'd456;
    reg[31:0] decimal_num_2 = 32'd123;
	wire a,b;
	always #40 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
    linear_shift_register psr1(.clk(clk), .reset(reset), .inp(decimal_num_1), .out(a));
    linear_shift_register psr2(.clk(clk), .reset(reset), .inp(decimal_num_2), .out(b));
	initial begin

		reset = 1'b1;
		#40 reset = 1'b0;

	end
	always #80 $monitor($time,"\t a = %b, \t b = %b", a, b);
      
endmodule
