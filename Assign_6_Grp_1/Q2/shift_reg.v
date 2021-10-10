`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 5
// Problem Number: 4 [Sequential Unsigned Comparator]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////
// Used old code
module shift_register (
    input[7:0] inp,
    output reg out,
    input clk,
    input reset
);

	reg[7:0] temp; 	// register to store the loaded number

    always @(posedge clk) begin
		if(reset) begin
			temp <= inp; 		// asynchronous load
		end
      	else begin
          	temp <= {1'b0,temp[7:1] };	// right shift
		end      
    end
	always @(posedge clk) begin
		out <= temp[0];		// store the LSB as output
	end

endmodule
