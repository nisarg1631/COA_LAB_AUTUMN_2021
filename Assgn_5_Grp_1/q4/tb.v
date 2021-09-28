`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 3 [Multiple-of-three Detector FSM]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_suc;

	// Inputs
	reg clk = 1'b1;
	reg reset = 1'b0;
	reg opt=1'b0;
	reg[31:0] decimal_num_1,  decimal_num_2;
	wire a,b,L,E,G;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
    shift_register psr1(.clk(clk), .reset(reset), .inp(decimal_num_1), .out(a));
    shift_register psr2(.clk(clk), .reset(reset), .inp(decimal_num_2), .out(b));
	sequential_unsigned_comparator uut(.a(a),.b(b),.L(L),.E(E),.G(G),.clk(clk),.rst(reset),.op(opt));
	initial begin
	
		$monitor($time,"\t L= %b,\t E= %b\t G= %b ", L, E, G);
		
		$display("Test A = 1234 and B = 1234\n");
		decimal_num_1 = 32'd1234; decimal_num_2 = 32'd1234;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now
		
		#8
		$display("Test A = 123456789 and B = 123\n");
		decimal_num_1 = 32'd123456789; decimal_num_2 = 32'd123;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now

		#8
		$display("Test A = 9 and B = 99\n");
		decimal_num_1 = 32'd9; decimal_num_2 = 32'd99;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now

		#8
		$display("Test A = 255 and B = 255\n");
		decimal_num_1 = 32'd255; decimal_num_2 = 32'd255;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now
		
		#8
		$display("Test A = 16161615 and B = 16161616\n");
		decimal_num_1 = 32'd16161615; decimal_num_2 = 32'd16161616;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now

		#8
		$display("Test A = 15 and B = 14\n");
		decimal_num_1 = 32'd15; decimal_num_2 = 32'd14;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now

		#8
		$display("Test A = 0 and B = 0\n");
		decimal_num_1 = 32'd0; decimal_num_2 = 32'd0;
		reset = 1'b1; opt = 1'b0;
		#8 reset = 1'b0;
		#264 opt = 1'b1; // 33 clockcycles lsb has been read by now

		#8 $finish;
	end
      
endmodule
