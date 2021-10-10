`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 6
// Problem Number: 2 [Bit Serial Adder]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_bsa;

	// Inputs
	reg clk = 1'b1;
	reg reset = 1'b0;
	reg[7:0] decimal_num_1,  decimal_num_2;
	wire sum,c_out
    wire [7:0] final_sum=7'b0;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
    shift_register psr1(.clk(clk), .reset(reset), .inp(decimal_num_1), .out(a));
    shift_register psr2(.clk(clk), .reset(reset), .inp(decimal_num_2), .out(b));
	BitSerialAdder uut(.a_in(a), .b_in(b), .sum(sum), .c_out(c_out),.clock(clk),.reset(rst));
    shift_in_register sir(.in(sum),.out(final_sum),.clk(clk));
	initial begin
    reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
    
    end
      
endmodule