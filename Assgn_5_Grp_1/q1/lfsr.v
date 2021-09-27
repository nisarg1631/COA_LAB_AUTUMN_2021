
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
    input sel
);
    wire [3:0] state_out,state_in;
    wire w;
    dff DFF[3:0] (.q(state_out), .d(state_in), .clk(clk), .rst(reset));
    mux Mux[3:0] (.x(seed), .y({state_out[2],state_out[1],state_out[0],w}), .select(sel), .out(state_in));
    xor XOR(w,state_out[2],state_out[3]);
endmodule
