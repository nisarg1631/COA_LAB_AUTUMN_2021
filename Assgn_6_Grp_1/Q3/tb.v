`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 6
// Problem Number: 3 [Booth Multiplier]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_bsa;
    // Inputs
	reg signed [7:0] num1, num2;
	reg clk = 1'b1;
	reg reset = 1'b0;
    reg load = 1'b0;

	// Outputs
	wire signed [15:0] out;
	always #4 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	booth_mult uut (
		.multiplier(num1),
        .multiplicand(num2),
        .clk(clk),
        .reset(reset),
        .load(load),
        .result(out)
	);
	initial begin
		$monitor($time,"\t num1 = %d, num2 = %d \t product = %d", num1, num2, out);

		$display("TC 1\n");
		reset = 1'b1;
        num1 = 8'b01010101;
        num2 = 8'b00000101;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
		#64

        $display("TC 2\n");
		reset = 1'b1;
        num1 = 8'b11010101;
        num2 = 8'b00000101;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 3\n");
		reset = 1'b1;
        num1 = 8'b11010101;
        num2 = 8'b10010101;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 4_a\n");
		reset = 1'b1;
        num1 = 8'b01010111;
        num2 = 8'b10010101;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 4_b\n");
		reset = 1'b1;
        num2 = 8'b01010111;
        num1 = 8'b10010101;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 5\n");
		reset = 1'b1;
        num1 = 8'b00000000;
        num2 = 8'b10010101;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 6\n");
		reset = 1'b1;
        num1 = 8'b10010101;
        num2 = 8'b00000000;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 7\n");
		reset = 1'b1;
        num1 = 8'b10000001;
        num2 = 8'b01111111;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 8\n");
		reset = 1'b1;
        num1 = 8'b01111111;
        num2 = 8'b01111111;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 9\n");
		reset = 1'b1;
        num1 = 8'b00000001;
        num2 = 8'b11111111;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $display("TC 10\n");
		reset = 1'b1;
        num1 = 8'b11111111;
        num2 = 8'b11111111;
		#8 
        reset = 1'b0;	
        load = 1'b1;
        #8
        load = 1'b0;
        #64

        $finish;
	end

endmodule
