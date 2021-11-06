`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Instruction Fetch
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module instruction_fetcher(
    input [31:0] pc,
    input clk,
    output [31:0] instr
    );

    instructions InstrROM (.clka(clk), .addra(pc[11:0]), .douta(instr));

endmodule
