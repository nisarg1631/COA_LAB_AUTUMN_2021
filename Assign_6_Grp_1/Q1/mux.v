
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
    input  x,   // input0 to the mux
    input y,   // input1 to the mux
    input select,   // select input to the mux
    output reg out // output of the mux
);
    always @(*) begin
        if(select)
            out=y; // input1 if select is on
        else 
            out=x; // else input0
    end
endmodule

