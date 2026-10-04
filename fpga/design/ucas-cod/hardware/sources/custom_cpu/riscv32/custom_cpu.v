`timescale 10ns / 1ns
`include "cpu_defs.vh"

module custom_cpu(
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

	input         intr,

	output [31:0] cpu_perf_cnt_0,
	output [31:0] cpu_perf_cnt_1,
	output [31:0] cpu_perf_cnt_2,
	output [31:0] cpu_perf_cnt_3,
	output [31:0] cpu_perf_cnt_4,
	output [31:0] cpu_perf_cnt_5,
	output [31:0] cpu_perf_cnt_6,
	output [31:0] cpu_perf_cnt_7,
	output [31:0] cpu_perf_cnt_8,
	output [31:0] cpu_perf_cnt_9,
	output [31:0] cpu_perf_cnt_10,
	output [31:0] cpu_perf_cnt_11,
	output [31:0] cpu_perf_cnt_12,
	output [31:0] cpu_perf_cnt_13,
	output [31:0] cpu_perf_cnt_14,
	output [31:0] cpu_perf_cnt_15,
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

	reg        mem_req_done;

	wire       rst_ready;
	wire       if_req_fire;
	wire       if_resp_fire;
	wire       if_req_valid;
	wire       if_wait_resp;
	wire       if_discard_resp;
	wire       if_buf_valid;
	wire       if_id_fetch_valid;
	wire [31:0] if_id_fetch_pc;
	wire [31:0] if_id_fetch_inst;

	reg [31:0] cycle_cnt;
	reg [31:0] retire_cnt;
	reg [31:0] if_req_fire_cnt;
	reg [31:0] if_resp_fire_cnt;
	reg [31:0] if_req_wait_cnt;
	reg [31:0] if_resp_wait_cnt;
	reg [31:0] data_stall_cnt;
	reg [31:0] mem_stall_cnt;
	reg [31:0] mem_load_stall_cnt;
	reg [31:0] mem_store_stall_cnt;
	reg [31:0] ex_redirect_cnt;
	reg [31:0] if_discard_resp_cnt;
	reg [31:0] if_buffered_resp_cnt;
	reg [31:0] mem_req_fire_cnt;
	reg [31:0] mem_load_resp_fire_cnt;
	reg [31:0] mem_store_req_fire_cnt;

	assign cpu_perf_cnt_0  = cycle_cnt;
	assign cpu_perf_cnt_1  = retire_cnt;
	assign cpu_perf_cnt_2  = if_req_fire_cnt;
	assign cpu_perf_cnt_3  = if_resp_fire_cnt;
	assign cpu_perf_cnt_4  = if_req_wait_cnt;
	assign cpu_perf_cnt_5  = if_resp_wait_cnt;
	assign cpu_perf_cnt_6  = data_stall_cnt;
	assign cpu_perf_cnt_7  = mem_stall_cnt;
	assign cpu_perf_cnt_8  = mem_load_stall_cnt;
	assign cpu_perf_cnt_9  = mem_store_stall_cnt;
	assign cpu_perf_cnt_10 = ex_redirect_cnt;
	assign cpu_perf_cnt_11 = if_discard_resp_cnt;
	assign cpu_perf_cnt_12 = if_buffered_resp_cnt;
	assign cpu_perf_cnt_13 = mem_req_fire_cnt;
	assign cpu_perf_cnt_14 = mem_load_resp_fire_cnt;
	assign cpu_perf_cnt_15 = mem_store_req_fire_cnt;

	// =========================
	// IF/ID pipeline registers
	// =========================

	reg        IF_ID_valid;
	reg [31:0] IF_ID_pc;
	reg [31:0] IF_ID_inst;

	// =========================
	// ID/EX pipeline registers
	// =========================

	reg        ID_EX_valid;
	reg [31:0] ID_EX_pc;
	reg [31:0] ID_EX_rs1_data;
	reg [31:0] ID_EX_rs2_data;
	reg [31:0] ID_EX_imm;
	reg [4:0]  ID_EX_rd;
	reg [4:0]  ID_EX_rs1;
	reg [4:0]  ID_EX_rs2;
	reg [2:0]  ID_EX_funct3;
	reg [6:0]  ID_EX_funct7;
	reg        ID_EX_Lui;
	reg        ID_EX_Auipc;
	reg        ID_EX_Jal;
	reg        ID_EX_Jalr;
	reg        ID_EX_J;
	reg        ID_EX_L;
	reg        ID_EX_S;
	reg        ID_EX_I;
	reg        ID_EX_R;
	reg [4:0]  ID_EX_shamt;
	reg        ID_EX_inst30;
	reg        ID_EX_reg_wen;
	reg [1:0]  ID_EX_wb_sel;

	// =========================
	// EX/MEM pipeline registers
	// =========================

	reg        EX_MEM_valid;
	reg [31:0] EX_MEM_pc;
	reg [31:0] EX_MEM_alu_res;
	reg [31:0] EX_MEM_rs2_data;
	reg [4:0]  EX_MEM_rd;
	reg [2:0]  EX_MEM_funct3;
	reg        EX_MEM_reg_wen;
	reg        EX_MEM_L;
	reg        EX_MEM_S;
	reg [1:0]  EX_MEM_wb_sel;

	// =========================
	// MEM/WB pipeline registers
	// =========================

	reg        MEM_WB_valid;
	reg [31:0] MEM_WB_pc;
	reg [31:0] MEM_WB_alu_res;
	reg [31:0] MEM_WB_mem_data;
	reg [4:0]  MEM_WB_rd;
	reg [2:0]  MEM_WB_funct3;
	reg        MEM_WB_reg_wen;
	reg        MEM_WB_L;
	reg [1:0]  MEM_WB_wb_sel;


	// =========================
	// ID stage wires
	// =========================

	wire [4:0]  id_rs1;
	wire [4:0]  id_rs2;
	wire [4:0]  id_rd;
	wire [2:0]  id_funct3;
	wire [6:0]  id_funct7;
	wire [4:0]  id_shamt;
	wire        id_inst30;

	wire [31:0] id_imm;

	wire        id_Lui;
	wire        id_Auipc;
	wire        id_Jal;
	wire        id_Jalr;
	wire        id_J;
	wire        id_L;
	wire        id_S;
	wire        id_I;
	wire        id_R;

	wire        id_reg_wen;
	wire [1:0]  id_wb_sel;

	id_stage uid_stage(
		.inst       (IF_ID_inst),

		.rs1        (id_rs1),
		.rs2        (id_rs2),
		.rd         (id_rd),
		.funct3     (id_funct3),
		.funct7 	(id_funct7),
		.shamt      (id_shamt),
		.inst30     (id_inst30),

		.imm        (id_imm),

		.Lui        (id_Lui),
		.Auipc      (id_Auipc),
		.Jal        (id_Jal),
		.Jalr       (id_Jalr),
		.J          (id_J),
		.L          (id_L),
		.S          (id_S),
		.I          (id_I),
		.R          (id_R),

		.reg_wen    (id_reg_wen),
		.wb_sel     (id_wb_sel)
	);

	// =========================
	// Hazard unit
	// =========================

	wire data_stall;

	hazard_unit uhazard(
		.IF_ID_valid    (IF_ID_valid),

		.id_Jalr        (id_Jalr),
		.id_J           (id_J),
		.id_L           (id_L),
		.id_S           (id_S),
		.id_I           (id_I),
		.id_R           (id_R),
		.id_rs1         (id_rs1),
		.id_rs2         (id_rs2),

		.ID_EX_valid    (ID_EX_valid),
		.ID_EX_reg_wen  (ID_EX_reg_wen),
		.ID_EX_L        (ID_EX_L),
		.ID_EX_rd       (ID_EX_rd),
		.data_stall     (data_stall)
	);

	// =========================
	// Register file
	// =========================

	wire        RF_wen;
	wire [4:0]  RF_waddr;
	wire [31:0] RF_wdata;

	wire [4:0]  Raddr1 = id_rs1;
	wire [4:0]  Raddr2 = id_rs2;
	wire [31:0] Rdata1;
	wire [31:0] Rdata2;

	reg_file ureg(
		.clk    (clk),
		.waddr  (RF_waddr),
		.raddr1 (Raddr1),
		.raddr2 (Raddr2),
		.wen    (RF_wen),
		.wdata  (RF_wdata),
		.rdata1 (Rdata1),
		.rdata2 (Rdata2)
	);

	wire [31:0] id_rs1_data =
		(RF_wen && (RF_waddr == id_rs1)) ? RF_wdata : Rdata1;
	wire [31:0] id_rs2_data =
		(RF_wen && (RF_waddr == id_rs2)) ? RF_wdata : Rdata2;

	wire        ex_mem_forward_valid =
		EX_MEM_valid &&
		EX_MEM_reg_wen &&
		!EX_MEM_L &&
		(EX_MEM_rd != 5'b0);
	wire [31:0] ex_mem_forward_data =
		(EX_MEM_wb_sel == 2'b10) ? (EX_MEM_pc + 32'd4) :
		EX_MEM_alu_res;

	wire        mem_wb_forward_valid = RF_wen;

	wire [31:0] ex_rs1_data =
		(ex_mem_forward_valid && (EX_MEM_rd == ID_EX_rs1)) ? ex_mem_forward_data :
		(mem_wb_forward_valid && (MEM_WB_rd == ID_EX_rs1)) ? RF_wdata :
		ID_EX_rs1_data;
	wire [31:0] ex_rs2_data =
		(ex_mem_forward_valid && (EX_MEM_rd == ID_EX_rs2)) ? ex_mem_forward_data :
		(mem_wb_forward_valid && (MEM_WB_rd == ID_EX_rs2)) ? RF_wdata :
		ID_EX_rs2_data;

	// =========================
	// EX stage
	// =========================

	wire [31:0] AA;
	wire [31:0] AB;
	wire [31:0] SA;
	wire [31:0] SB;
	wire [2:0]  ALUop;
	wire [1:0]  Shiftop;
	wire        Zero;
	wire [31:0] AResult;
	wire [31:0] SResult;

	wire [31:0] EX_result;
	wire        ex_redirect;
	wire [31:0] ex_redirect_pc;

	ex_stage uex_stage(
		.ID_EX_valid     (ID_EX_valid),
		.ID_EX_pc        (ID_EX_pc),
		.ID_EX_rs1_data  (ex_rs1_data),
		.ID_EX_rs2_data  (ex_rs2_data),
		.ID_EX_imm       (ID_EX_imm),
		.ID_EX_funct3    (ID_EX_funct3),
		.ID_EX_funct7	 (ID_EX_funct7),
		.ID_EX_shamt     (ID_EX_shamt),
		.ID_EX_inst30    (ID_EX_inst30),

		.ID_EX_Lui       (ID_EX_Lui),
		.ID_EX_Auipc     (ID_EX_Auipc),
		.ID_EX_Jal       (ID_EX_Jal),
		.ID_EX_Jalr      (ID_EX_Jalr),
		.ID_EX_J         (ID_EX_J),
		.ID_EX_L         (ID_EX_L),
		.ID_EX_S         (ID_EX_S),
		.ID_EX_I         (ID_EX_I),
		.ID_EX_R         (ID_EX_R),

		.AResult         (AResult),
		.SResult         (SResult),
		.Zero            (Zero),

		.AA              (AA),
		.AB              (AB),
		.SA              (SA),
		.SB              (SB),
		.ALUop           (ALUop),
		.Shiftop         (Shiftop),

		.EX_result       (EX_result),
		.ex_redirect     (ex_redirect),
		.ex_redirect_pc  (ex_redirect_pc)
	);

	alu ualu(
		.A        (AA),
		.B        (AB),
		.ALUop    (ALUop),
		.Overflow (),
		.CarryOut (),
		.Zero     (Zero),
		.Result   (AResult)
	);

	shifter ushifter(
		.A       (SA),
		.B       (SB[4:0]),
		.Shiftop (Shiftop),
		.Result  (SResult)
	);

	// =========================
	// MEM stage
	// =========================

	wire mem_req_fire;
	wire mem_load_resp_fire;
	wire mem_stall;

	mem_stage umem_stage(
		.rst                 (rst || rst_ready),
		.EX_MEM_valid        (EX_MEM_valid),
		.EX_MEM_alu_res      (EX_MEM_alu_res),
		.EX_MEM_rs2_data     (EX_MEM_rs2_data),
		.EX_MEM_funct3       (EX_MEM_funct3),
		.EX_MEM_L            (EX_MEM_L),
		.EX_MEM_S            (EX_MEM_S),

		.Mem_Req_Ready       (Mem_Req_Ready),
		.Read_data_Valid     (Read_data_Valid),
		.mem_req_done        (mem_req_done),

		.mem_req_fire        (mem_req_fire),
		.mem_load_resp_fire  (mem_load_resp_fire),
		.mem_stall           (mem_stall),

		.Address             (Address),
		.MemWrite            (MemWrite),
		.Write_data          (Write_data),
		.Write_strb          (Write_strb),
		.MemRead             (MemRead),
		.Read_data_Ready     (Read_data_Ready)
	);

	// =========================
	// WB stage
	// =========================

	wb_stage uwb_stage(
		.MEM_WB_valid    (MEM_WB_valid),
		.MEM_WB_pc       (MEM_WB_pc),
		.MEM_WB_alu_res  (MEM_WB_alu_res),
		.MEM_WB_mem_data (MEM_WB_mem_data),
		.MEM_WB_rd       (MEM_WB_rd),
		.MEM_WB_funct3   (MEM_WB_funct3),
		.MEM_WB_reg_wen  (MEM_WB_reg_wen),
		.MEM_WB_L        (MEM_WB_L),
		.MEM_WB_wb_sel   (MEM_WB_wb_sel),

		.RF_wen          (RF_wen),
		.RF_waddr        (RF_waddr),
		.RF_wdata        (RF_wdata),
		.inst_retire     (inst_retire)
	);

	// =========================
	// IF stage
	// =========================

	if_stage uif_stage(
		.clk                 (clk),
		.rst                 (rst),
		.mem_stall           (mem_stall),
		.data_stall          (data_stall),
		.ex_redirect         (ex_redirect),
		.ex_redirect_pc      (ex_redirect_pc),

		.PC                  (PC),
		.Inst_Req_Valid      (Inst_Req_Valid),
		.Inst_Req_Ready      (Inst_Req_Ready),

		.Instruction         (Instruction),
		.Inst_Valid          (Inst_Valid),
		.Inst_Ready          (Inst_Ready),

		.rst_ready           (rst_ready),
		.if_req_fire         (if_req_fire),
		.if_resp_fire        (if_resp_fire),
		.if_req_valid_o      (if_req_valid),
		.if_wait_resp_o      (if_wait_resp),
		.if_discard_resp_o   (if_discard_resp),
		.if_buf_valid_o      (if_buf_valid),

		.if_id_fetch_valid   (if_id_fetch_valid),
		.if_id_fetch_pc      (if_id_fetch_pc),
		.if_id_fetch_inst    (if_id_fetch_inst)
	);

	// =========================
	// Main pipeline sequential logic
	// =========================

	always @(posedge clk) begin
		if (rst) begin
			cycle_cnt       <= 32'b0;
			retire_cnt      <= 32'b0;
			if_req_fire_cnt <= 32'b0;
			if_resp_fire_cnt <= 32'b0;
			if_req_wait_cnt <= 32'b0;
			if_resp_wait_cnt <= 32'b0;
			data_stall_cnt <= 32'b0;
			mem_stall_cnt <= 32'b0;
			mem_load_stall_cnt <= 32'b0;
			mem_store_stall_cnt <= 32'b0;
			ex_redirect_cnt <= 32'b0;
			if_discard_resp_cnt <= 32'b0;
			if_buffered_resp_cnt <= 32'b0;
			mem_req_fire_cnt <= 32'b0;
			mem_load_resp_fire_cnt <= 32'b0;
			mem_store_req_fire_cnt <= 32'b0;
			mem_req_done    <= 1'b0;

			IF_ID_valid  <= 1'b0;
			ID_EX_valid  <= 1'b0;
			EX_MEM_valid <= 1'b0;
			MEM_WB_valid <= 1'b0;

			IF_ID_pc     <= 32'b0;
			IF_ID_inst   <= 32'b0;

			ID_EX_pc       <= 32'b0;
			ID_EX_rs1_data <= 32'b0;
			ID_EX_rs2_data <= 32'b0;
			ID_EX_imm      <= 32'b0;
			ID_EX_rd       <= 5'b0;
			ID_EX_rs1      <= 5'b0;
			ID_EX_rs2      <= 5'b0;
			ID_EX_funct3   <= 3'b0;
			ID_EX_funct7   <= 7'b0;

			ID_EX_Lui      <= 1'b0;
			ID_EX_Auipc    <= 1'b0;
			ID_EX_Jal      <= 1'b0;
			ID_EX_Jalr     <= 1'b0;
			ID_EX_J        <= 1'b0;
			ID_EX_L        <= 1'b0;
			ID_EX_S        <= 1'b0;
			ID_EX_I        <= 1'b0;
			ID_EX_R        <= 1'b0;
			ID_EX_shamt    <= 5'b0;
			ID_EX_inst30   <= 1'b0;
			ID_EX_reg_wen  <= 1'b0;
			ID_EX_wb_sel   <= 2'b00;

			EX_MEM_pc       <= 32'b0;
			EX_MEM_alu_res  <= 32'b0;
			EX_MEM_rs2_data <= 32'b0;
			EX_MEM_rd       <= 5'b0;
			EX_MEM_funct3   <= 3'b0;
			EX_MEM_reg_wen  <= 1'b0;
			EX_MEM_L        <= 1'b0;
			EX_MEM_S        <= 1'b0;
			EX_MEM_wb_sel   <= 2'b00;

			MEM_WB_pc       <= 32'b0;
			MEM_WB_alu_res  <= 32'b0;
			MEM_WB_mem_data <= 32'b0;
			MEM_WB_rd       <= 5'b0;
			MEM_WB_funct3   <= 3'b0;
			MEM_WB_reg_wen  <= 1'b0;
			MEM_WB_L        <= 1'b0;
			MEM_WB_wb_sel   <= 2'b00;
		end
		else begin
			cycle_cnt <= cycle_cnt + 32'd1;
			retire_cnt <= retire_cnt + {31'b0, MEM_WB_valid};
			if_req_fire_cnt <= if_req_fire_cnt + {31'b0, if_req_fire};
			if_resp_fire_cnt <= if_resp_fire_cnt + {31'b0, if_resp_fire};
			if_req_wait_cnt <= if_req_wait_cnt + {31'b0, if_req_valid && !Inst_Req_Ready};
			if_resp_wait_cnt <= if_resp_wait_cnt + {31'b0, if_wait_resp && !if_resp_fire};
			data_stall_cnt <= data_stall_cnt + {31'b0, !mem_stall && data_stall};
			mem_stall_cnt <= mem_stall_cnt + {31'b0, mem_stall};
			mem_load_stall_cnt <= mem_load_stall_cnt + {31'b0, mem_stall && EX_MEM_L};
			mem_store_stall_cnt <= mem_store_stall_cnt + {31'b0, mem_stall && EX_MEM_S};
			ex_redirect_cnt <= ex_redirect_cnt + {31'b0, !mem_stall && ex_redirect};
			if_discard_resp_cnt <= if_discard_resp_cnt + {31'b0, if_resp_fire && (if_discard_resp || ex_redirect)};
			if_buffered_resp_cnt <= if_buffered_resp_cnt + {31'b0, if_resp_fire && !if_discard_resp && !ex_redirect && (mem_stall || data_stall)};
			mem_req_fire_cnt <= mem_req_fire_cnt + {31'b0, mem_req_fire};
			mem_load_resp_fire_cnt <= mem_load_resp_fire_cnt + {31'b0, mem_load_resp_fire};
			mem_store_req_fire_cnt <= mem_store_req_fire_cnt + {31'b0, mem_req_fire && EX_MEM_S};

			if (mem_stall) begin
				if (mem_req_fire && EX_MEM_L) begin
					mem_req_done <= 1'b1;
				end

				MEM_WB_valid <= 1'b0;

				// PC / IF_ID / ID_EX / EX_MEM hold
			end
			else begin
				mem_req_done <= 1'b0;

				// EX -> MEM
				EX_MEM_valid    <= ID_EX_valid;
				EX_MEM_pc       <= ID_EX_pc;
				EX_MEM_alu_res  <= EX_result;
				EX_MEM_rs2_data <= ex_rs2_data;
				EX_MEM_rd       <= ID_EX_rd;
				EX_MEM_funct3   <= ID_EX_funct3;
				EX_MEM_reg_wen  <= ID_EX_reg_wen;
				EX_MEM_L        <= ID_EX_L;
				EX_MEM_S        <= ID_EX_S;
				EX_MEM_wb_sel   <= ID_EX_wb_sel;

				// MEM -> WB
				MEM_WB_valid    <= EX_MEM_valid;
				MEM_WB_pc       <= EX_MEM_pc;
				MEM_WB_alu_res  <= EX_MEM_alu_res;
				MEM_WB_rd       <= EX_MEM_rd;
				MEM_WB_funct3   <= EX_MEM_funct3;
				MEM_WB_reg_wen  <= EX_MEM_reg_wen;
				MEM_WB_L        <= EX_MEM_L;
				MEM_WB_mem_data <= Read_data;
				MEM_WB_wb_sel   <= EX_MEM_wb_sel;

				if (ex_redirect) begin
					IF_ID_valid <= 1'b0;
					ID_EX_valid <= 1'b0;
				end
				else if (data_stall) begin
					// IF_ID hold, PC hold
					// Insert bubble into ID_EX
					ID_EX_valid <= 1'b0;
				end
				else begin
					// ID -> EX
					ID_EX_valid    <= IF_ID_valid;
					ID_EX_pc       <= IF_ID_pc;
					ID_EX_rs1_data <= id_rs1_data;
					ID_EX_rs2_data <= id_rs2_data;
					ID_EX_imm      <= id_imm;
					ID_EX_rd       <= id_rd;
					ID_EX_rs1      <= id_rs1;
					ID_EX_rs2      <= id_rs2; 
					ID_EX_funct3   <= id_funct3;
					ID_EX_funct7   <= id_funct7;

					ID_EX_Lui      <= id_Lui;
					ID_EX_Auipc    <= id_Auipc;
					ID_EX_Jal      <= id_Jal;
					ID_EX_Jalr     <= id_Jalr;
					ID_EX_J        <= id_J;
					ID_EX_L        <= id_L;
					ID_EX_S        <= id_S;
					ID_EX_I        <= id_I;
					ID_EX_R        <= id_R;
					ID_EX_shamt    <= id_shamt;
					ID_EX_inst30   <= id_inst30;
					ID_EX_reg_wen  <= id_reg_wen;
					ID_EX_wb_sel   <= id_wb_sel;

					// Current IF_ID consumed by ID
					IF_ID_valid <= 1'b0;

					if (if_id_fetch_valid) begin
						IF_ID_valid <= 1'b1;
						IF_ID_pc    <= if_id_fetch_pc;
						IF_ID_inst  <= if_id_fetch_inst;
					end
				end
			end
		end
	end

endmodule
