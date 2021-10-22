
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 6
// Problem Number: 3 [Booth Multiplier]
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
// 
//////////////////////////////////////////////////////////////////////////////////

module booth_mult(
    input [7:0] multiplier,
    input [7:0] multiplicand,
    input clk,
    input reset,
    input load,
    output reg [15:0] result
);

    reg [7:0] A, Q, M;  // registers to store multiplicand and multiplier
    reg Q_buff, done;   // Q_buff is the extra bit required in booths multiplication, done is set to 1 when multiplication is complete
    reg [4:0] count;    // register to count from 8 to 0 during multiplication

    always @(posedge clk) begin
        if(reset == 1'b1) begin         // reset conditions
            A = 0;
            Q = 0;
            M = 0;
            done = 1'b0;
            Q_buff = 1'b0;
            result = 0;
            count = 5'b01000;
        end
        else if(load == 1'b1) begin     // load conditions
            Q = multiplier;
            M = multiplicand;
        end
        else begin
            if(count != 5'b00000) begin     // while the count is not 0
                if(Q[0] != Q_buff) begin    // 01 and 10 case
                    if(Q[0] == 1'b0) begin  // 01 case, A += M
                        A = A + M;
                    end
                    else begin              // 10 case, A -= M
                        A = A - M;
                    end
                end
                // arithmetic right shift A, Q, Q-1
                Q_buff = Q[0];
                Q = {A[0], Q[7:1]};
                A = {A[7], A[7:1]};
                // count--
                count = count - 5'b00001;
            end
            if(count == 5'b00000 && done == 1'b0) begin     // if count becomes 0 then mark done = 1 and set the output reg
                result = {A, Q};
                done = 1'b1;
            end
        end 
    end

endmodule
