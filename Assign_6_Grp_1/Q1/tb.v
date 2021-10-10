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
    reg [7:0] in=8'b00000000;
    reg [2:0] shamt=3'b000;
    reg dir=1'b1;
    wire [7:0] out;

    Bidirectional_Barrel_Shifter uut(.in(in),.shamt(shamt),.dir(dir),.out(out));    

    initial begin
        $monitor($time,"\t in = %b, shamt = %d \t dir = %b \toutput = %b", in,shamt,dir, out);

		$display("TC 1\n");
        #4;
        in=8'b11110011;
        shamt=3'b001;
        dir=1'b1;
        #8;

        $display("TC 2\n");
        #4;
        in=8'b11110011;
        shamt=3'b001;
        dir=1'b0;
        #8;

        $display("TC 3\n");
        #4;
        in=8'b11110011;
        shamt=3'b101;
        dir=1'b1;
        #8;

        $display("TC 4\n");
        #4;
        in=8'b11110011;
        shamt=3'b101;
        dir=1'b0;
        #8;

        $display("TC 5\n");
        #4;
        in=8'b10010111;
        shamt=3'b001;
        dir=1'b1;
        #8;

        $display("TC 6\n");
        #4;
        in=8'b10010111;
        shamt=3'b001;
        dir=1'b0;
        #8;

        $display("TC 7\n");
        #4;
        in=8'b10010111;
        shamt=3'b101;
        dir=1'b1;
        #8;

        $display("TC 8\n");
        #4;
        in=8'b10010111;
        shamt=3'b101;
        dir=1'b0;
        #8;
    end
endmodule