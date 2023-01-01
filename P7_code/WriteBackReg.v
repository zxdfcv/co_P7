`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:23:25 11/06/2022 
// Design Name: 
// Module Name:    WriteBackReg 
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
module WriteBackReg(
	input clk,
	input reset,
	input [31:0] NextWBIR,
	input [31:0] NextWBRD,
	input [31:0] NextWBPC,
	input [31:0] NextWBPC_8,
	input [31:0] NextWBALUOut,
	input [31:0] NextWBMULDIVOut,
	input [31:0] NextWB$spM4,
	input [31:0] NextWBRD2,
	input [31:0] NextWBCP0Out,
	input NextWBJUMP,
	input Req,
	
	output reg [31:0] WBIR,
	output reg [31:0] WBRD,
	output reg [31:0] WBPC,
	output reg [31:0] WBPC_8,
	output reg [31:0] WBALUOut,
	output reg [31:0] WBMULDIVOut,
	output reg [31:0] WB$spM4,
	output reg [31:0] WBRD2,
	output reg [31:0] WBCP0Out,
	output reg WBJUMP
    );
	parameter init = 32'h0000_0000;
	always@(posedge clk) begin
		if (reset == 1'b1 || Req == 1'b1) begin
			WBIR <= init;
			WBRD <= init;
			WBPC <= init;//不再需要
			WBPC_8 <= init;
			WBALUOut <=  init;
			WBMULDIVOut <= init;
			WB$spM4 <= init;
			WBJUMP  <= 1'b0;
			WBRD2 <= init;
			WBCP0Out <= init;//unify
		end else begin
			WBIR <= NextWBIR;
			WBRD <= NextWBRD;
			WBPC <= NextWBPC;
			WBPC_8 <= NextWBPC_8;
			WBALUOut <= NextWBALUOut;
			WBMULDIVOut <= NextWBMULDIVOut;
			WB$spM4 <= NextWB$spM4;
			WBJUMP <= NextWBJUMP;
			WBRD2 <= NextWBRD2;
			WBCP0Out <= NextWBCP0Out;
		end
	end

endmodule
