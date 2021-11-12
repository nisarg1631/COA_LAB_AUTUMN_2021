`timescale 1ns / 1ps

	// COA LAB TEST 2
    // Problem Number: 1
    // Semester Number: 5
    // Name: Nisarg Upadhyaya (19CS30031)

module testbench;

	// Inputs
	reg clk;
	reg start;
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire done;
	wire [11:0] product;

	// Instantiate the Unit Under Test (UUT)
	sign_mag_seq_mult uut (
		.clk(clk), 
		.start(start), 
		.a(a), 
		.b(b), 
		.done(done), 
		.product(product)
	);
	
	always #2 clk = ~clk;

	initial begin
		clk = 0;
		
		start = 1;
		a = 63;
		b = 63;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 4;
		b = 5;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 0;
		b = 0;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 32;
		b = 32;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 1;
		b = 22;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 22;
		b = 1;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 0;
		b = 16;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 16;
		b = 0;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);

		start = 1;
		a = 17;
		b = 3;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);

		start = 1;
		a = 16;
		b = 22;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
		
		start = 1;
		a = 1;
		b = 1;
		#4;
        start = 0;
		#40 $display("a = %d, b = %d, product = %d", a, b, product);
	end
      
endmodule

