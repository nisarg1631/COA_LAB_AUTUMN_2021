`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 4 [Sequential Unsigned Comparator]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module shift_register (
    input[8:0] inp,
    output reg out,
    input clk,
    input reset
);

	reg[8:0] temp; 	// register to store the loaded number

    always @(posedge clk or posedge reset) begin
		if(reset) begin
			temp <= inp; 		// asynchronous load
		end
      	else begin
          	temp <= { temp[6:0], 1'b0 };	// left shift
		end      
    end
	always @(*) begin
		out = temp[7];		// store the MSB as output
	end

endmodule
