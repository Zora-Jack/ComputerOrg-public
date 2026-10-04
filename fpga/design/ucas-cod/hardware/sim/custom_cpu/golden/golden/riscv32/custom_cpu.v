`timescale 10ns / 1ns

`define LUI 7'b0110111
`define AUIPC 7'b0010111
`define JAL 7'b1101111
`define JALR 7'b1100111
`define U_type 3'b011
`define J_type 1'b1
`define L_type 2'b00
`define S_type 2'b10
`define I_type 2'b01
`define R_type 2'b11
`define SUB 2'b01

module custom_cpu_golden(
	input         clk,
	input         rst,

	//Instruction request channel
	output [31:0] PC,
	output        Inst_Req_Valid,
	input         Inst_Req_Ready,

	//Instruction response channel
	input  [31:0] Instruction,
	input         Inst_Valid,
	output        Inst_Ready,

	//Memory request channel
	output [31:0] Address,
	output        MemWrite,
	output [31:0] Write_data,
	output [ 3:0] Write_strb,
	output        MemRead,
	input         Mem_Req_Ready,

	//Memory data response channel
	input  [31:0] Read_data,
	input         Read_data_Valid,
	output        Read_data_Ready,

	output [69:0] inst_retire
);

/* The following signal is leveraged for behavioral simulation, 
* which is delivered to testbench.
*
* STUDENTS MUST CONTROL LOGICAL BEHAVIORS of THIS SIGNAL.
*
* inst_retired (70-bit): detailed information of the retired instruction,
* mainly including (in order) 
* { 
*   reg_file write-back enable  (69:69,  1-bit),
*   reg_file write-back address (68:64,  5-bit), 
*   reg_file write-back data    (63:32, 32-bit),  
*   retired PC                  (31: 0, 32-bit)
* }
*
*/
  //wire [69:0] inst_retire;

