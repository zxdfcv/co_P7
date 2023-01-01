`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:23:02 11/06/2022 
// Design Name: 
// Module Name:    MEMoryReg 
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
module MemoryReg( //分开流水
	input clk,
	input reset,
	input [31:0] NextMEMALUOut,
	input [31:0] NextMEMPC_8,
	input [31:0] NextMEMPC,
	input [31:0] NextMEMIR,
	input [31:0] NextMEMRD2,
	input [31:0] NextMEMRD1,
	input [31:0] NextMEMMULDIVOut,
	input [31:0] NextMEM$spM4,
	input NextMEMAdEL_1,
	input NextMEMAdEL_2,
	input NextMEMAdES,
	input NextMEMOv,
	input NextMEMRI,
	input NextMEMSyscall,
	input NextMEMJUMP,
	input NextMEMBD,
	input Req,
	
	output reg [31:0] MEMPC,
	output reg [31:0] MEMPC_8,
	output reg [31:0] MEMIR,
	output reg [31:0] MEMRD2,
	output reg [31:0] MEMRD1,
	output reg [31:0] MEMALUOut,
	output reg [31:0] MEMMULDIVOut,
	output reg [31:0] MEM$spM4,
	output reg MEMJUMP,
	output reg MEMAdEL_1,
	output reg MEMAdEL_2,
	output reg MEMAdES,
	output reg MEMOv,
	output reg MEMRI,
	output reg MEMSyscall,
	output reg MEMBD
    );
	parameter init = 32'h0000_0000;//可以加一个头文件装载所有的参数
	always@(posedge clk) begin
		if (reset == 1'b1 || Req == 1'b1) begin
			MEMPC_8 <= init;
			MEMPC <= (reset == 0 && Req == 1'b1) ? 32'h0000_4180 : init; //保持宏观PC连续性
			MEMIR <= init;
			MEMRD2 <= init;
			MEMRD1 <= init;
			MEMALUOut <= init;
			MEMJUMP <= 1'b0;
			MEMMULDIVOut <= init;
			MEM$spM4 <= init;
			MEMAdEL_1 <= 0;
			MEMAdEL_2 <= 0;
			MEMAdES <= 0;
			MEMOv <= 0;
			MEMRI <= 0;
			MEMSyscall <= 0;
			MEMBD <= 0;
		end else begin
			MEMPC <= NextMEMPC;
			MEMPC_8 <= NextMEMPC_8;//PC + 4
			MEMIR <= NextMEMIR;
			MEMRD2 <= NextMEMRD2;
			MEMRD1 <= NextMEMRD1;
			MEMALUOut <= NextMEMALUOut;
			MEMMULDIVOut <= NextMEMMULDIVOut;
			MEMJUMP <= NextMEMJUMP;
			MEM$spM4 <= NextMEM$spM4;
			MEMAdEL_1 <= NextMEMAdEL_1;
			MEMAdEL_2 <= NextMEMAdEL_2;
			MEMAdES <= NextMEMAdES;
			MEMOv <= NextMEMOv;
			MEMRI <= NextMEMRI;
			MEMSyscall <= NextMEMSyscall;
			MEMBD <= NextMEMBD;
		end
	end

endmodule
