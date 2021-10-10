`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 6
// Problem Number: 2 [Bit Serial Adder]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////


module BitSerialAdder(
    input a_in,
    input b_in,
    input clock,
    input reset,
    output sum,
    output wire c_out
);
    wire c_in_real;   // output of the DFF
    dff FlipFlop(.rst(reset),.clk(clock),.d(c_out),.q(c_in_real));  // DFF to store prev carry
    FullAdder fa(
        .in1(a_in),
        .in2(b_in),
        .c_in(c_in_real),
        .sum(sum),
        .c_out(c_out)
    );      //Full adder
    
endmodule