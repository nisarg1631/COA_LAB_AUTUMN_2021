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
	wire sum,c_out;
    wire [7:0] final_sum;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
    shift_register psr1(.clk(clk), .reset(reset), .inp(decimal_num_1), .out(a));
    shift_register psr2(.clk(clk), .reset(reset), .inp(decimal_num_2), .out(b));
	BitSerialAdder uut(.a_in(a), .b_in(b), .sum(sum), .c_out(c_out),.clock(clk),.reset(reset));
    shift_in_register sir(.in(sum),.rst(reset),.out(final_sum),.clk(clk));
	initial begin
		$monitor($time,"\t, A_IN = %b \t B_IN = %b \tC_IN_REAL = %b\t Sum_out = %b\t in = %b\tFinal Sum = %b ",a,b,uut.c_in_real,sum,sir.in,final_sum);
		
		$display("TC1:\tTest A = 123 and B = 32\n");
		decimal_num_1 = 8'd123; 
		decimal_num_2 = 8'd32;
		reset = 1'b1;
		#16 reset = 1'b0;
		#72; //9 clock cycles
		$display("TC1: Final Sum = %d",final_sum);

		$display("TC2:\tTest A = 32 and B = 123\n");
		decimal_num_1 = 8'd32; 
		decimal_num_2 = 8'd123;
		reset = 1'b1;
		#16 reset = 1'b0;
		#72; //9 clock cycles
		$display("TC2: Final Sum = %d",final_sum);


		$display("TC3:\tTest A = 3 and B = 12\n");
		decimal_num_1 = 8'd3; 
		decimal_num_2 = 8'd12;
		reset = 1'b1;
		#16 reset = 1'b0;
		#72; //9 clock cycles
		$display("TC3: Final Sum = %d",final_sum);

		$display("TC4:\tTest A = 16 and B = 6\n");
		decimal_num_1 = 8'd16; 
		decimal_num_2 = 8'd6;
		reset = 1'b1;
		#16 reset = 1'b0;
		#72; //9 clock cycles
		$display("TC4: Final Sum = %d",final_sum);
		
    end
      
endmodule