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
	reg opt=1'b0;
	reg[31:0] decimal_num_1 = -1*32'd1;
    reg[31:0] decimal_num_2 = 32'd123;
	wire a,b,L,E,G;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
    linear_shift_register psr1(.clk(clk), .reset(reset), .inp(decimal_num_1), .out(a));
    linear_shift_register psr2(.clk(clk), .reset(reset), .inp(decimal_num_2), .out(b));
	sequential_unsigned_comparator uut(.a(a),.b(b),.L(L),.E(E),.G(G),.clk(clk),.rst(reset),.op(opt));
	initial begin
		reset = 1'b1;
		#4 reset = 1'b0;
		#264 opt=1'b1; // 33 clockcycles lsb has been read by now
	end
	always #8 $monitor($time,"\t a = %b, \t b = %b \t L= %b,\t E= %b\t G= %b ", a, b, L, E, G);
      
endmodule
