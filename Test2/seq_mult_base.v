`timescale 1ns / 1ps

    // COA LAB TEST 2
    // Problem Number: 1
    // Semester Number: 5
    // Name: Nisarg Upadhyaya (19CS30031)

module seq_mult_base(
    input done,
    input load,
    input clk,
    input [5:0] A,
    input [5:0] B,
    output reg [11:0] P
    );

    reg [5:0] A_temp; // A_temp is used to store the value of A and right shift it at every iteration
    reg temp_carry; // carry for addition

    always @(posedge clk) begin
        if(load) begin  // load is on so assign A_temp and set product to 0
            A_temp <= A;
            P = 12'b0;
        end else begin
            if(done) begin // if 6 cycles are done do nothing
                /* do nothing */
            end else begin
                if(A_temp[0])   // if LSB is 1 add B to Ps most significant bits
                    {temp_carry, P[11:6]} = P[11:6] + B;
                else    // else add 0
                    {temp_carry, P[11:6]} = P[11:6];
                A_temp <= A_temp >> 1; // right shift A_temp
                P = {temp_carry, P[11:1]}; // right shift P and MSB becomes carry
            end
        end
    end

endmodule
