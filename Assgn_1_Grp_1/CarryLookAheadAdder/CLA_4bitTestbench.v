`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:23:57 08/21/2021
// Design Name:   CLA_4bit
// Module Name:   /home/nisarg/MyFiles/Sem5/COA_LAB/testproj/ass1/ass1/CLA_4bitTestbench.v
// Project Name:  ass1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_4bitTestbench;

	// Inputs
	reg [3:0] in1;
	reg [3:0] in2;
	reg c_in;

	// Outputs
	wire [3:0] sum;
	wire [4:1] carry;

	// Instantiate the Unit Under Test (UUT)
	CLA_4bit uut (
		.in1(in1), 
		.in2(in2), 
		.c_in(c_in), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		in1 = 4'b0100; in2 = 4'b0100; c_in = 0;
		#100;
		in1 = 4'd0100; in2 = 4'b0100; c_in = 0;
        
		$monitor ("in1 = %d, in2 = %d, c_in = %d, sum = %d, c_out = %d", in1, in2, c_in, sum, carry[4]);

	end
      
endmodule

