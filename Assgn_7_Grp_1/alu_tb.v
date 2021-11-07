`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: ALU
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg signed [31:0] input1;
	reg signed [31:0] input2;
	reg [4:0] shamt;
	reg [3:0] control;

	// Outputs
	wire signed [31:0] out;
	wire [2:0] flags;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.input1(input1), 
		.input2(input2), 
		.shamt(shamt), 
		.control(control), 
		.out(out), 
		.flags(flags)
	);

	initial begin
		$monitor ("in1 = %d, in2 = %d, out = %d, carry = %b, zero = %b, negative = %b, control = %b", input1, input2, out, flags[2], flags[0], flags[1], control);
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		shamt = 0;
		control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		input1 = 32'd105;
		input2 = 32'd106;
		control = 4'b0000;
		#10;
		
		input1 = 32'd105;
		input2 = 32'd106;
		control = 4'b0000;
		#10;
		
		input1 = 32'd2147483647;
		input2 = 32'd106;
		control = 4'b0000;
		#10;
		
		input1 = 32'd2147483648;
		input2 = 32'd2147483648;
		control = 4'b0000;
		#10;
		
		input1 = 32'd111;
		input2 = 32'd106;
		control = 4'b0001;
		#10;
		
		input1 = 32'd1234;
		input2 = 32'd896989867;
		control = 4'b0001;
		#10;
		
		input1 = 32'd0;
		input2 = -32'd896989867;
		control = 4'b0001;
		#10;
		
		input1 = 32'd1234;
		input2 = 32'd0;
		control = 4'b0001;
		#10;
		
		input1 = 32'd111;
		input2 = 32'd106;
		control = 4'b0010;
		#10;
		
		input1 = 32'd259;
		input2 = 32'd106;
		control = 4'b0011;
		#10;
		
		input1 = 32'd259;
		input2 = 32'd106;
		control = 4'b0100;
		shamt = 0;
		#10;
		
		input1 = 32'd259;
		input2 = 32'd106;
		control = 4'b0100;
		shamt = 5'd4;
		#10;
		
		input1 = -32'd259;
		input2 = 32'd8;
		control = 4'b1100;
		shamt = 5'd4;
		#10;
		
		input1 = -32'd259;
		input2 = 32'd31;
		control = 4'b1100;
		shamt = 5'd4;
		#10;
		
		input1 = 32'd119;
		input2 = 32'd106;
		control = 4'b0101;
		shamt = 0;
		#10;
		
		input1 = 32'd119;
		input2 = 32'd106;
		control = 4'b0101;
		shamt = 5'd4;
		#10;
		
		input1 = -32'd119;
		input2 = 32'd3;
		control = 4'b1101;
		shamt = 5'd4;
		#10;
		
		input1 = 32'd119;
		input2 = 32'd106;
		control = 4'b1101;
		shamt = 5'd4;
		#10
		
		input1 = 32'd119;
		input2 = 32'd106;
		control = 4'b0110;
		shamt = 0;
		#10;
		
		input1 = 32'd119;
		input2 = 32'd106;
		control = 4'b0110;
		shamt = 5'd4;
		#10;
		
		input1 = 32'd119;
		input2 = 32'd3;
		control = 4'b1110;
		shamt = 5'd4;
		#10;
		
		input1 = 32'd119;
		input2 = 32'd106;
		control = 4'b1110;
		shamt = 5'd4;
		#10
		
		input1 = -32'd119;
		input2 = 32'd106;
		control = 4'b0110;
		shamt = 0;
		#10;
		
		input1 = -32'd119;
		input2 = 32'd106;
		control = 4'b0110;
		shamt = 5'd4;
		#10;
		
		input1 = -32'd119;
		input2 = 32'd3;
		control = 4'b1110;
		shamt = 5'd4;
		#10;
		
		input1 = -32'd119;
		input2 = 32'd106;
		control = 4'b1110;
		shamt = 5'd4;
		#10;
		
		input1 = -32'd22;
		input2 = 32'd0;
		control = 4'b0111;
		#10;
		
		input1 = 32'd0;
		input2 = -32'd106;
		control = 4'b0111;
		#10;
	end
      
endmodule

