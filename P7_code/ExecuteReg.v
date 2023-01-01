`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:46 11/06/2022 
// Design Name: 
// Module Name:    EXecuteReg 
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
module ExecuteReg(
	//input
	input clk,
	input reset,
	input [31:0] NextEXPC,
	input [31:0] NextEXPC_8,
	input [31:0] NextEXIR,

	input [31:0] NextEXImm,
	input [31:0] NextEXRD1,
	input [31:0] NextEXRD2,
	input [31:0] NextEX$spM4,
	input NextEXJUMP,
	input NextEXAdEL_1,
	input NextEXRI,
	input NextEXSyscall,
	input NextEXBD,
	input Stalk,
	input Req,

	output reg [31:0] EXPC,
	output reg [31:0] EXPC_8, //预先算好PC8
	output reg [31:0] EXIR, 

	output reg [31:0] EXImm,
	output reg [31:0] EXRD1,
	output reg [31:0] EXRD2,
	output reg [31:0] EX$spM4,
	output reg EXJUMP,
	output reg EXAdEL_1,
	output reg EXRI,
	output reg EXSyscall,
	output reg EXBD
   );
	parameter init = 32'h0000_0000;//注意参数
	always@(posedge clk) begin //同步复位
		if (reset == 1'b1 || Req == 1'b1) begin
			EXPC <= (reset == 0 && Req == 1'b1) ? 32'h0000_4180 : 32'h0000_0000;
			EXPC_8 <= 32'h0000_0000;
			EXIR <= 32'h0000_0000;
			EXImm <= 32'h0000_0000;
			EXRD1 <= 32'h0000_0000;
			EXRD2 <= 32'h0000_0000;
			EXJUMP <= 1'b0;
			EX$spM4 <= 32'd0;
			EXAdEL_1 <= 0;
			EXRI <= 0;
			EXSyscall <= 0;
			EXBD <= 0;
		end else begin
			if (Stalk != 1'b1) begin //Stalk大写
				EXPC_8 <= NextEXPC_8;
				EXPC <= NextEXPC;
				EXIR <= NextEXIR;
				EXImm <= NextEXImm;
				EXRD1 <= NextEXRD1;
				EXRD2 <= NextEXRD2;
				EXJUMP <= NextEXJUMP;
				EX$spM4 <= NextEX$spM4;
				EXAdEL_1 <= NextEXAdEL_1;
				EXRI <= NextEXRI;
				EXSyscall <= NextEXSyscall;
				EXBD <= NextEXBD;
			end else begin
				EXPC <= NextEXPC; //PC应该为下一条PC
				EXPC_8 <= 32'h0000_0000;
				EXIR <= 32'h0000_0000;
				EXImm <= 32'h0000_0000;
				EXRD1 <= 32'h0000_0000;
				EXRD2 <= 32'h0000_0000; //插入nop
				EX$spM4 <= 32'd0;
				EXJUMP <= 1'b0;
				EXAdEL_1 <= 0;
				EXRI <= 0;
				EXSyscall <= 0;
				EXBD <= NextEXBD;
			end
		end
	
	end

endmodule
