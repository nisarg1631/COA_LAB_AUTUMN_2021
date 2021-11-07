`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: ALU Control
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module alu_control(
    input [2:0] alu_op,
    input [5:0] func_code,
    output reg [3:0] alu_control_signal
    );

    /*
        Assign the values based on the following table:
        ALUop (from control unit) - Function Code - Control Signal
        000                       - x             - 0111
        001                       - 000000        - 0000
        001                       - 000001        - 0001
        010                       - 000000        - 0010
        010                       - 000001        - 0011
        011                       - 000000        - 0100
        011                       - 000001        - 0101
        011                       - 000010        - 1100
        011                       - 000011        - 1101
        011                       - 000100        - 0110
        011                       - 000101        - 1110
        101                       - x             - 0000
        110                       - x             - 0001
    */

    always @(*) begin
        case(alu_op)
            3'b001:
                begin
                    case(func_code)
                        6'b000000: alu_control_signal <= 4'b0000;
                        6'b000001: alu_control_signal <= 4'b0001;
                        default: alu_control_signal <= 4'b0111;
                    endcase
                end
            3'b010:
                begin
                    case(func_code)
                        6'b000000: alu_control_signal <= 4'b0010;
                        6'b000001: alu_control_signal <= 4'b0011;
                        default: alu_control_signal <= 4'b0111;
                    endcase
                end
            3'b011:
                begin
                    case(func_code)
                        6'b000000: alu_control_signal <= 4'b0100;
                        6'b000001: alu_control_signal <= 4'b0101;
                        6'b000010: alu_control_signal <= 4'b1100;
                        6'b000011: alu_control_signal <= 4'b1101;
                        6'b000100: alu_control_signal <= 4'b0110;
                        6'b000101: alu_control_signal <= 4'b1110;
                        default: alu_control_signal <= 4'b0111;
                    endcase
                end
            3'b101: alu_control_signal <= 4'b0000;
            3'b110: alu_control_signal <= 4'b0001;
            default: alu_control_signal <= 4'b0111;
        endcase
    end

endmodule
