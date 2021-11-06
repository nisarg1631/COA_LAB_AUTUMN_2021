`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Program Counter
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module program_counter(
    input [31:0] pc_in,
    input clk,
    input rst,
    output reg [31:0] pc_out
    );

    always @(posedge clk) begin
        if(rst) begin
            pc_out <= 0;
        end else begin
            pc_out <= pc_in;
        end
    end

endmodule
