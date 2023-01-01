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
	 input [31:0] m_data_rdata,	//I	���ݴ洢���洢����Ӧ����
	 output [31:0] i_inst_addr, //IF����ַ
	 output [31:0] m_data_addr,	 //O ��д��/���������ݴ洢����Ӧ��ַ
    output [31:0] m_data_wdata,	//O	��д�����ݴ洢����Ӧ����
	 output [3:0] m_data_byteen,	//O	��λ�ֽ�ʹ��
	 output [31:0] m_inst_addr,	//O	M �� PC

    output w_grf_we, //GRF����
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr,
	 //new(P7)
	 input interrupt,              // �ⲿ�ж��ź�
    output [31:0] macroscopic_pc, // ��� PC
	 output [31:0] m_int_addr,     // �жϷ�������д���ַ
    output [3:0] m_int_byteen  // �жϷ������ֽ�ʹ���ź�
);
	wire [31:0] PrRD; //���ն���������
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
	.HWInt(HWInt),//��Ҫ�Ƚ����ȼ�
	.i_inst_addr(i_inst_addr), 
	.m_data_rdata(PrRD),
	.i_inst_rdata(i_inst_rdata),
	.m_data_addr(PrAddr),
	.m_data_wdata(PrWD),
	.m_data_byteen(PrByteen),//�õ��ֽ�ʹ���ź�
	.m_inst_addr(PrMEMPC),
	.w_grf_we(w_grf_we),
	.w_grf_addr(w_grf_addr),
	.w_grf_wdata(w_grf_wdata),
	.w_inst_addr(w_inst_addr)
	); // ��������ͨ· ��ģ������
	
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
		.IntByteen(IntByteen),//�жϷ������ֽ�ʹ��
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
	assign macroscopic_pc = DEV_PC; // ��� PC//�жϷ�����Ҳ������
	assign m_int_addr = DEV_Addr;    // �жϷ�������д���ַ
	assign m_int_byteen = IntByteen;  // �жϷ������ֽ�ʹ���ź�
endmodule
	