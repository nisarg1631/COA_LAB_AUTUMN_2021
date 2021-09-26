
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 1 [Linear Feedback Shift Register (LFSR)]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module mux(
    input x,   // input to the mux
    input y,   // input to the mux
    input select,   // select input to the mux
    output out // output of the mux
);
    assign out = (select)? x : y;
endmodule

