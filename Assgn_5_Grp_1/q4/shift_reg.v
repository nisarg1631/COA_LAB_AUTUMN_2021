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
    input reset
);
	reg[31:0] temp;
    always @(posedge clk) begin
        if(reset) 
        begin
            out = 0;            
				temp=inp;
        end
        else 
        begin
            temp = {temp[30:0],0};
				out = temp[31];
        end
    end
	 
endmodule