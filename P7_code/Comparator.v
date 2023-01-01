`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:53 11/11/2022 
// Design Name: 
// Module Name:    Comparator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "name.v"
module Comparator(
	input [31:0] A,
	input [31:0] B,
	input [3:0] CMPMode,
	output cmp
    );
	wire _btheq;
	bpnal bpnal(.A(A), .ans(_bpnal));
	btheq btheq(.A(A), .B(B), .ans(_btheq));
	assign cmp = (CMPMode == `CMPMode_NOTEQUAL) ? (A != B) :
			//(CMPMode == `CMPMode_NOTEQUALZ) ? (A != 32'd0) :
			(CMPMode == `CMPMode_NOTEQUALZ) ? _bpnal  :
			(CMPMode == `CMPMode_BTHEQ) ? _btheq : 
			(A == B);//`CMPMode_EQUAL

endmodule

module bpnal(
	input [31:0] A,
	output reg ans
);
integer i;
always@(*) begin
	ans = 1;
	for (i = 0; i < 16; i = i + 1) begin
		if (A[i] == A[31 - i] && ans) begin
			ans = ans;
		end else begin
			ans = 0;
		end
	end
end

endmodule

module btheq(
	input [31:0] A,
	input [31:0] B,
	output reg ans
);

	integer i = 0;
	reg false = 0;
	always@(*) begin
		ans = 0;
		false = 0;
		for (i = 31; $signed(i) >= $signed(0); i = i - 1) begin
			if (A[i] == 1'b1 && B[i] == 1'b1) begin
				if (false == 1'b0) begin
					ans = 1'b1;
				end else begin
					ans = 1'b0;
				end
			end else if (A[i] == 1'b0 && B[i] == 1'b0) begin
				//²»×ö
			end else begin
				if (ans == 1'b0) begin
					false = 1'b1;
				end else begin
					false = 1'b0;
				end
			end
		end
		ans = (false == 1'b0) ? ans : 1'b0;
	end

endmodule 