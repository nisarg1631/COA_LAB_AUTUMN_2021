`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Main Control
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module main_control(
    input [5:0] opcode,
    output reg [1:0] branch,
    output reg mem_read,
    output reg mem_write,
    output reg [1:0] mem_reg_pc,
    output reg [2:0] alu_op,
    output reg alu_source,
    output reg [1:0] write_reg
    );

    /*
        Assign the values based on the following table:
        OPCODE | ALUop | ALUsource | WriteReg | MemWrite | MemRead | MemRegPC | Branch
        000001 | 001   | 1         | 10       | 0        | 0       | 00       | 00
        000010 | 010   | 1         | 10       | 0        | 0       | 00       | 00
        000011 | 011   | 1         | 10       | 0        | 0       | 00       | 00
        000100 | 000   | 1         | 00       | 0        | 0       | 00       | 01
        000101 | 000   | 1         | 00       | 0        | 0       | 00       | 10
        000110 | 000   | 1         | 01       | 0        | 0       | 10       | 11
        111100 | 101   | 0         | 10       | 0        | 0       | 00       | 00
        111101 | 110   | 0         | 10       | 0        | 0       | 00       | 00
        111110 | 101   | 0         | 11       | 0        | 1       | 01       | 00
        111111 | 101   | 0         | 00       | 1        | 1       | 00       | 00
    */

    always @(*) begin
        case(opcode)
            6'b000001:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b001;
                    alu_source <= 1'b1;
                    write_reg <= 2'b10;
                end
            6'b000010:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b010;
                    alu_source <= 1'b1;
                    write_reg <= 2'b10;
                end
            6'b000011:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b011;
                    alu_source <= 1'b1;
                    write_reg <= 2'b10;
                end
            6'b000100:
                begin
                    branch <= 2'b01;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b000;
                    alu_source <= 1'b1;
                    write_reg <= 2'b00;
                end
            6'b000101:
                begin
                    branch <= 2'b10;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b000;
                    alu_source <= 1'b1;
                    write_reg <= 2'b00;
                end
            6'b000110:
                begin
                    branch <= 2'b11;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b10;
                    alu_op <= 3'b000;
                    alu_source <= 1'b1;
                    write_reg <= 2'b01;
                end
            6'b111100:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b101;
                    alu_source <= 1'b0;
                    write_reg <= 2'b10;
                end
            6'b111101:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b110;
                    alu_source <= 1'b0;
                    write_reg <= 2'b10;
                end
            6'b111110:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b1;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b01;
                    alu_op <= 3'b101;
                    alu_source <= 1'b0;
                    write_reg <= 2'b11;
                end
            6'b111111:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b1;
                    mem_write <= 1'b1;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b101;
                    alu_source <= 1'b0;
                    write_reg <= 2'b00;
                end
            default:
                begin
                    branch <= 2'b00;
                    mem_read <= 1'b0;
                    mem_write <= 1'b0;
                    mem_reg_pc <= 2'b00;
                    alu_op <= 3'b000;
                    alu_source <= 1'b0;
                    write_reg <= 2'b00;
                end
        endcase
    end

endmodule
