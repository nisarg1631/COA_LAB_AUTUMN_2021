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
        #4;
        in=8'b11110011;
        shamt=3'b001;

    end
endmodule