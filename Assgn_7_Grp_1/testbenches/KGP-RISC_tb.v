`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Top Module
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module KGP_RISC_tb;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.clk(clk), 
		.rst(rst)
	);
	
	always #2 clk = ~clk;
	
	initial begin
	
		$monitor ("reg0 = %d, reg1 = %d, reg2 = %d, reg3 = %d, reg4 = %d, reg5 = %d, reg6 = %d", 
			$signed(uut.RF.registers[0]), 
			$signed(uut.RF.registers[1]), 
			$signed(uut.RF.registers[2]), 
			$signed(uut.RF.registers[3]), 
			$signed(uut.RF.registers[4]), 
			$signed(uut.RF.registers[5]), 
			$signed(uut.RF.registers[6])
			);
		
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;

	end
      
endmodule

