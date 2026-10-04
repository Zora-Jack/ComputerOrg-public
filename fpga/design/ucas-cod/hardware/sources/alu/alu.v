`timescale 10 ns / 1 ns

`define DATA_WIDTH 32
`define ALUOP_AND 3'b111
`define ALUOP_OR 3'b110
`define ALUOP_XOR 3'b100
`define ALUOP_ADD 3'b000
`define ALUOP_SUB 3'b001
`define ALUOP_SLT 3'b010
`define ALUOP_SLTU 3'b011

module alu(
	input  [`DATA_WIDTH - 1:0]  A,
	input  [`DATA_WIDTH - 1:0]  B,
	input  [              2:0]  ALUop,
	output                      Overflow,
	output                      CarryOut,
	output                      Zero,
	output [`DATA_WIDTH - 1:0]  Result
);
	
	wire op_and = ALUop == `ALUOP_AND;
	wire op_or = ALUop == `ALUOP_OR;
	wire op_xor = ALUop == `ALUOP_XOR;
	//wire op_nor = ALUop == `ALUOP_NOR;
	wire op_add = ALUop == `ALUOP_ADD;
	wire op_sub = ALUop == `ALUOP_SUB;
	wire op_slt = ALUop == `ALUOP_SLT;
	wire op_sltu = ALUop == `ALUOP_SLTU;
	wire op_minus = op_sub | op_slt | op_sltu;
	wire [31:0] and_res = A & B;
	wire [31:0] or_res = A | B;
	wire [31:0] xor_res = A ^ B;
	//wire [31:0] nor_res = ~(A | B);
	wire [31:0] B_1 = ({32{op_minus}} & (~B)) | ({32{~op_minus}} & B);
	wire [31:0] add_res;
	wire Carry;
	assign {Carry,add_res} = A + B_1 + op_minus;
	assign CarryOut = (op_add&Carry)|(op_sub&~Carry);/*key point*/
	assign Overflow = ((A[31]&B_1[31])&(~add_res[31]))|
			((~A[31])&(~B_1[31]))&add_res[31];/*key point*/
	wire [31:0] slt_res = {31'b0,add_res[31] ^ Overflow};/*key point*/
	wire [31:0] sltu_res = {31'b0,~Carry};
	assign Result = 
		{32{op_and}} & and_res|
		{32{op_or}} & or_res|
		{32{op_xor}} & xor_res|
		{32{op_add}} & add_res|
		{32{op_sub}} & add_res|
		{32{op_slt}} & slt_res|
		{32{op_sltu}} & sltu_res ;
	assign Zero = Result == 32'b0;

endmodule
