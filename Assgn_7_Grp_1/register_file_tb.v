`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Register File
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module register_file_tb;

	// Inputs
	reg [4:0] reg1Addr;
	reg [4:0] reg2Addr;
	reg writeEnable;
	reg [31:0] writeData;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] reg1Out;
	wire [31:0] reg2Out;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.reg1Addr(reg1Addr), 
		.reg2Addr(reg2Addr), 
		.writeEnable(writeEnable), 
		.writeData(writeData), 
		.reg1Out(reg1Out), 
		.reg2Out(reg2Out), 
		.clk(clk), 
		.rst(rst)
	);

	always #2 clk = ~clk;

	initial begin
		// Initialize Inputs
		reg1Addr = 0;
		reg2Addr = 0;
		writeEnable = 0;
		writeData = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		rst = 0;

		// Add stimulus here
		reg1Addr = 5'd1;
		reg2Addr = 5'd2;
		writeEnable = 1'b1;
		writeData = 32'd16;

		#4;

		reg1Addr = 5'd2;
		reg2Addr = 5'd1;
		writeData = 32'd22;

		#4;

		reg1Addr = 5'd1;
		reg2Addr = 5'd2;
		writeEnable = 1'b0;

		#4;

		reg1Addr = 5'd3;
		writeEnable = 1'b1;
		writeData = 32'd10;

		#4;

		writeEnable = 1'b0;
		writeData = 32'd9;
		reg2Addr = 5'd1;

	end
      
endmodule
