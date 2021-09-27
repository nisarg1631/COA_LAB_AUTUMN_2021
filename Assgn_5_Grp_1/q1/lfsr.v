
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
    input sel,
	 output wire[3:0] w
);
    
    wire [3:0] w_in;
    wire next;
	
    mux Mux3 (.x(next),.y(seed[3]),.select(sel),.out(w_in[0]));
	mux Mux2 (.x(w[0]),.y(seed[2]),.select(sel),.out(w_in[1]));
	mux Mux1 (.x(w[1]),.y(seed[1]),.select(sel),.out(w_in[2]));
	mux Mux0 (.x(w[2]),.y(seed[0]),.select(sel),.out(w_in[3]));
	
    dff DFF3 (.q(w[0]), .d(w_in[0]), .clk(clk), .rst(reset));
	dff DFF2 (.q(w[1]), .d(w_in[1]), .clk(clk), .rst(reset));
	dff DFF1 (.q(w[2]), .d(w_in[2]), .clk(clk), .rst(reset));
    dff DFF0 (.q(w[3]), .d(w_in[3]), .clk(clk), .rst(reset));
	
    xor XOR(next,w[2],w[3]);  

    
endmodule
