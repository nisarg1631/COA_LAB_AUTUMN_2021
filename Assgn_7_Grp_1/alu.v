`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: ALU
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module alu(
    input signed [31:0] input1,
    input [31:0] input2,
    input [4:0] shamt,
    input [3:0] control,
    output reg [31:0] out,
    output reg [2:0] flags
    );

    wire [31:0] sum, compliment, bitand, bitxor, sll, srl, sra;
    wire sumcarry;
	wire [31:0] shamt_muxout; // whether to take shift from reg or shamt

    // sum using the cla developed in assignment 1, cascading two 16-bit clas
    wire sum_c_out, p1, g1, p2, g2;
    CLA_16bit_withLCU cla1(.in1(input1[15:0]), .in2(input2[15:0]), .c_in(1'b0), .sum(sum[15:0]), .c_out(sum_c_out), .p(p1), .g(g1));
	CLA_16bit_withLCU cla2(.in1(input1[31:16]), .in2(input2[31:16]), .c_in(sum_c_out), .sum(sum[31:16]), .c_out(sumcarry), .p(p2), .g(g2));

    assign compliment = ~input2 + 1'b1;
    assign bitand = input1 & input2;
    assign bitxor = input1 ^ input2;
    
	assign shamt_muxout = control[3] ? input2 : {27'b0, shamt};
    assign sll = input1 << shamt_muxout;
    assign srl = input1 >> shamt_muxout;
    assign sra = input1 >>> shamt_muxout;
	
    always @(*) begin
		flags[0] = input1 == 32'b0 ? 1'b1 : 1'b0;
		flags[1] = input1[31] == 1'b1 ? 1'b1 : 1'b0;
        case(control[2:0])
            3'b000: 
                begin
                    out = sum;
                    flags[2] = sumcarry;
                end
            3'b001:
                begin
                    out = compliment;
                    flags[2] = 1'b0;
                end
            3'b010:
                begin
                    out = bitand;
                    flags[2] = 1'b0;
                end
            3'b011:
                begin
                    out = bitxor;
                    flags[2] = 1'b0;
                end
            3'b100:
                begin
                    out = sll;
                    flags[2] = 1'b0;
                end
            3'b101:
                begin
                    out = srl;
                    flags[2] = 1'b0;
                end
            3'b110:
                begin
                    out = sra;
                    flags[2] = 1'b0;
                end
            default:
                begin
                    out = 32'b0;
                    flags[2] = 1'b0;
                end
        endcase
    end
endmodule
