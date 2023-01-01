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
	input clk, //时钟
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
	//reg [31:0] mem[0:2];//大小为三
	
	/***
	端口	方向	位数	解释
	clk	IN	1	时钟信号。
	reset	IN	1	复位信号。
	en	IN	1	写使能信号。
	CP0Add	IN	5	寄存器地址。
	CP0In	IN	32	CP0 写入数据。
	CP0Out	OUT	32	CP0 读出数据。
	VPC	IN	32	受害 PC。
	BDIn	IN	1	是否是延迟槽指令。
	ExcCodeIn	IN	5	记录异常类型。
	HWInt	IN	6	输入中断信号。
	EXLClr	IN	1	用来复位 EXL。
	EPCOut	OUT	32	EPC 的值。
	Req	OUT	1	进入处理程序请求。
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
	SR（State Register）	IM（Interrupt Mask）	15:10	分别对应六个外部中断，相应位置 1 表示允许中断，置 0 表示禁止中断。这是一个被动的功能，只能通过 mtc0 这个指令修改，通过修改这个功能域，我们可以屏蔽一些中断。
	SR（State Register）	EXL（Exception Level）	1	任何异常发生时置位，这会强制进入核心态（也就是进入异常处理程序）并禁止中断。
	SR（State Register）	IE（Interrupt Enable）	0	全局中断使能，该位置 1 表示允许中断，置 0 表示禁止中断。
	Cause	BD（Branch Delay）	31	当该位置 1 的时候，EPC 指向当前指令的前一条指令（一定为跳转），否则指向当前指令。
	Cause	IP（Interrupt Pending）	15:10	为 6 位待决的中断位，分别对应 6 个外部中断，相应位置 1 表示有中断，置 0 表示无中断，将会每个周期被修改一次，修改的内容来自计时器和外部中断。
	Cause	ExcCode	6:2	异常编码，记录当前发生的是什么异常。
	EPC	-	-	记录异常处理结束后需要返回的 PC。
	***/
	//CP0 要干的事就是接收到中断异常时看看是否允许其发生
	always@(posedge clk) begin //状态转移，这个周期写了，下个周期才能读出来
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
			`IP <= HWInt; //更新
		end
	end
	
	assign CP0Out = (CP0Add == 5'd14) ? CP0Reg[14] :
					    (CP0Add == 5'd13) ? CP0Reg[13] :
						 (CP0Add == 5'd12) ? CP0Reg[12] :
						 32'd0; //err
	assign Req = ((|(HWInt & `IM)) & (`IE) & (!`EXL) ) |
					 ((ExcCodeIn != 0) & (!`EXL));//判断当前的 必须马上出结果
	 
	assign EPCOut = `EPC;//需要返回的PC //moore型状态机
endmodule
