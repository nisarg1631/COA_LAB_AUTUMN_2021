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
	
	// Outputs
	wire [31:0] retReg;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.clk(clk), 
		.rst(rst),
		.retReg(retReg)
	);
	
	always #2 clk = ~clk;
	
	initial begin
	
		/*$monitor("reg0 = %d\t, reg1 = %d\t, reg2 = %d\t, reg3 = %d\t, reg4 = %d\t, reg5 = %d\t, reg6 = %d\t, reg11 = %d\t, reg12 = %d\t", 
			$signed(uut.RF.registers[0]), 
			$signed(uut.RF.registers[1]), 
			$signed(uut.RF.registers[2]), 
			$signed(uut.RF.registers[3]), 
			$signed(uut.RF.registers[4]),
			$signed(uut.RF.registers[5]),
			$signed(uut.RF.registers[6]), 
			$signed(uut.RF.registers[11]), 
			$signed(uut.RF.registers[12])
			);*/
			
			$monitor("Return value: ", $signed(retReg));
		
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here
		rst = 0;

	end
      
endmodule

