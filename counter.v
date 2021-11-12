`timescale 1ns / 1ps

    // COA LAB TEST 2
    // Problem Number: 1
    // Semester Number: 5
    // Name: Nisarg Upadhyaya (19CS30031)

module counter(
    input start,
	input clk,
    output reg done,
    output reg [2:0] cnt
    );
	
	always @(posedge clk) begin
		if(start) begin // if start set done to 0 and counter to 6
			done <= 1'b0;
			cnt <= 3'b110;
		end else begin
			if(cnt == 3'b000) begin // if counter is 0, set done to 1 (6 cycles complete)
                done <= 1'b1;
            end else begin  // else decrement counter
                cnt <= cnt - 3'b001;
                done <= 1'b0;
            end
		end
	end


endmodule
