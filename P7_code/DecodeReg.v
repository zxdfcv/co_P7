`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:14 11/06/2022 
// Design Name: 
// Module Name:    DecodeReg 
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
module DecodeReg(
	input clk,
	input reset,
	input [31:0] NextIDIR,
	input [31:0] NextIDPC_8,
	input [31:0] NextIDPC,
	input NextIDBD,
	input NextIDAdEL_1,
	input Stalk,
	input Req,
	input eret,
	//input Trans,//transfer signal
	output reg [31:0] IDIR,
	output reg [31:0] IDPC_8,//这一阶段的数据最简单 无其他扩展
	output reg [31:0] IDPC,
	output reg IDAdEL_1,
	output reg IDBD
	//我们流水线寄存器以其提供数据的流水级的简称命名，如 D 级流水线寄存器的前一级为 F 级，而后一级为 D 级。
    );
	parameter init = 32'h0000_0000;//理论上PC初始值应该为32'h0000_3000，但是这里不会被用到，所以可以不用管，IR要用，就不行了
	always@(posedge clk) begin//需要采用模块化和层次化设计。顶层文件为 mips.v，有效的驱动信号要求包括且仅包括同步复位信号 reset和时钟信号 clk，注意同步复位！！！
		if (reset == 1'b1 || Req == 1'b1) begin
			IDIR <= init;
			IDPC <= (reset == 0 && Req == 1'b1) ? 32'h0000_4180 : //Req
			IDBD <= 0;
			//init; //特判 reset
			IDPC_8 <= init;//两种PC统一存
			IDAdEL_1 <= 0;
		end else begin //冻结PC后无需额外处理
			if (Stalk == 1'b1) begin //暂停的时候不清楚延迟槽			
				IDIR <= IDIR;
				IDPC <= IDPC;
				IDPC_8 <= IDPC_8;//两种PC统一存
				IDAdEL_1 <= IDAdEL_1;//stable
				IDBD <= IDBD;
			end else begin //数据不变,避免覆盖
				if (!eret) begin
					IDIR <= NextIDIR;
					IDPC <= NextIDPC;
					IDPC_8 <= NextIDPC_8;
					IDAdEL_1 <= NextIDAdEL_1;
					IDBD <= NextIDBD;
				end else begin
					IDIR <= init;
					IDPC <= IDPC;
					IDPC_8 <= init;
					IDAdEL_1 <= 0;
					IDBD <= 0;
				end
			end
		end
	end
endmodule
