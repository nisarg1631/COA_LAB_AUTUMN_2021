

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 4 [Sequential Unsigned Comparator]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module sequential_unsigned_comparator (
    input a,
    input b,
    input rst,
    input clk,
    input op,
    output reg L,
    output reg E,
    output reg G
);
    reg [1:0] present_state,next_state;
    localparam s0 = 0;
    localparam s1 = 1;
    localparam s2 = 2;
    always @(posedge clk) begin
        present_state=next_state;
        if(rst) begin
            present_state = 0;
            next_state=0;
        end
    end
    always @(posedge clk) 
    begin
        if (present_state==s0) 
        begin
            if(a^b) 
                next_state=(a?s1:s2);
        end            
    end 
    always @(posedge clk) begin
        if(op==1) begin
            L=0;
            E=0;
            G=0;
        end
        else if(present_state==s0) begin
            L=0;
            E=1;
            G=0;
        end
        else if(present_state==s1) begin
            L=0;
            E=0;
            G=1;
        end
        else if(present_state==s2) begin
            L=1;
            E=0;
            G=0;
        end
    end
endmodule