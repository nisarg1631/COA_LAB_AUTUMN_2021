`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: ALU Control
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module alu_control_tb;

	// Inputs
	reg [2:0] alu_op;
	reg [5:0] func_code;

	// Outputs
	wire [3:0] alu_control_signal;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.alu_op(alu_op), 
		.func_code(func_code), 
		.alu_control_signal(alu_control_signal)
	);

	initial begin
		// Initialize Inputs
		alu_op = 0;
		func_code = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		alu_op = 3'b001;
		func_code = 5'd0;
		#10;

		alu_op = 3'b001;
		func_code = 5'd1;
		#10;

		alu_op = 3'b010;
		func_code = 5'd0;
		#10;

		alu_op = 3'b010;
		func_code = 5'd1;
		#10;

		alu_op = 3'b011;
		func_code = 5'd0;
		#10;

		func_code = 5'd1;
		#10;

		func_code = 5'd2;
		#10;

		func_code = 5'd3;
		#10;

		func_code = 5'd4;
		#10;

		func_code = 5'd5;
		#10;

		alu_op = 3'b101;
		#10;

		func_code = 5'd1;
		#10;

		alu_op = 3'b110;
		#10;

		func_code = 5'd2;
		#10;

		alu_op = 3'b000;
		#10;

		func_code = 5'd3;
		#10;

	end
      
endmodule

