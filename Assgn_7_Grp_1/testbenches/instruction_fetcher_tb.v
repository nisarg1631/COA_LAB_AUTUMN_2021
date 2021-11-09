`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Instruction Fetch
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module instruction_fetcher_tb;

	// Inputs
	reg clk, rst;
	
	reg [31:0] pc_next;

	// Outputs
	wire [31:0] pc;
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	instruction_fetcher uut (
		.pc(pc_next), 
		.clk(clk), 
		.instr(instr)
	);

	// Instantiate other supporting modules
	program_counter uut2 (
		.pc_in(pc_next),
		.pc_out(pc),
		.clk(clk),
		.rst(rst)
	);

	always #2 clk = ~clk;
	
	always @(*) begin
		pc_next <= pc + 32'd1;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		rst = 0;
		// Add stimulus here

	end
      
endmodule

