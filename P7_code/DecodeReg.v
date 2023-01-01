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
	output reg [31:0] IDPC_8,//��һ�׶ε�������� ��������չ
	output reg [31:0] IDPC,
	output reg IDAdEL_1,
	output reg IDBD
	//������ˮ�߼Ĵ��������ṩ���ݵ���ˮ���ļ���������� D ����ˮ�߼Ĵ�����ǰһ��Ϊ F ��������һ��Ϊ D ����
    );
	parameter init = 32'h0000_0000;//������PC��ʼֵӦ��Ϊ32'h0000_3000���������ﲻ�ᱻ�õ������Կ��Բ��ùܣ�IRҪ�ã��Ͳ�����
	always@(posedge clk) begin//��Ҫ����ģ�黯�Ͳ�λ���ơ������ļ�Ϊ mips.v����Ч�������ź�Ҫ������ҽ�����ͬ����λ�ź� reset��ʱ���ź� clk��ע��ͬ����λ������
		if (reset == 1'b1 || Req == 1'b1) begin
			IDIR <= init;
			IDPC <= (reset == 0 && Req == 1'b1) ? 32'h0000_4180 : //Req
			IDBD <= 0;
			//init; //���� reset
			IDPC_8 <= init;//����PCͳһ��
			IDAdEL_1 <= 0;
		end else begin //����PC��������⴦��
			if (Stalk == 1'b1) begin //��ͣ��ʱ������ӳٲ�			
				IDIR <= IDIR;
				IDPC <= IDPC;
				IDPC_8 <= IDPC_8;//����PCͳһ��
				IDAdEL_1 <= IDAdEL_1;//stable
				IDBD <= IDBD;
			end else begin //���ݲ���,���⸲��
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
