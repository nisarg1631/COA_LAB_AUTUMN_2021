
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 1 [Linear Feedback Shift Register (LFSR)]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module linear_feedback_shift_register(
    input clk,
    input reset,
    input [3:0] seed,
    output [3:0] out,
);
    reg [3:0] state;
    reg [3:0] feedback;
    always @(posedge clk) 
    begin
        if (reset) 
        begin
            state <= seed;
        end 
        else 
        begin
            feedback <= state[3] ^ state[2];
            state <= state[2:0] << 1;
            state[0] <= feedback;
        end
    end
    assign out = state;
endmodule
