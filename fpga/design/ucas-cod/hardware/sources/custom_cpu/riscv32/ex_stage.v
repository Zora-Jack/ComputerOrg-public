module ex_stage(
    input        ID_EX_valid,
    input [31:0] ID_EX_pc,
    input [31:0] ID_EX_rs1_data,
    input [31:0] ID_EX_rs2_data,
    input [31:0] ID_EX_imm,
    input [2:0]  ID_EX_funct3,
	input [6:0]  ID_EX_funct7,
    input [4:0]  ID_EX_shamt,
    input        ID_EX_inst30,

    input        ID_EX_Lui,
    input        ID_EX_Auipc,
    input        ID_EX_Jal,
    input        ID_EX_Jalr,
    input        ID_EX_J,
    input        ID_EX_L,
    input        ID_EX_S,
    input        ID_EX_I,
    input        ID_EX_R,

    input [31:0] AResult,
    input [31:0] SResult,
    input        Zero,

    output [31:0] AA,
    output [31:0] AB,
    output [31:0] SA,
    output [31:0] SB,
    output [2:0]  ALUop,
    output [1:0]  Shiftop,

    output [31:0] EX_result,
    output        ex_redirect,
    output [31:0] ex_redirect_pc
);
        
    assign ALUop =
		// branch compare
		(ID_EX_J && (ID_EX_funct3 == 3'b000 || ID_EX_funct3 == 3'b001)) ? 3'b001 :
		(ID_EX_J && (ID_EX_funct3 == 3'b100 || ID_EX_funct3 == 3'b101)) ? 3'b010 :
		(ID_EX_J && (ID_EX_funct3 == 3'b110 || ID_EX_funct3 == 3'b111)) ? 3'b011 :
		//normal EX
		(ID_EX_L || ID_EX_S || ID_EX_Auipc || ID_EX_Jalr) ? 3'b000 :
		(ID_EX_R && ID_EX_funct3 == 3'b000 && ID_EX_inst30) ? 3'b001 :
		(ID_EX_I || ID_EX_R) ? ID_EX_funct3 :
		3'b000;

	assign Shiftop =
		(ID_EX_funct3 == 3'b001) ? 2'b00 :
		(ID_EX_inst30)           ? 2'b11 :
					2'b10;


	assign AA =
		ID_EX_Auipc ? ID_EX_pc :
				ID_EX_rs1_data;

	assign AB =
		ID_EX_J     ? ID_EX_rs2_data :
		ID_EX_Auipc ? ID_EX_imm :
		ID_EX_L     ? ID_EX_imm :
		ID_EX_S     ? ID_EX_imm :
		ID_EX_I     ? ID_EX_imm :
		ID_EX_Jalr  ? ID_EX_imm :
		ID_EX_R     ? ID_EX_rs2_data :
				32'b0;

	assign SA =
    		(ID_EX_I || ID_EX_R) ? ID_EX_rs1_data : 32'b0;

	assign SB =
    		ID_EX_I ? {27'b0, ID_EX_shamt} :
              		{27'b0, ID_EX_rs2_data[4:0]}; 
	wire ID_EX_is_shift;
	assign ID_EX_is_shift =
		(ID_EX_I || ID_EX_R) &&
		(ID_EX_funct3 == 3'b001 || ID_EX_funct3 == 3'b101);
	wire ID_EX_is_mul;
	assign ID_EX_is_mul = 
		(ID_EX_R) && ID_EX_funct3 == 3'b000 && ID_EX_funct7 == 7'b0000001;

	wire [31:0] mul_res = AA * AB;
	assign EX_result =
		ID_EX_Lui      ? ID_EX_imm :
		ID_EX_is_shift ? SResult   :
		ID_EX_is_mul   ? mul_res   :
				AResult;

	//J:update the PC reg
	wire [31:0] ex_pc_target = ID_EX_pc + ID_EX_imm;
	wire [31:0] ex_jalr_target = AResult & 32'hFFFF_FFFE;

	wire ex_branch_taken =
		ID_EX_valid &&
		ID_EX_J &&
		(
			((ID_EX_funct3 == 3'b000) && (Zero == 1'b1)) ||
			((ID_EX_funct3 == 3'b001) && (Zero == 1'b0)) ||
			(((ID_EX_funct3 == 3'b100) || (ID_EX_funct3 == 3'b110)) &&
			(AResult == 32'b1)) ||
			(((ID_EX_funct3 == 3'b101) || (ID_EX_funct3 == 3'b111)) &&
			(AResult == 32'b0))
		);

	wire ex_jal_taken  = ID_EX_valid && ID_EX_Jal;
	wire ex_jalr_taken = ID_EX_valid && ID_EX_Jalr;

	assign ex_redirect =
		ex_branch_taken || ex_jal_taken || ex_jalr_taken;

	assign  ex_redirect_pc =
		ex_jalr_taken ? ex_jalr_target :
				ex_pc_target;
endmodule