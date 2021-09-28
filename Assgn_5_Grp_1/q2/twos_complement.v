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

	parameter S0 = 1'b0, S1 = 1'b1;     // parameters to represent states of FSM
    reg present, next;                  // present and next states of FSM
	
    always @(posedge clk) begin 
		present = next;      // present state goes to next state
		if (reset) begin     // if reset
			next <= S0;          	// next state is 0
			out <= 1'b0;           	// output is 0
		end
        else begin
            if (present == S0) begin    // present state S0 (no flipping of bits)
                out <= in;              // output bit same as input bit
                if (in == 1'b1) begin   
                    next <= S1;         // if input is 1 (first 1 encountered, change state)
                end
                else begin
                    next <= S0;         // if input is 0 continue to stay in this state
                end
            end
            else begin                  // present state S1 (flipping of bits)
                next <= S1;             // FSM continues to stay in S1 irrespective of input
                out <= ~in;             // flip input bit
            end
        end
    end

endmodule    
