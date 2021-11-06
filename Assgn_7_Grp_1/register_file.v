`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Register File
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module register_file(
    input [4:0] reg1Addr,
    input [4:0] reg2Addr,
    input writeEnable,
    input [31:0] writeData,
    output [31:0] reg1Out,
    output [31:0] reg2Out,
    input clk,
    input rst
    );

    reg [31:0] registers[31:0];

    // initially all registers are made 0
    initial begin
        registers[0] <= 0;
        registers[1] <= 0;
        registers[2] <= 0;
        registers[3] <= 0;
        registers[4] <= 0;
        registers[5] <= 0;
        registers[6] <= 0;
        registers[7] <= 0;
        registers[8] <= 0;
        registers[9] <= 0;
        registers[10] <= 0;
        registers[11] <= 0;
        registers[12] <= 0;
        registers[13] <= 0;
        registers[14] <= 0;
        registers[15] <= 0;
        registers[16] <= 0;
        registers[17] <= 0;
        registers[18] <= 0;
        registers[19] <= 0;
        registers[20] <= 0;
        registers[21] <= 0;
        registers[22] <= 0;
        registers[23] <= 0;
        registers[24] <= 0;
        registers[25] <= 0;
        registers[26] <= 0;
        registers[27] <= 0;
        registers[28] <= 0;
        registers[29] <= 0;
        registers[30] <= 0;
        registers[31] <= 0;
    end

    always @(posedge clk) begin
        if(rst) begin
            registers[0] <= 0;
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
            registers[4] <= 0;
            registers[5] <= 0;
            registers[6] <= 0;
            registers[7] <= 0;
            registers[8] <= 0;
            registers[9] <= 0;
            registers[10] <= 0;
            registers[11] <= 0;
            registers[12] <= 0;
            registers[13] <= 0;
            registers[14] <= 0;
            registers[15] <= 0;
            registers[16] <= 0;
            registers[17] <= 0;
            registers[18] <= 0;
            registers[19] <= 0;
            registers[20] <= 0;
            registers[21] <= 0;
            registers[22] <= 0;
            registers[23] <= 0;
            registers[24] <= 0;
            registers[25] <= 0;
            registers[26] <= 0;
            registers[27] <= 0;
            registers[28] <= 0;
            registers[29] <= 0;
            registers[30] <= 0;
            registers[31] <= 0;
        end else begin
            if(writeEnable) begin
                registers[reg1Addr] <= writeData;
            end
        end
    end

    assign reg1Out = registers[reg1Addr];
    assign reg2Out = registers[reg2Addr];

endmodule
