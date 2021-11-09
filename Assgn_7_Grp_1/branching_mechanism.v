`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Branching Mechanism
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module branching_mechanism(
    input [31:0] pc_in,
	input [31:0] instruction,
	input rst,
	input [2:0] alu_flag,
    output reg [31:0] pc_out
    );
	
	always @(*) begin
		if(rst)
			pc_out <= 32'd0;
		else
			pc_out <= pc_in + 32'd1;
	end

endmodule
