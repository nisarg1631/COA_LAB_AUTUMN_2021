
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 6
// Problem Number: 1 [Bidirectional Barrel Shifter]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module Bidirectional_Barrel_Shifter(
    input [7:0] in,
    input [2:0] shamt,
    input dir,
    output [7:0] out
);
    reg [7:0] reg_temp,temp2;
    mux Layer1(.select(dir),.x({in[6:0],1'b0}),.y({1'b0,in[7:1]}),.out(reg_temp));  //  shift by 1 to left or right
    mux Layer2(.select(shamt[0]),.x(in),.y(reg_temp),.out(out));    // to shift or not shift  by 1 
    mux Layer3(.select(dir),.x({out[5:0],2'b0}),.y(2'b0,out[7:2]),.out(reg_temp)); // shift by 2 to left or right
    mux Layer4(.select(shamt[1]),.x(out),.y(reg_temp),.out(temp2)); // one more temp needed?  // to shift or not shift by 2
    mux Layer5(.select(dir),.x({out[3:0],4'b0}),.y({4'b0,out[7:4]}),.out(reg_temp)); // shift by 4 to left or right
    mux Layer6(.select(shamt[2]),.x(temp2),.y(reg_temp),.out(out));    // to shift or not shift by 4
endmodule
