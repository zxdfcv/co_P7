`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:53 12/15/2022 
// Design Name: 
// Module Name:    Bridge 
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
module Bridge(
	input [31:0] PrAddr,
	input [31:0] PrMEMPC,
	input [3:0] PrByteen,//读写模式
	output [31:0] PrRD,
	input [31:0] PrWD,
	output [31:0] DEV_Addr,
	output [31:0] DEV_WD,
	output [3:0] DMByteen,
	output [3:0] IntByteen,
	output timer1WE,
	output timer2WE,
	output [31:0] DEV_PC,
	input [31:0] timer1_RD,
	input [31:0] timer2_RD,
	input [31:0] DM_RD
    );

/**
	 input [31:0] m_data_rdata,	//I	数据存储器存储的相应数据
	 output [31:0] m_data_addr,	 //O 待写入/读出的数据存储器相应地址
    output [31:0] m_data_wdata,	//O	待写入数据存储器相应数据
	 output [3:0] m_data_byteen,	//O	四位字节使能
	 output [31:0] m_inst_addr,	//O	M 级 PC
**/
	assign PrRD = (PrAddr >= 32'h0000_0000 && PrAddr <= 32'h0000_2fff) ? DM_RD :
					  (PrAddr >= 32'h0000_7f00 && PrAddr <= 32'h0000_7f0b) ? timer1_RD : 
					  (PrAddr >= 32'h0000_7f10 && PrAddr <= 32'h0000_7f1b) ? timer2_RD : 
					  0;//err
	assign DEV_Addr = PrAddr;//写入
	assign DEV_WD = PrWD;
	
	assign DMByteen = (PrAddr >= 32'h0000_0000 && PrAddr <= 32'h0000_2fff) ? PrByteen : 0;
	assign timer1WE = ((PrAddr >= 32'h0000_7f00 && PrAddr <= 32'h0000_7f0b) & (|PrByteen));
	assign timer2WE = ((PrAddr >= 32'h0000_7f10 && PrAddr <= 32'h0000_7f1b) & (|PrByteen));
	assign IntByteen = (PrAddr >= 32'h0000_7f20 && PrAddr <= 32'h0000_7f23) ? PrByteen : 0;
	assign DEV_PC = PrMEMPC;
endmodule
