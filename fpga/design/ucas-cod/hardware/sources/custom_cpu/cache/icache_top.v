`timescale 10ns / 1ns

`define CACHE_SET	8
`define CACHE_WAY	4
`define TAG_LEN		24
`define LINE_LEN	256

module icache_top (
	input	      clk,
	input	      rst,
	
	//CPU interface
	/** CPU instruction fetch request to Cache: valid signal */
	input         from_cpu_inst_req_valid,
	/** CPU instruction fetch request to Cache: address (4 byte alignment) */
	input  [31:0] from_cpu_inst_req_addr,
	/** Acknowledgement from Cache: ready to receive CPU instruction fetch request */
	output        to_cpu_inst_req_ready,
	
	/** Cache responses to CPU: valid signal */
	output        to_cpu_cache_rsp_valid,
	/** Cache responses to CPU: 32-bit Instruction value */
	output [31:0] to_cpu_cache_rsp_data,
	/** Acknowledgement from CPU: Ready to receive Instruction */
	input	      from_cpu_cache_rsp_ready,

	//Memory interface (32 byte aligned address)
	/** Cache sending memory read request: valid signal */
	output        to_mem_rd_req_valid,
	/** Cache sending memory read request: address (32 byte alignment) */
	output [31:0] to_mem_rd_req_addr,
	/** Acknowledgement from memory: ready to receive memory read request */
	input         from_mem_rd_req_ready,

	/** Memory return read data: valid signal of one data beat */
	input         from_mem_rd_rsp_valid,
	/** Memory return read data: 32-bit one data beat */
	input  [31:0] from_mem_rd_rsp_data,
	/** Memory return read data: if current data beat is the last in this burst data transmission */
	input         from_mem_rd_rsp_last,
	/** Acknowledgement from cache: ready to receive current data beat */
	output        to_mem_rd_rsp_ready
);

//TODO: Please add your I-Cache code here
	localparam S_WAIT = 8'b00000001;
	localparam S_TAG_RD = 8'b00000010;
	localparam S_EVICT = 8'b00000100;
	localparam S_MEM_RD = 8'b00001000;
	localparam S_RECV = 8'b00010000;
	localparam S_REFILL = 8'b00100000;
	localparam S_RESP = 8'b01000000;
	localparam S_CACHE_RD = 8'b10000000;

	reg [7:0] current_state;
	reg [7:0] next_state;

	reg [31:0] req_addr_reg;
	wire [23:0] req_tag;
	wire [2:0] req_index;
	wire [2:0] req_word_offset;
	wire [31:0] req_line_addr;

	assign req_tag = req_addr_reg[31:8];
	assign req_index = req_addr_reg[7:5];
	assign req_word_offset = req_addr_reg[4:2];
	assign req_line_addr = {req_addr_reg[31:5],5'b0};

	wire [23:0] tag_rdata [0:3];
	wire [255:0] data_rdata [0:3];

	wire [2:0] tag_waddr;
	wire [2:0] data_waddr;
	wire [3:0] tag_wen;
	wire [3:0] data_wen;
	wire [23:0] tag_wdata;
	wire [255:0] data_wdata;

	reg [3:0] valid_array [0:`CACHE_SET-1];

	wire [3:0] way_hit;
	wire Read_Hit;
	wire Read_Miss;

	assign way_hit[0] = valid_array[req_index][0] && (tag_rdata[0] == req_tag);
	assign way_hit[1] = valid_array[req_index][1] && (tag_rdata[1] == req_tag);
	assign way_hit[2] = valid_array[req_index][2] && (tag_rdata[2] == req_tag);
	assign way_hit[3] = valid_array[req_index][3] && (tag_rdata[3] == req_tag);
	
	assign Read_Hit = |way_hit;
	assign Read_Miss = ~Read_Hit;

	reg [1:0] victim_array [0:`CACHE_SET-1];

	wire [1:0] victim_way;
	wire [3:0] victim_way_onehot;

	assign victim_way = victim_array[req_index];

	assign victim_way_onehot = (victim_way==2'd0) ? 4'b0001:
								(victim_way==2'd1) ? 4'b0010:
								(victim_way==2'd2) ? 4'b0100:
								(victim_way==2'd3) ? 4'b1000:4'b0001;
	
	reg [255:0] refill_line;
	reg [2:0] refill_cnt;
	wire refill_fire;

	assign refill_fire = from_mem_rd_rsp_valid && to_mem_rd_rsp_ready;

	assign tag_waddr = req_index;
	assign data_waddr = req_index;

	assign tag_wen = (current_state==S_REFILL)?victim_way_onehot:4'b0000;
	assign data_wen = (current_state==S_REFILL)?victim_way_onehot:4'b0000;

	assign tag_wdata = req_tag;
	assign data_wdata = refill_line;

	wire [255:0] hit_line;
	wire [255:0] resp_line;
	wire [31:0] resp_inst;

	reg [31:0] rsp_data_reg;

	assign hit_line = way_hit[0] ? data_rdata[0]:
						way_hit[1] ? data_rdata[1]:
						way_hit[2] ? data_rdata[2]:
						way_hit[3] ? data_rdata[3]:256'b0;
	
	assign resp_line = (current_state == S_RESP && Read_Miss) ? refill_line:hit_line;

	assign resp_inst = resp_line[req_word_offset*32+:32];

	tag_array u_tag_array_0 (
		.clk (clk),
		.waddr (tag_waddr),
		.raddr (req_index),
		.wen (tag_wen[0]),
		.wdata (tag_wdata),
		.rdata (tag_rdata[0])
	);

	tag_array u_tag_array_1 (
		.clk (clk),
		.waddr (tag_waddr),
		.raddr (req_index),
		.wen (tag_wen[1]),
		.wdata (tag_wdata),
		.rdata (tag_rdata[1])
	);

	tag_array u_tag_array_2 (
		.clk (clk),
		.waddr (tag_waddr),
		.raddr (req_index),
		.wen (tag_wen[2]),
		.wdata (tag_wdata),
		.rdata (tag_rdata[2])
	);

	tag_array u_tag_array_3 (
		.clk (clk),
		.waddr (tag_waddr),
		.raddr (req_index),
		.wen (tag_wen[3]),
		.wdata (tag_wdata),
		.rdata (tag_rdata[3])
	);

	data_array u_data_array_0 (
		.clk   (clk),
		.waddr (data_waddr),
		.raddr (req_index),
		.wen   (data_wen[0]),
		.wdata (data_wdata),
		.rdata (data_rdata[0])
	);

	data_array u_data_array_1 (
		.clk   (clk),
		.waddr (data_waddr),
		.raddr (req_index),
		.wen   (data_wen[1]),
		.wdata (data_wdata),
		.rdata (data_rdata[1])
	);

	data_array u_data_array_2 (
		.clk   (clk),
		.waddr (data_waddr),
		.raddr (req_index),
		.wen   (data_wen[2]),
		.wdata (data_wdata),
		.rdata (data_rdata[2])
	);

	data_array u_data_array_3 (
		.clk   (clk),
		.waddr (data_waddr),
		.raddr (req_index),
		.wen   (data_wen[3]),
		.wdata (data_wdata),
		.rdata (data_rdata[3])
	);

	always @(posedge clk) begin
    	if (rst) begin
        	current_state <= S_WAIT;
    	end 
		else begin
        	current_state <= next_state;
    	end
	end

	always @(*) begin
		next_state = current_state;
		case (current_state)
			S_WAIT:begin
				if (from_cpu_inst_req_valid)begin
					next_state = S_TAG_RD;
				end
				else begin
					next_state = S_WAIT;
				end
			end 
			S_TAG_RD:begin
				if (Read_Miss)begin
					next_state = S_EVICT;
				end
				else if (Read_Hit)begin
					next_state = S_CACHE_RD;
				end
			end
			S_EVICT:begin
				next_state = S_MEM_RD;
			end
			S_MEM_RD:begin
				if (from_mem_rd_req_ready)begin
					next_state = S_RECV;
				end
				else begin
					next_state = S_MEM_RD;
				end
			end
			S_RECV:begin
				if (from_mem_rd_rsp_valid && from_mem_rd_rsp_last)begin
					next_state = S_REFILL;
				end
				else begin
					next_state = S_RECV;
				end
			end
			S_REFILL:begin
				next_state = S_RESP;
			end
			S_RESP:begin
				if (from_cpu_cache_rsp_ready)begin
					next_state = S_WAIT;
				end
				else begin
					next_state = S_RESP;
				end
			end
			S_CACHE_RD:begin
				next_state = S_RESP;
			end

			default: begin
				next_state = S_WAIT;
			end
		endcase
	end

	integer i;
	always @(posedge clk) begin
		if (rst) begin
			req_addr_reg <= 32'b0;
			for (i=0;i<8;i=i+1)begin
				valid_array[i] <= 4'b0000;
				victim_array[i] <= 2'b00;
			end

			refill_cnt <= 3'b0;
			refill_line <= 256'b0;
			rsp_data_reg <= 32'b0;
		end
		else begin
			if (current_state==S_WAIT
			&&from_cpu_inst_req_valid&&to_cpu_inst_req_ready)begin
				req_addr_reg <= from_cpu_inst_req_addr;
			end
			else if (current_state==S_MEM_RD && from_mem_rd_req_ready)begin
				refill_cnt <= 3'b0;
				refill_line <= 256'b0;
			end
			else if (current_state==S_RECV && refill_fire)begin
				refill_line[refill_cnt*32+:32] <= from_mem_rd_rsp_data;
				refill_cnt <= refill_cnt + 3'd1;
			end
			else if (current_state==S_REFILL)begin
				valid_array[req_index] <= valid_array[req_index] | victim_way_onehot;
				victim_array[req_index] <= victim_array[req_index] + 2'd1;
				rsp_data_reg <= refill_line[req_word_offset * 32 +: 32];
			end
			else if (current_state==S_CACHE_RD)begin
				rsp_data_reg <= resp_inst;
			end
		end
	end
	assign to_cpu_inst_req_ready = (current_state==S_WAIT);

	assign to_mem_rd_req_valid = (current_state==S_MEM_RD);
	assign to_mem_rd_req_addr = req_line_addr;
	assign to_mem_rd_rsp_ready = (current_state==S_RECV);

	assign to_cpu_cache_rsp_valid = (current_state==S_RESP);
	assign to_cpu_cache_rsp_data = rsp_data_reg;

endmodule

