

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
    reg [1:0] present_state, next_state;

    localparam s0 = 2'b00;       // equal state
    localparam s1 = 2'b01;       // greater than state
    localparam s2 = 2'b10;       // less than state

    always @(posedge clk) begin   
        if(rst) begin             // reset state
            present_state <= s0;
        end
        else begin
            present_state <= next_state;
        end
    end

    // next state logic
    always @(*) begin
        if (present_state == s0 && a^b) begin // state change can only take place when from equal state                        
            next_state = (a ? s1 : s2);       // if a and b not the same go to greater if a=1 and b=0 else go to less than
        end
        else begin
            next_state = present_state;       // otherwise continue to stay in the present state
        end
    end

    // store output in L, E, G
    always @(*) begin
        if(op == 1'b0) begin            //output control logic
            L = 1'b0;
            E = 1'b0;
            G = 1'b0;
        end
        else if(next_state == s0) begin //output logic for equal state
            L = 1'b0;
            E = 1'b1;
            G = 1'b0;
        end
        else if(next_state == s1) begin  //output logic for greater than state
            L = 1'b0;
            E = 1'b0;
            G = 1'b1;
        end
        else begin  //output logic for less than state
            L = 1'b1;
            E = 1'b0;
            G = 1'b0;
        end
    end

endmodule
