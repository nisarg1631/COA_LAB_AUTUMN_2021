
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
    output wire [7:0] out
);
// I have not used the template sir discussed in the lab, of using an input layer of 8 muxs and an output layer of 8 muxes, I have instead added mux layers after each shift layer.
    wire [7:0] reg_temp,temp2,temp3,temp4,temp5;
    mux Layer1 [7:0] (.select(dir),.x({in[3:0],4'b0}),.y({4'b0,in[7:4]}),.out(reg_temp));  //  shift by 4 to left or right
    mux Layer2 [7:0] (.select(shamt[2]),.x(in),.y(reg_temp),.out(temp2));    // to shift or not shift  by 4 
    mux Layer3 [7:0] (.select(dir),.x({temp2[5:0],2'b0}),.y({2'b0,temp2[7:2]}),.out(temp3)); // shift by 2 to left or right
    mux Layer4 [7:0] (.select(shamt[1]),.x(temp2),.y(temp3),.out(temp4));   // to shift or not shift by 2
    mux Layer5 [7:0] (.select(dir),.x({temp4[6:0],1'b0}),.y({1'b0,temp4[7:1]}),.out(temp5)); // shift by 1 to left or right
    mux Layer6 [7:0] (.select(shamt[0]),.x(temp4),.y(temp5),.out(out));    // to shift or not shift by 1
endmodule
