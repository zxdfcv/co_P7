
`include "name.v"
module alu(
	input [31:0] A,
	input [31:0] B,
	input [3:0] ALUCtrl,
	output [31:0] result,
	output zero, //不需使用
	output addOverflow,
	output subOverflow
);
	wire [31:0] _swc;
	wire [31:0] _add;
	wire [31:0] _sub;
	//wire addOverflow;
	//wire subOverflow;
	swc swc(.A(A), .B(B), .ans(_swc));
	add add(.A(A), .B(B), .C(_add), .addOverflow(addOverflow));
	sub sub(.A(A), .B(B), .C(_sub), .subOverflow(subOverflow));
	parameter Except = 32'h0000_0000;
	assign result = (ALUCtrl == `ALUCtrl_ADD) ? _add : 
						(ALUCtrl == `ALUCtrl_SUB) ? _sub : 
						(ALUCtrl == `ALUCtrl_OR) ? (A | B) :
						(ALUCtrl == `ALUCtrl_AND) ? (A & B) : //增加功能
						(ALUCtrl == `ALUCtrl_SWC) ? _swc :
						(ALUCtrl == `ALUCtrl_SMALL) ? {31'd0, $signed(A) < $signed(B)} : 
						(ALUCtrl == `ALUCtrl_SMALLU) ? {31'd0, A < B} : 
						Except; //error
	
	assign zero = (A == B);
	//assign Overflow = (addOverflow | subOverflow);
endmodule

module swc(
	input [31:0] A,
	input [31:0] B,
	output reg [31:0] ans
);
	parameter init = 32'd0;
	wire flag = (B[0] == 1'b1) ? 1'b1 : 1'b0;
	wire [4:0] shift = B[4:0]; //确定移位位数
	reg tmp;
	integer i;
	always@(*) begin
		ans = A;
		if (shift == 5'd0) begin
			ans = A;
		end else begin
			case(flag)
				1'b0: begin
				//ans = {A[31 - shift : 0], A[31 : 32 - shift]};//odd
					for (i = 0; i < shift; i = i + 1) begin
						tmp = A[0];
						ans = (ans >> 1);
						ans[31] = tmp;
					end
				end 
				1'b1: begin 
						for (i = 0; i < shift; i = i + 1) begin
						tmp = A[31];
						ans = (ans << 1);
						ans[0] = tmp;
					end
				end
			default: ;
			endcase
		end
	end 
endmodule

module add(
	input [31:0] A,
	input [31:0] B,
	output [31:0] C,
	output addOverflow
);
	wire [32:0] A1 = {A[31], A};
	wire [32:0] B1 = {B[31], B};
	wire [32:0] cnt = A1 + B1;
	assign C = cnt[31:0];
	assign addOverflow = cnt[32] ^ cnt[31]; //不相同就溢出
	
	

endmodule 


module sub(
	input [31:0] A,
	input [31:0] B,
	output [31:0] C,
	output subOverflow

);

	wire [32:0] A1 = {A[31], A}; //拓展位数
	wire [32:0] B1 = {B[31], B};
	wire [32:0] cnt = A1 - B1;
	assign C = cnt[31:0];
	assign subOverflow = cnt[32] ^ cnt[31]; //不相同就溢出
endmodule 