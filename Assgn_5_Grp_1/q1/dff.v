
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 1 [Linear Feedback Shift Register (LFSR)]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module dff(
    input rst,
    input clk,
    input d,
    output reg q
);
    
    always @(posedge clk) begin
        if (rst) begin
            q=0;
        end
        else begin
            q=d;
        end
    end
endmodule