// TODO: Please add your custom CPU code here
	wire			RF_wen;
	wire [4:0]		RF_waddr;
	wire [31:0]		RF_wdata;

	// TODO: PLEASE ADD YOUR CODE BELOW
	//define state machine
	//decode the basic function

	localparam S_INIT = 12'b0000_0000_1000;
	localparam S_IF = 12'b0000_0000_0001;
	localparam S_ID = 12'b0000_0000_0010;
	localparam S_EX = 12'b0000_0000_0100;
	//localparam S_MEM = 12'b0000_0000_1000;
	localparam S_WB = 12'b0000_0001_0000;
	localparam S_BRANCH = 12'b0000_0010_0000;
	localparam S_JAL = 12'b0000_0100_0000;
	localparam S_JALR = 12'b0000_1000_0000;
	localparam S_ST = 12'b0001_0000_0000;
	localparam S_LD = 12'b0010_0000_0000;
	localparam S_RDW = 12'b0100_0000_0000;
	localparam S_IW = 12'b1000_0000_0000;


	reg[11:0] current_state;
	reg[11:0] next_state;

	reg[31:0] IR;
	reg[31:0] OldPC;
	reg[31:0] A_reg;
	reg[31:0] B_reg;
	reg[31:0] pc_reg;
	reg[31:0] Imm_reg;
	reg[31:0] Res;
	reg[31:0] MDR;

	assign PC = pc_reg;

	wire [31:0] Address_r;
	wire        MemWrite_r;
	wire [31:0] Write_data_r;
	wire [3:0]  Write_strb_r;
	wire        MemRead_r;
	wire	   RF_wen_r;
	wire [4:0]  RF_waddr_r;
	wire [31:0] RF_wdata_r;
	wire	   Inst_Req_Valid_r;
	wire	   Inst_Ready_r;
	wire	   Read_data_Ready_r;



	assign Address    = Address_r;
	assign MemWrite   = MemWrite_r;
	assign Write_data = Write_data_r;
	assign Write_strb = Write_strb_r;
	assign MemRead    = MemRead_r;
	assign RF_wen     = RF_wen_r;
	assign RF_waddr   = RF_waddr_r;
	assign RF_wdata   = RF_wdata_r;
	assign Inst_Req_Valid = Inst_Req_Valid_r;
	assign Inst_Ready = Inst_Ready_r;
	assign Read_data_Ready = Read_data_Ready_r;


	wire [6:0]	opcode = IR[6:0];
	
	wire Lui = opcode==`LUI;
	wire Auipc = opcode==`AUIPC;
	wire Jal = opcode==`JAL;
	wire Jalr = opcode==`JALR;
	wire J = (opcode[6]==`J_type)&(opcode[2:0]==`U_type);
	wire L = (opcode[5:4]==`L_type)&(opcode[2:0]==`U_type);
	wire S = (~(opcode[6]==`J_type))&(opcode[5:4]==`S_type)&(opcode[2:0]==`U_type);
	wire I = (opcode[5:4]==`I_type)&(opcode[2:0]==`U_type);
	wire R = (opcode[5:4]==`R_type)&(opcode[2:0]==`U_type);

	wire [4:0]	rd = IR[11:7];
	wire [2:0]	funct3 = IR[14:12];
	wire [4:0]	rs1 = IR[19:15];
	wire [4:0]	rs2 = IR[24:20];


	//expand the width of number to 32 while decoding.
	wire [31:0] imm32 = {IR[31:12],12'b0};
	wire [31:0] imm20 = {{12{IR[31]}},
						 IR[19:12],
						 IR[20],
						 IR[30:21],
						 1'b0};
	wire [31:0] imm121 = {{20{IR[31]}},
						 IR[7],
						 IR[30:25],
						 IR[11:8],
						 1'b0};
	wire [31:0] imm122 = {{20{IR[31]}}, IR[31:20]};
	wire [31:0] imm123 = {{20{IR[31]}},
						 IR[31:25],
						 IR[11:7]};
	wire [4:0] shamt = IR[24:20];

	
	//L/S
	wire [1:0] add = Res[1:0];
	wire [3:0] store_strb = (funct3==3'b000&&add[1:0]==2'b00) ? (4'b0001):
				(funct3==3'b000&&add[1:0]==2'b01) ? (4'b0010):
				(funct3==3'b000&&add[1:0]==2'b10) ? (4'b0100):
				(funct3==3'b000&&add[1:0]==2'b11) ? (4'b1000):
				(funct3==3'b001&&add[1:0]==2'b00) ? (4'b0011):
				(funct3==3'b001&&add[1:0]==2'b10) ? (4'b1100):
				(funct3==3'b010) ? 4'b1111 : 4'b0;
	
	wire [31:0] store_wdata = (funct3==3'b000&&add[1:0]==2'b00) ? {24'b0, B_reg[7:0]}:
				(funct3==3'b000&&add[1:0]==2'b01) ? {16'b0, B_reg[7:0], 8'b0}:
				(funct3==3'b000&&add[1:0]==2'b10) ? {8'b0,  B_reg[7:0], 16'b0}:
				(funct3==3'b000&&add[1:0]==2'b11) ? {B_reg[7:0], 24'b0}:
				(funct3==3'b001&&add[1:0]==2'b00) ? {16'b0, B_reg[15:0]}:
				(funct3==3'b001&&add[1:0]==2'b10) ? {B_reg[15:0], 16'b0}:
				(funct3==3'b010) ? B_reg :32'b0;
	
	wire [31:0] Ldata = (add[1:0]==2'b00) ? MDR[31:0] :
    				(add[1:0]==2'b01) ? {8'b0, MDR[31:8]} :
    				(add[1:0]==2'b10) ? {16'b0, MDR[31:16]} :{24'b0, MDR[31:24]};

	wire [31:0] load_wdata = 
		(L==1 && funct3==3'b000) ? {{24{Ldata[7]}}, Ldata[7:0]}:
		(L==1 && funct3==3'b001) ? {{16{Ldata[15]}}, Ldata[15:0]}:
		(L==1 && funct3==3'b010) ? MDR:
		(L==1 && funct3==3'b100) ? {{24{1'b0}}, Ldata[7:0]}:
		(L==1 && funct3==3'b101) ? {{16{1'b0}}, Ldata[15:0]} : 32'b0;
	
	//I/R ALU&Shifter
	wire [4:0] Raddr1 = (Jalr||J||L||S||I||R)?rs1:5'b0;
	wire [4:0] Raddr2 = (J||S||R)?rs2:5'b0;
	wire [31:0] Rdata1;
	wire [31:0] Rdata2;
	wire [31:0] AResult;
	wire [31:0] SResult;
	wire [31:0] AA;
	wire [31:0] AB;
	wire [31:0] SA;
	wire [31:0] SB;
	wire [2:0] ALUop;
	wire [1:0] Shiftop;
	wire Zero;

	
	assign ALUop =
		(current_state == S_IF) ? 3'b000 :
		(current_state == S_ID) ? 3'b000 :
		(current_state == S_JAL) ? 3'b000 :
		(current_state == S_JALR) ? 3'b000 :

		(current_state == S_BRANCH && (funct3 == 3'b000 || funct3 == 3'b001)) ? 3'b001 :
		(current_state == S_BRANCH && (funct3 == 3'b100 || funct3 == 3'b101)) ? 3'b010 :
		(current_state == S_BRANCH && (funct3 == 3'b110 || funct3 == 3'b111)) ? 3'b011 :

		(current_state == S_EX && (L || S || Auipc)) ? 3'b000 :
		(current_state == S_EX && R && funct3 == 3'b000 && IR[30]) ? 3'b001 :
		(current_state == S_EX) ? funct3 :

		3'b000;

	assign  Shiftop = (funct3==3'b001) ? 2'b00 :
    				(IR[30]) ? 2'b11 : 2'b10;


	assign AA =
		(current_state == S_IF) ? pc_reg :

		(current_state == S_ID && J) ? OldPC :

		(current_state == S_EX && Auipc) ? OldPC :
		(current_state == S_EX && (L || S || I || R)) ? A_reg :

		(current_state == S_BRANCH) ? A_reg :

		(current_state == S_JAL) ? OldPC :
		(current_state == S_JALR) ? A_reg :
		32'b0;

	assign AB =
		(current_state == S_IF) ? 32'd4 :

		(current_state == S_ID && J) ? imm121 :

		(current_state == S_EX && Auipc) ? imm32 :
		(current_state == S_EX && L) ? imm122 :
		(current_state == S_EX && S) ? imm123 :
		(current_state == S_EX && I) ? imm122 :
		(current_state == S_EX && R) ? B_reg :

		(current_state == S_BRANCH) ? B_reg :

		(current_state == S_JAL) ? imm20 :
		(current_state == S_JALR) ? imm122 :

		32'b0;

	assign SA = (I||R) ? A_reg : 32'b0;
	assign SB = (I==1) ? {27'b0, shamt} : {27'b0, B_reg[4:0]}; 


	//J:update the PC reg
	wire J_yes;

	assign J_yes = J && (
		((funct3==3'b000) && (Zero==1'b1)) ||
		((funct3==3'b001) && (Zero==1'b0)) ||
		(((funct3==3'b100) || (funct3==3'b110)) &&
		(AResult == {{31{1'b0}},1'b1})) ||
		(((funct3==3'b101) || (funct3==3'b111)) &&
		(AResult == {32{1'b0}}))
		);
			

	//first part:current state change
	always @(posedge clk) begin
		if (rst)
			current_state<=S_INIT;
		else
			current_state<=next_state;
	end

	//second part:next state change
	always @(*) begin
		case (current_state)
			S_INIT:begin
				next_state = S_IF;
			end
			S_IF:begin
				if (Inst_Req_Ready)
					next_state = S_IW;
				else
					next_state = S_IF;
			end

			S_IW:begin
				if (Inst_Valid)
					next_state = S_ID;
				else 
					next_state = S_IW;
			end
			S_ID:begin
				if (J)
					next_state = S_BRANCH;
				else if (Jal)
					next_state = S_JAL;
				else if (Jalr)
					next_state = S_JALR;
				else
					next_state = S_EX;	
			end

			S_EX:begin 
				if (L)
					next_state = S_LD;
				else if (S)
					next_state = S_ST;
				else 
					next_state = S_WB;
			end

			S_LD:begin
				if (Mem_Req_Ready)
					next_state = S_RDW;
				else
					next_state = S_LD;
			end

			S_RDW:begin
				if (Read_data_Valid)
					next_state = S_WB;
				else
					next_state = S_RDW;
			end

			S_ST:begin
				if (Mem_Req_Ready)
					next_state = S_IF;
				else
					next_state = S_ST;
			end

			S_WB:begin
				next_state = S_IF;
			end
			S_BRANCH:begin
				next_state = S_IF;
			end
			S_JAL:begin
				next_state = S_WB;
			end
			S_JALR:begin
				next_state = S_WB;
			end

			default:begin
				next_state = S_IF;
			end
		endcase
	end

	//third part:data flow
	always @(posedge clk) begin
		if (rst) begin
			pc_reg <= 32'b0;
			IR <= 32'b0;
			OldPC <= 32'b0;
			A_reg <= 32'b0;
			B_reg <= 32'b0;
			Res <= 32'b0;
			MDR <= 32'b0;
			
			
		end
		else begin
			case (current_state)
				S_INIT:begin
					
				end
				S_IF: begin
					if (Inst_Req_Ready) begin
						OldPC <= pc_reg;
						pc_reg <= AResult;
						end
					end

				S_IW: begin
					if (Inst_Valid) begin
						IR <= Instruction;
						end
					end
				S_ID:begin
					A_reg <= Rdata1;
					B_reg <= Rdata2;
					if (J==1)begin
						Res<=AResult;
					end
					else if (Jal||Jalr)begin
						Res <= pc_reg;
					end
				end
				S_EX:begin
					if (Lui==1) begin
						Res <= imm32;
					end
					else if ((I||R)&&(funct3==3'b001||funct3==3'b101))begin
						Res <= SResult;
					end
					else begin
						Res <= AResult;
					end
				end

				S_LD:begin
					

				end
				S_ST:begin
					
				end
				S_RDW:begin
					
					MDR <= Read_data;
				end
				S_WB:begin
					
				end
				S_BRANCH:begin
					if (J_yes)begin
						pc_reg <= Res;
					end
				end
				S_JAL:begin
					pc_reg <= AResult;
				end
				S_JALR:begin
					pc_reg <= AResult&(32'hFFFF_FFFE);
				end

				default:begin
				end
			endcase
		end
		
	end

	//third part:output
	wire wb_inst;
	assign wb_inst = Lui || Auipc || Jal || Jalr || L || I || R;

	assign Inst_Req_Valid_r =
	(current_state == S_IF);


	assign Inst_Ready_r =
	(current_state == S_INIT) ||
	(current_state == S_IW);


	assign Read_data_Ready_r =
	(current_state == S_INIT) ||
	(current_state == S_RDW);


	assign Address_r =
	((current_state == S_LD) || (current_state == S_ST))
	? {Res[31:2], 2'b0}
	: 32'b0;


	assign MemRead_r =
	(current_state == S_LD);


	assign MemWrite_r =
	(current_state == S_ST);

	assign Write_data_r =
	(current_state == S_ST)
	? store_wdata
	: 32'b0;

	assign Write_strb_r =
	(current_state == S_ST)
	? store_strb
	: 4'b0;

	assign RF_wen_r =
	(current_state == S_WB) && wb_inst;


	assign RF_waddr_r =
	((current_state == S_WB) && wb_inst)
	? rd
	: 5'b0;

	assign RF_wdata_r =
	((current_state == S_WB) && wb_inst)
	? (L ? load_wdata : Res)
	: 32'b0;
	assign inst_retire ={
		RF_wen,
		RF_waddr,
		RF_wdata,
		OldPC
	} ;

	reg_file ureg(
		.clk(clk),
		.waddr(RF_waddr),
		.raddr1(Raddr1),
		.raddr2(Raddr2),
		.wen(RF_wen),
		.wdata(RF_wdata),
		.rdata1(Rdata1),
		.rdata2(Rdata2)
	);

	alu ualu(
		.A(AA),
		.B(AB),
		.ALUop(ALUop),
		.Overflow(),
		.CarryOut(),
		.Zero(Zero),
		.Result(AResult)
	);


	shifter ushifter(
	.A(SA),
	.B(SB),
	.Shiftop(Shiftop),
	.Result(SResult)
	);

endmodule
