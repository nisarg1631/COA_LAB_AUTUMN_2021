`timescale 1ns / 1ps

    // COA LAB TEST 2
    // Problem Number: 1
    // Semester Number: 5
    // Name: Nisarg Upadhyaya (19CS30031)

module sign_mag_seq_mult(
    input clk,
    input start,
    input [5:0] a,
    input [5:0] b,
    output done,
    output [11:0] product
    );
	
    reg load;
	reg [5:0] A, B;
	wire [2:0] cnt;
	
	always @(posedge clk) begin
        if(start) begin // load A and B and set load signal for multiplier module to 1
            A <= a;
            B <= b;
            load <= 1'b1;
        end else begin
            load <= 1'b0;        
		end
    end

    // initialise counter module
    counter COUNTER(
		.clk(clk),
		.start(start),
		.done(done),
		.cnt(cnt)
	);

    // initialise multiplier module
    seq_mult_base SEQMULT(
        .clk(clk),
        .done(done),
        .load(load),
        .A(A),
        .B(B),
        .P(product)
    );


endmodule
