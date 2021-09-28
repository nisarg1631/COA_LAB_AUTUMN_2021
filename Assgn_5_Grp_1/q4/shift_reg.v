

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 4 [Sequential Unsigned Comparator]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module linear_shift_register (
    input[31:0] inp,
    output reg out,
    input clk,
    input reset,
);
    always @(posedge clk) begin
        if(reset) 
        begin
            out = 0;            
        end
        else 
        begin
            out = inp[30];
            inp = inp << 1;
        end
    end
endmodule