`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 3 [Multiple-of-three Detector FSM]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module multiple_of_three_detector_fsm(
    output reg out,         // output of the FSM
    input reset,            // reset input
    input clk,              // clock input
    input in                // input to the FSM
);
    reg[1:0] present_state, next_state; // 3 states so 2 flip-flop
    localparam rem0 = 2'b00, rem1 = 2'b01, rem2 = 2'b10; // 3 states representing number modulo 3

    always @(posedge clk) begin
        present_state = next_state;     // switch state
        if (reset) begin                // if reset is set make next state 0 and output 1
            next_state <= rem0;
            out <= 1'b1;
        end 
        else begin
            if (present_state == rem0) begin    // if number read till now is of type 3n
                if(in == 1'b0) begin            // 2*3n + 0 = 6*n = 0 (mod 3), stay in state 0, output 1
                    next_state <= rem0;
                    out <= 1'b1;
                end
                else if(in == 1'b1) begin       // 2*3n + 1 = 6*n + 1 = 1 (mod 3), move to state 1, output 0
                    next_state <= rem1;
                    out <= 1'b0;
                end 
            end
            else if (present_state == rem1) begin   // if number read till now is of type 3n+1
                if(in == 1'b0) begin                // 2*(3n+1) + 0 = 6*n + 2 = 2 (mod 3), move to state 2, output 0
                    next_state <= rem2;
                    out <= 1'b0;
                end
                else if(in == 1'b1) begin           // 2*(3n+1) + 1 = 6*n + 3 = 0 (mod 3), move to state 0, output 1
                    next_state <= rem0;
                    out <= 1'b1;
                end
            end          
            else if(present_state == rem2) begin    // if number read till now is of type 3n+2
                if(in == 1'b0) begin                // 2*(3n+2) + 0 = 6*n + 4 = 1 (mod 3), move to state 1, output 0
                    next_state <= rem1;
                    out <= 1'b0;
                end 
                else if(in == 1'b1) begin           // 2*(3n+2) + 1 = 6*n + 5 = 2 (mod 3), move to state 2, output 0
                    next_state <= rem2;
                    out <= 1'b0;
                end
            end  
        end
    end

endmodule
