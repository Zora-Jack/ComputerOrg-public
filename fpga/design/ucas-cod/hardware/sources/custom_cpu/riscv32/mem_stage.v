module mem_stage(
    input        rst,
    input        EX_MEM_valid,
    input [31:0] EX_MEM_alu_res,
    input [31:0] EX_MEM_rs2_data,
    input [2:0]  EX_MEM_funct3,
    input        EX_MEM_L,
    input        EX_MEM_S,

    input        Mem_Req_Ready,
    input        Read_data_Valid,
    input        mem_req_done,

    output       mem_req_fire,
    output       mem_load_resp_fire,
    output       mem_stall,

    output [31:0] Address,
    output        MemWrite,
    output [31:0] Write_data,
    output [3:0]  Write_strb,
    output        MemRead,
    output        Read_data_Ready
);

	wire [1:0] mem_add = EX_MEM_alu_res[1:0];
	wire [3:0] mem_store_strb =
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b00) ? 4'b0001 :
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b01) ? 4'b0010 :
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b10) ? 4'b0100 :
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b11) ? 4'b1000 :
		(EX_MEM_funct3 == 3'b001 && mem_add == 2'b00) ? 4'b0011 :
		(EX_MEM_funct3 == 3'b001 && mem_add == 2'b10) ? 4'b1100 :
		(EX_MEM_funct3 == 3'b010)                     ? 4'b1111 :
								4'b0000;
	
	wire [31:0] mem_store_wdata =
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b00) ? {24'b0, EX_MEM_rs2_data[7:0]} :
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b01) ? {16'b0, EX_MEM_rs2_data[7:0], 8'b0} :
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b10) ? {8'b0,  EX_MEM_rs2_data[7:0], 16'b0} :
		(EX_MEM_funct3 == 3'b000 && mem_add == 2'b11) ? {EX_MEM_rs2_data[7:0], 24'b0} :

		(EX_MEM_funct3 == 3'b001 && mem_add == 2'b00) ? {16'b0, EX_MEM_rs2_data[15:0]} :
		(EX_MEM_funct3 == 3'b001 && mem_add == 2'b10) ? {EX_MEM_rs2_data[15:0], 16'b0} :

		(EX_MEM_funct3 == 3'b010)                     ? EX_MEM_rs2_data :
								32'b0;
	wire mem_access;

	assign mem_access =
	EX_MEM_valid && (EX_MEM_L || EX_MEM_S);

	assign mem_req_fire =
	(MemRead || MemWrite) && Mem_Req_Ready;

	assign mem_load_resp_fire =
	Read_data_Valid && Read_data_Ready;

        wire mem_store_done;
	wire mem_load_done;
	wire mem_access_done;

	assign mem_store_done =
		EX_MEM_valid &&
		EX_MEM_S &&
		mem_req_fire;

	assign mem_load_done =
		EX_MEM_valid &&
		EX_MEM_L &&
		mem_load_resp_fire;

	assign mem_access_done =
		!mem_access ||
		mem_store_done ||
		mem_load_done;

	assign mem_stall =
		mem_access && !mem_access_done;

        assign Address =
		(EX_MEM_valid && (EX_MEM_L || EX_MEM_S))
		? {EX_MEM_alu_res[31:2], 2'b00}
		: 32'b0;

	assign MemWrite =
		EX_MEM_valid && 
		EX_MEM_S &&
		!mem_req_done;

	assign Write_data =
		MemWrite
		? mem_store_wdata
		: 32'b0;

	assign Write_strb =
		MemWrite
		? mem_store_strb
		: 4'b0000;


	assign MemRead =
    		EX_MEM_valid && 
		EX_MEM_L && 
		!mem_req_done;

        assign Read_data_Ready =
		rst ||
		(
			EX_MEM_valid &&
			EX_MEM_L &&
			mem_req_done
		);

endmodule