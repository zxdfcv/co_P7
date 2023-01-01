`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:41 10/29/2022 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset,
	 input [31:0] i_inst_rdata,
	 input [31:0] m_data_rdata,	//I	数据存储器存储的相应数据
	 output [31:0] i_inst_addr, //IF级地址
	 output [31:0] m_data_addr,	 //O 待写入/读出的数据存储器相应地址
    output [31:0] m_data_wdata,	//O	待写入数据存储器相应数据
	 output [3:0] m_data_byteen,	//O	四位字节使能
	 output [31:0] m_inst_addr,	//O	M 级 PC

    output w_grf_we, //GRF数据
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr,
	 //new(P7)
	 input interrupt,              // 外部中断信号
    output [31:0] macroscopic_pc, // 宏观 PC
	 output [31:0] m_int_addr,     // 中断发生器待写入地址
    output [3:0] m_int_byteen  // 中断发生器字节使能信号
);
	wire [31:0] PrRD; //最终读出的数据
	wire [3:0] PrByteen;
	wire [31:0] PrAddr;
	wire [31:0] PrMEMPC;
	wire [31:0] PrWD;
	wire [31:0] DEV_Addr;
	wire [31:0] DEV_WD;
	wire [3:0] DMByteen;
	wire [3:0] IntByteen;
	wire timer1WE;
	wire timer2WE;
	wire [31:0] DEV_PC;
	wire [31:0] timer1_RD;
	wire [31:0] timer2_RD;
	wire [31:0] DM_RD;
	wire timer1IRQ;
	wire timer2IRQ;
	wire [5:0] HWInt;
	datapath datapath(
	.clk(clk), 
	.reset(reset), 
	.HWInt(HWInt),//需要比较优先级
	.i_inst_addr(i_inst_addr), 
	.m_data_rdata(PrRD),
	.i_inst_rdata(i_inst_rdata),
	.m_data_addr(PrAddr),
	.m_data_wdata(PrWD),
	.m_data_byteen(PrByteen),//得到字节使能信号
	.m_inst_addr(PrMEMPC),
	.w_grf_we(w_grf_we),
	.w_grf_addr(w_grf_addr),
	.w_grf_wdata(w_grf_wdata),
	.w_inst_addr(w_inst_addr)
	); // 连接数据通路 子模块链接
	
	TC timer1(
		.clk(clk),
		.reset(reset),
		.Addr(DEV_Addr[31:2]),
		.WE(timer1WE),
		.Din(DEV_WD),
		.Dout(timer1_RD),
		.IRQ(timer1IRQ)
	);
	
	TC timer2(
		.clk(clk),
		.reset(reset),
		.Addr(DEV_Addr[31:2]),
		.WE(timer2WE),
		.Din(DEV_WD),
		.Dout(timer2_RD),
		.IRQ(timer2IRQ)
	);
	Bridge Bridge(
		.PrAddr(PrAddr),
		.PrMEMPC(PrMEMPC),
		.PrByteen(PrByteen),
		.PrRD(PrRD),
		.PrWD(PrWD),
		.DEV_Addr(DEV_Addr),
		.DEV_WD(DEV_WD),
		.DMByteen(DMByteen),
		.IntByteen(IntByteen),//中断发生器字节使能
		.timer1WE(timer1WE),
		.timer2WE(timer2WE),
		.DEV_PC(DEV_PC),
		.timer1_RD(timer1_RD),
		.timer2_RD(timer2_RD),
		.DM_RD(DM_RD)
	);
	assign m_data_wdata = DEV_WD;
	assign m_data_byteen = DMByteen;
	assign DM_RD = m_data_rdata;
	assign m_data_addr = DEV_Addr;

	assign m_inst_addr = DEV_PC;
	assign HWInt = {3'b0, interrupt, timer2IRQ, timer1IRQ}; //timer1, timer0
	assign macroscopic_pc = DEV_PC; // 宏观 PC//中断发生器也是外设
	assign m_int_addr = DEV_Addr;    // 中断发生器待写入地址
	assign m_int_byteen = IntByteen;  // 中断发生器字节使能信号
endmodule
	