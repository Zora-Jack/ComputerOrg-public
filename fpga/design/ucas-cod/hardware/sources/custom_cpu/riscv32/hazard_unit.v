module hazard_unit(
    input        IF_ID_valid,

    input        id_Jalr,
    input        id_J,
    input        id_L,
    input        id_S,
    input        id_I,
    input        id_R,
    input [4:0]  id_rs1,
    input [4:0]  id_rs2,

    input        ID_EX_valid,
    input        ID_EX_reg_wen,
    input        ID_EX_L,
    input [4:0]  ID_EX_rd,
    output       data_stall
);

	wire id_use_rs1 = 
		id_Jalr || id_J || id_L || id_S || id_I || id_R;
	wire id_use_rs2 = 
		id_J || id_S || id_R;
	wire hazard_ID_EX = 
	ID_EX_valid &&
	ID_EX_reg_wen &&
	ID_EX_L &&
	(ID_EX_rd != 5'b0) &&
	(
		(id_use_rs1 && (id_rs1 == ID_EX_rd)) ||
		(id_use_rs2 && (id_rs2 == ID_EX_rd))
	);

	assign data_stall = 
	IF_ID_valid &&
		hazard_ID_EX;

endmodule