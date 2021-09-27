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
    reg[1:0] present_state,next_state; // 3 states so 2 flip-flop
    localparam rem0 = 0;
    localparam rem1 = 1;
    localparam rem2 = 2;

    always @(posedge clk) 
    begin
        present_state = next_state;
        if (reset) 
        begin
            next_state=rem0;
            out=0;
        end 
        else 
        begin
            if (present_state==rem0) 
            begin
                if(in==0) 
                begin
                    next_state=rem0;
                    out=1;
                end
                else if(in==1) 
                begin
                    next_state=rem1;
                    out=0;
                end 
            end
            else if (present_state==rem1)
            begin
                if(in==0) 
                begin
                    next_state=rem2;
                    out=0;
                end
                else if(in==1) 
                begin
                    next_state=rem0;
                    out=1;
                end
            end          
            else if(present_state==rem2)
            begin
                if(in==0) 
                begin
                    next_state=rem1;
                    out=0;
                end 
                else if(in==1) 
                begin
                    next_state=rem2;
                    out=0;
                end
            end  
        end
    end
endmodule