
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 1 [Linear Feedback Shift Register (LFSR)]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////
// Used old code
module dff(
    input rst, // reset switch for dff
    input clk, // clock input to dff
    input d,	// next state
    output reg q // present state
);
    
    always @(posedge clk) begin
        if (rst) begin
            q <= 0; // if reset is on then move to state 0
        end
        else begin
            q <= d; // move to next state
        end
    end
endmodule
