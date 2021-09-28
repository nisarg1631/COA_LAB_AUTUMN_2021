

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
    localparam s0 = 2'b00;       // equal state
    localparam s1 = 2'b01;         // greater than state
    localparam s2 = 2'b10;          // less than state
    always @(posedge clk) 
    begin
		present_state=next_state;   
        if(rst) begin             // reset state
            present_state = 0;
            next_state=0;
        end
        if (present_state==s0)   // FSM logic 
        begin
            if(a^b)             // if a and b not the same
                next_state=(a?s1:s2); // go to greater if a=1 and b=0 else go to less than
        end            
    end 
    always @(posedge clk) begin
        if(op==0) begin   //input control logic
            L=0;
            E=0;
            G=0;
        end
        else if(next_state==s0) begin //output logic for equal state
            L=0;
            E=1;
            G=0;
        end
        else if(next_state==s1) begin  //output logic for greater than state
            L=0;
            E=0;
            G=1;
        end
        else if(next_state==s2) begin  //output logic for less than state
            L=1;
            E=0;
            G=0;
        end
    end
endmodule