//?��������Ƶ�����ͨ·�ܹ�ͼ�Լ���������ģ�����������˿ڣ��� datapath.v �ж���һЩ�ڲ��� wire �ͱ�����
//����ģ�����߼���ϵ���Ը�������ģ�����ʵ������������һ��
//ʹ֮��Ϊһ�����壬���Ԥ�����������źŵ����������˿ڼ��ɡ�

//��仰�൱��Ҫ
`include "name.v"

module datapath(
	 input clk,
    input reset,
	 input [31:0] i_inst_rdata,
	 input [31:0] m_data_rdata,	//I	���ݴ洢���洢����Ӧ����
	 input [5:0] HWInt,
	 output [31:0] i_inst_addr, //IF����ַ
	 output [31:0] m_data_addr,	 //O ��д��/���������ݴ洢����Ӧ��ַ
    output [31:0] m_data_wdata,	//O	��д�����ݴ洢����Ӧ����
	 output [3:0] m_data_byteen,	//O	��λ�ֽ�ʹ��
	 output [31:0] m_inst_addr, //O	M �� PC
	 
	 output w_grf_we, //GRF����
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr
);
	//EXCEPTION
	wire Req;
	
	//
	parameter init = 32'h0000_0000;
	
	wire cmp;//�ȽϽ��
	wire [3:0] CMPMode;
	
	wire [31:0] IFPC;
	wire [31:0] IFPC_4;//+4��PC
	wire [31:0] IFPC_8;
	wire [31:0] IFNextPC;
	wire [31:0] IFIR;
	wire IFAdEL_1;//�쳣�����ź� //instruction err
	
	wire [31:0] IDPC;
	wire [31:0] IDPC_8;
	wire [31:0] IDIR;
	wire [31:0] IDRD1;
	wire [31:0] IDRD2;
	wire [31:0] IDImm;
	wire [1:0] PCSrc;//�����źŲ���Ҫ��ˮǰ�治����ˮ�߼Ĵ�������
	wire [1:0] IDRD1Sel;
	wire [1:0] IDRD2Sel;
	//wire [31:0] CMPAF;//ѡ�����ź�
	//wire [31:0] CMPBF;
	wire [1:0] ExtOp;
	//wire [1:0] NPCRD1Sel;
	//wire [31:0] NPCRD1F;
	wire [31:0] IDRD1F;
	wire [31:0] IDRD2F;
	wire IDMULDIV_Type;
	wire IDJUMP;
	wire [31:0] ID$spM4;
	wire IDjap;
	wire IDRI;
	wire IDAdEL_1;
	wire IDSyscall;
	wire IDeret;
	wire BDGEN;
	wire IDBD;
	
	wire [31:0] EXPC_8;
	wire [31:0] EXPC;
	wire [31:0] EXIR;
	wire [31:0] EXRD1;
	wire [31:0] EXRD2;
	wire [31:0] EXImm;//EX��չ����������
	wire [1:0] ALUSrc;
	wire [3:0] ALUCtrl;
	wire [31:0] ALUB;
	wire [1:0] EXRD1Sel;
	wire [1:0] EXRD2Sel;
	wire [31:0] EXALUOut;
	wire EXRegWrite;
	wire [4:0] EXA3;
	wire [1:0] EXtnew;
	wire [3:0] EXMemtoReg;
	wire [31:0] EXRD1F;
	wire [31:0] EXRD2F;
	wire [31:0] EXMULDIVOut;
	wire [3:0] MULDIVMode;
	wire HILOSel;
	wire Busy;
	wire Start;
	wire EXBD;
	
	wire addOverflow;
	wire subOverflow;
	wire [31:0] EX$spM4;
	wire EXjap;
	wire EXRI;
	wire EXAdEL_2;//EX EXCEPTION
	wire EXAdES;
	wire EXAdEL_1;
	wire EXOv;
	wire EXSyscall;
	
	wire EXJUMP;
	wire EXlwbti;
	wire EXlw;
	wire EXlh;
	wire EXlb;
	wire EXsw;
	wire EXsh;
	wire EXsb;
	wire EXadd;
	wire EXsub;
	wire EXaddi;
	wire EXmtc0;
		
	wire [31:0] MEMPC_8;
	wire [31:0] MEMPC;
	wire [31:0] MEMIR;
	wire [31:0] MEMRD2;
	wire [31:0] MEMRD1;
	wire [1:0] MEMRD1Sel;//backup
	wire [1:0] MEMRD2Sel;//д��DM������
	wire [31:0] MEMALUOut; //����������Ҫ������ˮ������ѡ��
	wire [31:0] MEMRD;
	wire MemWrite;
	wire MEMRegWrite;
	wire [4:0] MEMA3;
	wire [1:0] MEMtnew;
	wire [3:0] MEMMemtoReg;
	wire [31:0] MEMRD2F;//�����滻����ȷ��
	wire [31:0] MEMRD1F;
	wire [3:0] DMMode;
	wire [31:0] MEMMULDIVOut;
	//����ѡ���RD2
	wire MEMJUMP;
	wire MEMlwbti;
	wire [31:0] MEM$spM4;
	wire MEMjap;
	wire MEMAdEL_1;
	wire MEMAdEL_2;
	wire MEMAdEL;
	wire MEMAdES;
	wire MEMOv;
	wire MEMRI;
	wire MEMSyscall;
	wire MEMmtc0;
	wire MEMeret;
	wire [31:0] MEMCP0Out;
	wire [31:0] EPCOut;
	wire [4:0] ExcCodeIn;
	wire MEMBD;
	
	wire [31:0] WBPC;
	wire [31:0] WBPC_8;
	wire [31:0] WBIR;//Instr
	wire [31:0] WBALUOut;
	wire [31:0] WBRD;//memdataout
	wire [31:0] WD;//����д������
	wire [4:0] WBA3;
	wire [3:0] WBMemtoReg;
	wire WBRegWrite;
	wire [1:0] WBtnew;
	wire [31:0] WBMULDIVOut;
	wire WBJUMP;
	wire [31:0] WB$spM4;
	wire [31:0] WBRD2;
	wire WBjap;
	wire WBBD;
	wire [31:0] WBCP0Out;
 	
	wire Stalk; //��ͣ�ź�
	wire [1:0] tuse_rs;
	wire [1:0] tuse_rt;
	
	//ת��������ѡ��
	wire [31:0] EXTRSrc;
	wire [31:0] MEMTRSrc;
	//��������ת����Ŀ�Ĳ�Ӧ���ǽ���Ϊģ���ṩ��ȷ���ݣ���Ӧ�ǰ� rsOut �� rtOut ������ȷ��
	
	
	//I preprocess 
	assign IFIR = i_inst_rdata;//���� //IM
	//assign MEMRD = m_data_rdata;
	//O
	assign i_inst_addr = IFPC; 
	assign m_data_addr =  (MEMjap) ?  MEMRD1F : MEMALUOut;//DM
	//assign m_data_wdata = MEMRD2F;
	//assign m_data_byteen = DMMode;//��λ�ֽ�ʹ��
	assign m_inst_addr = MEMPC;//M �� PC
	assign w_grf_we = WBRegWrite; //WB write enable
	assign w_grf_addr = WBA3; // WB write addr
	assign w_grf_wdata = WD;//WB write Data
	assign w_inst_addr = WBPC;//PC
	
	//�����ⲿ ����ʵ�ʾ���MEMģ��
	BE BE(
	.RD2(MEMRD2F),
	.Req(Req),
	.MEMPC_8(MEMPC_8),
	.jap(MEMjap),
	.RD1(MEMRD1F),
	.MemWrite(MemWrite), //I
	.MEMALUOut(MEMALUOut), //I
	.DMMode(DMMode),
	.m_data_rdata(m_data_rdata),
	.m_data_byteen(m_data_byteen), //O
	.MEMRD(MEMRD), //O
	.m_data_wdata(m_data_wdata)
	);
	
	mux16 mux16EXTRSrc( //ѡ���źſ����ø�����MemtoRegʵ��
		.x0(init),
		.x1(init),
		.x2(EXPC_8),
		.x3(init),
		.x4(EX$spM4),
		.x5(init),
		.sel(EXMemtoReg),
		.result(EXTRSrc)
	); //��ǰ���� source��ѡ��
	mux16 mux16MEMTRSrc(
		.x0(MEMALUOut),
		.x1(init),
		.x2(MEMPC_8),
		.x3(MEMMULDIVOut),
		.x4(MEM$spM4),
		.x5(init),
		.sel(MEMMemtoReg),
		.result(MEMTRSrc)//ת����ѡ��
	);

	PCcalculate PCcalculate( //�в�ȷ��������������Ⱥ�
	.PC(IDPC),
	.Instr(IDIR),
	.order(IFPC_4),
	.Imm(IDImm), 
	.RD1(IDRD1F), //IF������ID����PC
	.EPCOut(EPCOut),
	.cmp(cmp), 
	.PCSrc(PCSrc),
	.NextPC(IFNextPC),
	.eret((IDeret)) //IF
	);//�ֲ�ʽ��������ź�������ˮ
	
	pc pc(
	.clk(clk), 
	.reset(reset), 
	.Req(Req),
	.next_pc(IFNextPC), 
	.Stalk(Stalk),
	.pc(IFPC)
	);
	
	adder IFadder_4(
	.A(IFPC),
	.B(32'h0000_0004),
	.out(IFPC_4)
	);//generate IFPC_4
	
	adder IFadder_8(
	.A(IFPC),
	.B(32'h0000_0008),
	.out(IFPC_8)
	);//generate IFPC_8
	
	//�ļ���ˮ�߼Ĵ���->�弶��ˮ��
	assign IFAdEL_1 = (((IFPC & 32'd3)!= 0) | (IFPC < 32'h0000_3000) | (IFPC > 32'h0000_6ffc)); //�������������ˮ��ȡָ�쳣��1
	
	//ID
	DecodeReg UutDecodeReg(
	.clk(clk),
	.reset(reset),
	.NextIDIR(IFIR),
	.NextIDPC_8(IFPC_8),
	.NextIDPC(IFPC),
	.NextIDAdEL_1(IFAdEL_1),
	.NextIDBD(BDGEN),
	.Stalk(Stalk),
	.Req(Req),
	.eret(IDeret),//���PC
	.IDIR(IDIR),
	.IDPC_8(IDPC_8),//��һ�׶ε�������� ��������չ
	.IDPC(IDPC),
	.IDAdEL_1(IDAdEL_1),
	.IDBD(IDBD)
	//������ˮ�߼Ĵ��������ṩ���ݵ���ˮ���ļ���������� D ����ˮ�߼Ĵ�����ǰһ��Ϊ F ��������һ��Ϊ D ����
    );
	 
	 //GRF�����г� ->�漰ID��WB
	grf GRF(
	.clk(clk),
	.reset(reset),
	.WE(WBRegWrite),
	.A1(IDIR[25:21]),
	.A2(IDIR[20:16]),
	.A3(WBA3),
	.WD(WD),
	.pc(WBPC),
	.RD1(IDRD1), 
	.RD2(IDRD2)
	);
	
	controller controllerDe(
	.cmp(cmp),
	.Instr(IDIR), //ע����ID��ָ��
	.PCSrc(PCSrc),
	.ExtOp(ExtOp),
	.CMPMode(CMPMode),
	.Level(`Level_ID),
	.tuse_rs(tuse_rs),
	.tuse_rt(tuse_rt),
	.MULDIV_Type(IDMULDIV_Type),
	.JUMPOut(IDJUMP),
	.jap(IDjap),
	.Syscall(IDSyscall), //
	.RI(IDRI), //two exception signals
	.eret(IDeret),
	.BD(BDGEN)
	);
	
	mux4 mux4IDRD1Sel(
	.x0(IDRD1),
	.x1(WD), //����ԽС�����ȼ�Խ��
	.x2(MEMTRSrc),//MEM������ALUOut��RD
	.x3(EXTRSrc),
	.sel(IDRD1Sel),
	.result(IDRD1F)
	);
	

	mux4 mux4IDRD2Sel(
	.x0(IDRD2), //���ȼ��ӵ͵���
	.x1(WD),
	.x2(MEMTRSrc),//MEM������ALUOut��RD
	.x3(EXTRSrc),
	.sel(IDRD2Sel), 
	.result(IDRD2F)
	);
	
	Comparator Comparator(
	.A(IDRD1F), 
	.B(IDRD2F), 
	.CMPMode(CMPMode),
	.cmp(cmp)
	);
	
	extender EXT(
	.Instr(IDIR),
	.IDPC(IDPC), //�������㣨��Ȼʹ��ʱ�����
	.ExtOp(ExtOp), //Mode ѡ��
	.out(IDImm) //also u
   );//ͨ����
	
	adder adder$sp(
		.A(IDRD1F),
		.B(-32'd4),
		.out(EX$spM4)
	);
	//EX
	//Exception
	assign EXAdEL_2 = (EXlw & ((EXALUOut & 32'd3) != 0)) | 
							(EXlh & ((EXALUOut & 32'd1) != 0) ) | //lh
							((EXlh | EXlb) & ((EXALUOut >= 32'h0000_7f00 & EXALUOut <= 32'h000_7f0b) | (EXALUOut >= 32'h0000_7f10 & EXALUOut <= 32'h0000_7f1b))) |
							((EXlw | EXlh | EXlb) & (addOverflow)) | //��Ͼ���ָ�������
							((EXlw | EXlh | EXlb) & (!(EXALUOut >= 32'h0000_7f00 & EXALUOut <= 32'h0000_7f0b) & !(EXALUOut >= 32'h0000_7f10 & EXALUOut <= 32'h0000_7f1b) & !(EXALUOut >= 32'h0000_0000 & EXALUOut <= 32'h0000_2fff) & !(EXALUOut >= 32'h0000_7f20 & EXALUOut <= 32'h0000_7f23)));
						
	assign EXAdES = (EXsw & ((EXALUOut & 32'd3) != 0) )|
						 (EXsh & ((EXALUOut & 32'd1) != 0) ) |
						 ((EXsh | EXsb) & ((EXALUOut >= 32'h0000_7f00 & EXALUOut <= 32'h000_7f0b) | (EXALUOut >= 32'h0000_7f10 & EXALUOut <= 32'h0000_7f1b))) |
						 ((EXsw | EXsh | EXsb) & (addOverflow)) |
						 ((EXsw | EXsh | EXsb) & ((EXALUOut >= 32'h0000_7f08 & EXALUOut <=32'h0000_7f0b) | (EXALUOut >= 32'h0000_7f18 & EXALUOut <= 32'h0000_7f1b))) | 
						 ((EXsw | EXsh | EXsb) & (!(EXALUOut >= 32'h0000_7f00 & EXALUOut <= 32'h0000_7f0b) & !(EXALUOut >= 32'h0000_7f10 & EXALUOut <= 32'h0000_7f1b) & !(EXALUOut >= 32'h0000_0000 & EXALUOut <= 32'h0000_2fff) & !(EXALUOut >= 32'h0000_7f20 & EXALUOut <= 32'h0000_7f23)));
	assign EXOv = ((EXadd | EXaddi) & (addOverflow)) |
					  ((EXsub) & (subOverflow));
	ExecuteReg UutExecuteReg(
	.clk(clk),
	.reset(reset),
	.NextEXPC(IDPC),
	.NextEXPC_8(IDPC_8),
	.NextEXIR(IDIR),
	
	.NextEXImm(IDImm),
	.NextEXRD1(IDRD1F),
	.NextEXRD2(IDRD2F), //֮������ȷ������ RD1��RD2ǧ���д��
	.NextEXJUMP(IDJUMP),
	.NextEX$spM4(ID$spM4),
	.NextEXAdEL_1(IDAdEL_1),
	.NextEXRI(IDRI),
	.NextEXSyscall(IDSyscall),
	.NextEXBD(IDBD),
	.Stalk(Stalk),
	.Req(Req),
	
	.EXPC(EXPC),
	.EXPC_8(EXPC_8),
	.EXIR(EXIR),	
	.EXImm(EXImm),
	.EXRD1(EXRD1),
	.EXRD2(EXRD2),
	.EXJUMP(EXJUMP),
	.EX$spM4(EX$spM4),
	.EXAdEL_1(EXAdEL_1),
	.EXRI(EXRI),
	.EXSyscall(EXSyscall),
	.EXBD(EXBD)
   );

	controller controllerEx(
	.JUMP(EXJUMP),
	.cmp(cmp),
	.Instr(EXIR),
	.RegWrite(EXRegWrite),
	.ALUSrc(ALUSrc),
	.ALUCtrl(ALUCtrl),
	.Level(`Level_EX),
	.tnew(EXtnew),
	.A3(EXA3),
	.MemtoReg(EXMemtoReg),
	.MULDIVMode(MULDIVMode),
	.HILOSel(HILOSel),
	.lwbti(EXlwbti),
	.jap(EXjap),
	.lw(EXlw),
	.lh(EXlh),
	.lb(EXlb),
	.sw(EXsw),
	.sh(EXsh),
	.sb(EXsb),
	.add(EXadd),
	.sub(EXsub),
	.addi(EXaddi),
	.mtc0(EXmtc0)
	);
	
	mux4 mux4EXRD1Sel(
	.x0(EXRD1),
	.x1(WD), //��CMP��һ���� but NPC is quite different, need a new type of coding
	.x2(MEMTRSrc), //MEM������ALUOut��RD
	.x3(init),
	.sel(EXRD1Sel),
	.result(EXRD1F)
	);
	
	mux4 mux4EXRD2Sel(
	.x0(EXRD2),
	.x1(WD),
	.x2(MEMTRSrc),//MEM������ALUOut��RD
	.x3(init),
	.sel(EXRD2Sel),
	.result(EXRD2F)
	);
	
	mux4 mux4_ALUSrc(
	.x0(EXRD2F),
	.x1(EXImm),
	.x2(init),
	.x3(init), //��ʱ����
	.sel(ALUSrc),
	.result(ALUB)
	);
	
	alu ALU(
	.A(EXRD1F),
	.B(ALUB),
	.ALUCtrl(ALUCtrl),
	.result(EXALUOut),
	.addOverflow(addOverflow),
	.subOverflow(subOverflow)
	);
	
	muldiv MULDIV(
	.A(EXRD1F),
	.B(ALUB), //�ӿڴ󲿷�ͬALU
	.mode(MULDIVMode),
	.HILOSel(HILOSel),
	.clk(clk),
	.reset(reset),
	.out(EXMULDIVOut),
	.Busy(Busy),
	.Start(Start),
	.Req(Req)
);
	
	//MEM //���PC MEMlevel
	//CP0
	assign MEMAdEL = (MEMAdEL_1 || MEMAdEL_2);
	assign ExcCodeIn = (|HWInt) ? 0 ://����
							 (MEMAdEL_1) ? `ExcCode_AdEL : //IF
							 (MEMRI) ? `ExcCode_RI : //ID
							 (MEMSyscall) ? `ExcCode_Syscall : //ID
							 (MEMAdEL_2) ? `ExcCode_AdEL : //�и����ȼ����� //EX
							 (MEMAdES) ? `ExcCode_AdES : //EX
							 (MEMOv) ? `ExcCode_Ov : //EX
							 0;//werror
	CP0 CP0(
		.clk(clk), //ʱ��
		.reset(reset),//
		.en(MEMmtc0),//mtc0д�Ĵ���
		.CP0Add(MEMIR[15:11]),//
		.CP0In(MEMRD2F), //GPR[rt]
		.CP0Out(MEMCP0Out),//
		.VPC(MEMPC),//
		.BDIn(MEMBD),//ǰһ��ָ��
		.ExcCodeIn(ExcCodeIn),//
		.HWInt(HWInt),//
		.EXClr(MEMeret), //��⵽����ָ��
		.EPCOut(EPCOut),
		.Req(Req)
	);

	MemoryReg UutMemoryReg(
	.clk(clk),
	.reset(reset),
	.NextMEMALUOut(EXALUOut),
	.NextMEMPC_8(EXPC_8),
	.NextMEMPC(EXPC),
	.NextMEMIR(EXIR),
	.NextMEMRD2(EXRD2F),
	.NextMEMRD1(EXRD1F),
	.NextMEMMULDIVOut(EXMULDIVOut),
	.NextMEMJUMP(EXJUMP),
	.NextMEM$spM4(EX$spM4),
	.NextMEMAdEL_1(EXAdEL_1),
	.NextMEMAdEL_2(EXAdEL_2),
	.NextMEMAdES(EXAdES),
	.NextMEMOv(EXOv),
	.NextMEMRI(EXRI),
	.NextMEMSyscall(EXSyscall),
	.NextMEMBD(EXBD),
	.Req(Req),
	
	.MEMPC_8(MEMPC_8),
	.MEMPC(MEMPC),
	.MEMIR(MEMIR),
	.MEMRD2(MEMRD2),
	.MEMRD1(MEMRD1),
	.MEMALUOut(MEMALUOut),
	.MEMMULDIVOut(MEMMULDIVOut),
	.MEMJUMP(MEMJUMP),
	.MEM$spM4(MEM$spM4),
	.MEMAdEL_1(MEMAdEL_1),
	.MEMAdEL_2(MEMAdEL_2),
	.MEMAdES(MEMAdES),
	.MEMOv(MEMOv),
	.MEMRI(MEMRI),
	.MEMSyscall(MEMSyscall),
	.MEMBD(MEMBD)
   );
	

	controller controllerMem(
	.cmp(cmp),
	.JUMP(MEMJUMP),
	.Instr(MEMIR), //IR : Instr
	.RegWrite(MEMRegWrite),
	.MemWrite(MemWrite),
	.Level(`Level_MEM),
	.tnew(MEMtnew),
	.A3(MEMA3),
	.MemtoReg(MEMMemtoReg),
	.DMMode(DMMode),
	.lwbti(MEMlwbti),
	.jap(MEMjap),
	.mtc0(MEMmtc0),
	.eret(MEMeret)
	);
	
	mux4 mux4_MEMRD2Sel(//only data in WB will help
	.x0(MEMRD2),
	.x1(WD), //WB//MEM������ALUOut��RD
	//.x2(IDRD2),
	.x2(init),//�����е�С����
	.x3(init),
	.sel(MEMRD2Sel), //��ϰP5����ͣת��
	.result(MEMRD2F)
	);
	
	mux4 mux4_MEMRD1Sel(//only data in WB will help
	.x0(MEMRD1),
	.x1(WD), //WB//MEM������ALUOut��RD
	//.x2(IDRD2),
	.x2(init),//�����е�С����
	.x3(init),
	.sel(MEMRD1Sel), //��ϰP5����ͣת��
	.result(MEMRD1F)
	);
	
	//WB
	WriteBackReg UutWriteReg(
	.clk(clk),
	.reset(reset),
	.NextWBIR(MEMIR),
	.NextWBRD(MEMRD),
	.NextWBPC(MEMPC),
	.NextWBPC_8(MEMPC_8),
	.NextWBALUOut(MEMALUOut),
	.NextWBMULDIVOut(MEMMULDIVOut),
	.NextWBJUMP(MEMJUMP),
	.NextWB$spM4(MEM$spM4),
	.NextWBRD2(MEMRD2),
	.NextWBCP0Out(MEMCP0Out),
	.Req(Req),
	.WBIR(WBIR),
	.WBRD(WBRD),
	.WBPC(WBPC),
	.WBPC_8(WBPC_8),
	.WBALUOut(WBALUOut),
	.WBMULDIVOut(WBMULDIVOut), //��ˮ����
	.WBJUMP(WBJUMP),
	.WB$spM4(WB$spM4),
	.WBRD2(WBRD2),
	.WBCP0Out(WBCP0Out)
   );
	controller controllerWB(
	.cmp(cmp),
	.JUMP(WBJUMP),
	.RD(WBRD), //MEM�����Ľ��
	.RD2(WBRD2),
	.Instr(WBIR),
	.RegWrite(WBRegWrite), //WE
	.MemtoReg(WBMemtoReg),//sel
	.A3(WBA3),//WBA3
	.Level(`Level_WB),
	.tnew(WBtnew),
	.jap(WBjap)
	);
	
	mux16 mux16_MemtoReg( //generateWriteData //modified
	.x0(WBALUOut),
	.x1(WBRD),
	.x2(WBPC_8),
	.x3(WBMULDIVOut), //ѡ���ת��
	.x4(WB$spM4),
	.x5(WBCP0Out), //ת������������ˮ�߼Ĵ���
	.sel(WBMemtoReg), //��дMemtoReg Selection
	.result(WD)
	);
	
	//ð�մ���ģ�飺ת������ͣ
	Hcontroller Hcontroller(
	.IDInstr(IDIR),
	.EXInstr(EXIR),
	.MEMInstr(MEMIR),
	.WBInstr(WBIR),
	
	.EXRegWrite(EXRegWrite),
	.MEMRegWrite(MEMRegWrite),
	.WBRegWrite(WBRegWrite),
	
	.EXA3(EXA3),
	.MEMA3(MEMA3),
	.WBA3(WBA3),
	
	.EXtnew(EXtnew),
	.MEMtnew(MEMtnew),
	.WBtnew(WBtnew), //tnew = 2'b00���ϲ��������ݣ���������û�й����ԣ�����û��������
	.IDMULDIV_Type(IDMULDIV_Type),
	.EXlwbti(EXlwbti),
	.MEMlwbti(MEMlwbti),
	.EXmtc0(EXmtc0),
	.MEMmtc0(MEMmtc0),
	.IDeret(IDeret),
	.Busy(Busy),
	.Start(Start),
	
	.IDRD1Sel(IDRD1Sel),
	.IDRD2Sel(IDRD2Sel),
	.EXRD1Sel(EXRD1Sel),
	.EXRD2Sel(EXRD2Sel),
	.MEMRD2Sel(MEMRD2Sel),
	.MEMRD1Sel(MEMRD1Sel),
	//.NPCRD1Sel(NPCRD1Sel),
	.Stalk(Stalk),
	.tuse_rs(tuse_rs),
	.tuse_rt(tuse_rt)
);

endmodule
