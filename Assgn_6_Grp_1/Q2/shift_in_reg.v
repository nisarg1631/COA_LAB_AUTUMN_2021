`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 6
// Problem Number: 2 [Bit Serial Adder]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////
module shift_in_register(
    input in,
    input rst,
    input clk,
    output reg[7:0] out
);
    always @(posedge clk) begin
        if(rst) begin   //if reset is asserted, output is 0
            out=0;
        end
        else begin
            out={in,out[7:1]};  // shift in the new bit on the msb side, drop the lsb
        end
    end
endmodule