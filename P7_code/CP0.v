`timescale 1ns / 1ps
`define IM CP0Reg[12][15:10]
`define EXL CP0Reg[12][1]
`define IE CP0Reg[12][0]
`define BD CP0Reg[13][31]
`define IP CP0Reg[13][15:10]
`define ExcCode CP0Reg[13][6:2]
`define EPC CP0Reg[14]
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:25 12/15/2022 
// Design Name: 
// Module Name:    CP0 
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
module CP0(
	input clk, //ʱ��
	input reset,
	input en,
	input [4:0] CP0Add,
	input [31:0] CP0In,
	output [31:0] CP0Out,
	input [31:0] VPC,
	input BDIn,
	input [4:0] ExcCodeIn,
	input [5:0] HWInt,
	input EXClr,
	output [31:0] EPCOut,
	output Req
    );
	//reg [31:0] mem[0:2];//��СΪ��
	
	/***
	�˿�	����	λ��	����
	clk	IN	1	ʱ���źš�
	reset	IN	1	��λ�źš�
	en	IN	1	дʹ���źš�
	CP0Add	IN	5	�Ĵ�����ַ��
	CP0In	IN	32	CP0 д�����ݡ�
	CP0Out	OUT	32	CP0 �������ݡ�
	VPC	IN	32	�ܺ� PC��
	BDIn	IN	1	�Ƿ����ӳٲ�ָ�
	ExcCodeIn	IN	5	��¼�쳣���͡�
	HWInt	IN	6	�����ж��źš�
	EXLClr	IN	1	������λ EXL��
	EPCOut	OUT	32	EPC ��ֵ��
	Req	OUT	1	���봦���������
	***/
	/**
	reg [31:0] SR;
	reg [31:0] Cause;
	reg [31:0] EPC;
	**/
	reg [31:0] CP0Reg [12:15];

	
	integer i;
	initial begin
		for (i = 0; i < 4; i = i + 1) begin
			CP0Reg[i + 12] = 0;
		end
	end
	/***
	SR��State Register��	IM��Interrupt Mask��	15:10	�ֱ��Ӧ�����ⲿ�жϣ���Ӧλ�� 1 ��ʾ�����жϣ��� 0 ��ʾ��ֹ�жϡ�����һ�������Ĺ��ܣ�ֻ��ͨ�� mtc0 ���ָ���޸ģ�ͨ���޸�������������ǿ�������һЩ�жϡ�
	SR��State Register��	EXL��Exception Level��	1	�κ��쳣����ʱ��λ�����ǿ�ƽ������̬��Ҳ���ǽ����쳣������򣩲���ֹ�жϡ�
	SR��State Register��	IE��Interrupt Enable��	0	ȫ���ж�ʹ�ܣ���λ�� 1 ��ʾ�����жϣ��� 0 ��ʾ��ֹ�жϡ�
	Cause	BD��Branch Delay��	31	����λ�� 1 ��ʱ��EPC ָ��ǰָ���ǰһ��ָ�һ��Ϊ��ת��������ָ��ǰָ�
	Cause	IP��Interrupt Pending��	15:10	Ϊ 6 λ�������ж�λ���ֱ��Ӧ 6 ���ⲿ�жϣ���Ӧλ�� 1 ��ʾ���жϣ��� 0 ��ʾ���жϣ�����ÿ�����ڱ��޸�һ�Σ��޸ĵ��������Լ�ʱ�����ⲿ�жϡ�
	Cause	ExcCode	6:2	�쳣���룬��¼��ǰ��������ʲô�쳣��
	EPC	-	-	��¼�쳣�����������Ҫ���ص� PC��
	***/
	//CP0 Ҫ�ɵ��¾��ǽ��յ��ж��쳣ʱ�����Ƿ������䷢��
	always@(posedge clk) begin //״̬ת�ƣ��������д�ˣ��¸����ڲ��ܶ�����
		if (reset) begin
			for (i = 0; i < 4; i = i + 1) begin
				CP0Reg[i + 12] = 0;
			end
		end else begin 
			if (en) begin
				if (CP0Add >= 5'd12 && CP0Add <= 5'd14) begin
					CP0Reg[CP0Add] <= CP0In;
				end else begin
					//(BD) ? CP0Reg[14] - 32'd4 : 
				end
			end 
		
			if (EXClr) begin
				`EXL <= 0;
			end else begin
		
			end
		
			if (Req) begin
				`ExcCode <= ExcCodeIn;
				`BD <= BDIn;
				`EPC <= (Req) ? ((BDIn) ? VPC - 32'd4 : VPC) :
					  `EPC;
				`EXL <= 1'b1;
			end
			`IP <= HWInt; //����
		end
	end
	
	assign CP0Out = (CP0Add == 5'd14) ? CP0Reg[14] :
					    (CP0Add == 5'd13) ? CP0Reg[13] :
						 (CP0Add == 5'd12) ? CP0Reg[12] :
						 32'd0; //err
	assign Req = ((|(HWInt & `IM)) & (`IE) & (!`EXL) ) |
					 ((ExcCodeIn != 0) & (!`EXL));//�жϵ�ǰ�� �������ϳ����
	 
	assign EPCOut = `EPC;//��Ҫ���ص�PC //moore��״̬��
endmodule
