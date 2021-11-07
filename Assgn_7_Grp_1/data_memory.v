`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Data Memory
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module data_memory(
    input [31:0] address,
    input clk,
    input enable,
    input write_enable,
    input [31:0] write_data,
    output [31:0] data_out
    );
	
	datastore DataRAM (.clka(~clk), .ena(enable), .wea(write_enable), .addra(address[11:0]), .dina(write_data), .douta(data_out));

endmodule
