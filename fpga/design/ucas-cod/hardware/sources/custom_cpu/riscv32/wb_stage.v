module wb_stage(
    input        MEM_WB_valid,
    input [31:0] MEM_WB_pc,
    input [31:0] MEM_WB_alu_res,
    input [31:0] MEM_WB_mem_data,
    input [4:0]  MEM_WB_rd,
    input [2:0]  MEM_WB_funct3,
    input        MEM_WB_reg_wen,
    input        MEM_WB_L,
    input [1:0]  MEM_WB_wb_sel,

    output       RF_wen,
    output [4:0] RF_waddr,
    output [31:0] RF_wdata,
    output [69:0] inst_retire
);
	wire [1:0] wb_add = MEM_WB_alu_res[1:0];

	wire [31:0] wb_Ldata =
		(wb_add == 2'b00) ? MEM_WB_mem_data[31:0] :
		(wb_add == 2'b01) ? {8'b0, MEM_WB_mem_data[31:8]} :
		(wb_add == 2'b10) ? {16'b0, MEM_WB_mem_data[31:16]} :
					{24'b0, MEM_WB_mem_data[31:24]};

	wire [31:0] wb_load_wdata =
		(MEM_WB_L && MEM_WB_funct3 == 3'b000) ? {{24{wb_Ldata[7]}},  wb_Ldata[7:0]}  : // LB
		(MEM_WB_L && MEM_WB_funct3 == 3'b001) ? {{16{wb_Ldata[15]}}, wb_Ldata[15:0]} : // LH
		(MEM_WB_L && MEM_WB_funct3 == 3'b010) ? MEM_WB_mem_data                       : // LW
		(MEM_WB_L && MEM_WB_funct3 == 3'b100) ? {24'b0, wb_Ldata[7:0]}                 : // LBU
		(MEM_WB_L && MEM_WB_funct3 == 3'b101) ? {16'b0, wb_Ldata[15:0]}                : // LHU
							32'b0;
        assign RF_wen =
		MEM_WB_valid &&
		MEM_WB_reg_wen &&
		(MEM_WB_rd != 5'b0);

	assign RF_waddr = MEM_WB_rd;

	assign RF_wdata =
    		(MEM_WB_wb_sel == 2'b01) ? wb_load_wdata :
    		(MEM_WB_wb_sel == 2'b10) ? (MEM_WB_pc + 32'd4) :
                               MEM_WB_alu_res;

	assign inst_retire = MEM_WB_valid ? {
		RF_wen,
		RF_waddr,
		RF_wdata,
		MEM_WB_pc
	} : 70'b0;

endmodule