`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Main Control
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module main_control_tb;

	// Inputs
	reg [5:0] opcode;

	// Outputs
	wire [2:0] alu_op;
	wire alu_source;
	wire [1:0] write_reg;
	wire mem_write;
	wire mem_read;
	wire [1:0] mem_reg_pc;
	wire [1:0] branch;

	// Instantiate the Unit Under Test (UUT)
	main_control uut (
		.opcode(opcode), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.mem_reg_pc(mem_reg_pc), 
		.alu_op(alu_op), 
		.alu_source(alu_source), 
		.write_reg(write_reg)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		opcode = 6'b000001;
		#10;
		opcode = 6'b000010;
		#10;
		opcode = 6'b000011;
		#10;
		opcode = 6'b000100;
		#10;
		opcode = 6'b000101;
		#10;
		opcode = 6'b000110;
		#10;
		opcode = 6'b111100;
		#10;
		opcode = 6'b111101;
		#10;
		opcode = 6'b111110;
		#10;
		opcode = 6'b111111;
		#10;

	end
      
endmodule

