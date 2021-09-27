`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 2 [Two’s Complement Converter FSM]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module two_complement_converter_fsm(
    output reg out,         // output of the two’s complement converter
    input in,               // input to the two’s complement converter
    input clk,              // clock input to the two’s complement converter
    input reset             // reset input to the two’s complement converter
);
    reg present,next;       // present and next states of FSM
    always @(posedge clk) 
    begin 
        present=next;         // present state is next state
        if (reset) 
        begin      // if reset
            next=0;          // next state is 0
            out=0;           // output is 0
        end
        else 
		begin
            if (present==0)
            begin
                begin
                    if (in==1)
                    begin
                        next=1;
                        out=1;
                    end
                    else
                    begin
                        next=0;
                        out=0;
                    end
                end
            end
            else 
            begin
                begin
                    if (in==1)
                    begin
                        next=1;
                        out=0;
                    end
                    else
                    begin
                        next=1;
                        out=1;
                    end
                end
            end
        end
    end
endmodule    
