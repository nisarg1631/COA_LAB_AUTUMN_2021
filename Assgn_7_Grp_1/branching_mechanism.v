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
	input [31:0] dest_addr,
	input [31:0] reg1,
	input [1:0] branch_control_signal,
	input [5:0] ins_func_code,
	input [2:0] alu_flag,
	input rst,
	input clk,
    output reg [31:0] pc_out,
	output reg [31:0] ref
    );
	/*
		name 	ins_func_code		branch_control		alu_flag(ZNC)	pc_out			ref
		br		000000				01					xxx				reg1  			pc_in+1
		bltz	000001				01					x1x				dest_addr		pc_in+1
		bz		000010				01					1xx				dest_addr		pc_in+1
		bnz		000011				01					0xx				dest_addr		pc_in+1
		b		000000				10					xxx				dest_addr		pc_in+1
		bcy		000001				10					xx1				dest_addr		pc_in+1
		bncy	000010				10					xx0				dest_addr		pc_in+1
		bl		000000				11					xxx				dest_addr		pc_in+1
		none 	xxxxxx				00					xxx				pc_in+1			pc_in+1
	*/
	reg [2:0] old_flag;

	always @(posedge clk) begin
		if(rst)
			old_flag <= 3'b000;
		else
			old_flag <= alu_flag;
	end

	always @(*) begin
		ref <= pc_in+32'd1;
		if(rst)
			pc_out <= 32'd0;
		else begin 
			case(branch_control_signal)
				2'b01: begin
					case(ins_func_code)
						6'b000000: begin
							pc_out<=reg1;
						end
						6'b000001:begin
							if(alu_flag[1]==1'b1)
								pc_out<=dest_addr;
							else
								pc_out<=pc_in+32'd1;
						end
						6'b000010:begin
							if(alu_flag[0]==1'b1)
								pc_out<=dest_addr;
							else
								pc_out<=pc_in+32'd1;
						end
						6'b000011:begin
							if(alu_flag[0]==1'b0)
								pc_out<=dest_addr;
							else
								pc_out<=pc_in+32'd1;
						end
						default: begin
							pc_out<=pc_in+32'd1;
						end
					endcase	
				end
				2'b10: begin
					case(ins_func_code)
						6'b000000: begin
							pc_out<=dest_addr;
						end
						6'b000001:begin
							if(old_flag[2]==1'b1)
								pc_out<=dest_addr;
							else
								pc_out<=pc_in+32'd1;
						end
						6'b000010:begin
							if(old_flag[2]==1'b0)
								pc_out<=dest_addr;
							else
								pc_out<=pc_in+32'd1;
						end
						default: begin
							pc_out<=pc_in+32'd1;
						end
					endcase	
				end
				2'b11: begin
					pc_out<=dest_addr;
				end
				default: begin
					pc_out<=pc_in+32'd1;
				end
			endcase
		end
	end
endmodule
