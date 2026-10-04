`timescale 10ns / 1ns

`define CACHE_SET	8
`define CACHE_WAY	4
`define TAG_LEN		24
`define LINE_LEN	256

module dcache_top (
	input	      clk,
	input	      rst,
  
	//CPU interface
	/** CPU memory/IO access request to Cache: valid signal */
	input         from_cpu_mem_req_valid,
	/** CPU memory/IO access request to Cache: 0 for read; 1 for write (when req_valid is high) */
	input         from_cpu_mem_req,
	/** CPU memory/IO access request to Cache: address (4 byte alignment) */
	input  [31:0] from_cpu_mem_req_addr,
	/** CPU memory/IO access request to Cache: 32-bit write data */
	input  [31:0] from_cpu_mem_req_wdata,
	/** CPU memory/IO access request to Cache: 4-bit write strobe */
	input  [ 3:0] from_cpu_mem_req_wstrb,
	/** Acknowledgement from Cache: ready to receive CPU memory access request */
	output        to_cpu_mem_req_ready,
		
	/** Cache responses to CPU: valid signal */
	output        to_cpu_cache_rsp_valid,
	/** Cache responses to CPU: 32-bit read data */
	output [31:0] to_cpu_cache_rsp_data,
	/** Acknowledgement from CPU: Ready to receive read data */
	input         from_cpu_cache_rsp_ready,
		
	//Memory/IO read interface
	/** Cache sending memory/IO read request: valid signal */
	output        to_mem_rd_req_valid,
	/** Cache sending memory read request: address
	  * 4 byte alignment for I/O read 
	  * 32 byte alignment for cache read miss */
	output [31:0] to_mem_rd_req_addr,
        /** Cache sending memory read request: burst length
	  * 0 for I/O read (read only one data beat)
	  * 7 for cache read miss (read eight data beats) */
	output [ 7:0] to_mem_rd_req_len,
        /** Acknowledgement from memory: ready to receive memory read request */
	input	      from_mem_rd_req_ready,

	/** Memory return read data: valid signal of one data beat */
	input	      from_mem_rd_rsp_valid,
	/** Memory return read data: 32-bit one data beat */
	input  [31:0] from_mem_rd_rsp_data,
	/** Memory return read data: if current data beat is the last in this burst data transmission */
	input	      from_mem_rd_rsp_last,
	/** Acknowledgement from cache: ready to receive current data beat */
	output        to_mem_rd_rsp_ready,

	//Memory/IO write interface
	/** Cache sending memory/IO write request: valid signal */
	output        to_mem_wr_req_valid,
	/** Cache sending memory write request: address
	  * 4 byte alignment for I/O write 
	  * 4 byte alignment for cache write miss
          * 32 byte alignment for cache write-back */
	output [31:0] to_mem_wr_req_addr,
        /** Cache sending memory write request: burst length
          * 0 for I/O write (write only one data beat)
          * 0 for cache write miss (write only one data beat)
          * 7 for cache write-back (write eight data beats) */
	output [ 7:0] to_mem_wr_req_len,
        /** Acknowledgement from memory: ready to receive memory write request */
	input         from_mem_wr_req_ready,

	/** Cache sending memory/IO write data: valid signal for current data beat */
	output        to_mem_wr_data_valid,
	/** Cache sending memory/IO write data: current data beat */
	output [31:0] to_mem_wr_data,
	/** Cache sending memory/IO write data: write strobe
	  * 4'b1111 for cache write-back 
	  * other values for I/O write and cache write miss according to the original CPU request*/ 
	output [ 3:0] to_mem_wr_data_strb,
	/** Cache sending memory/IO write data: if current data beat is the last in this burst data transmission */
	output        to_mem_wr_data_last,
	/** Acknowledgement from memory/IO: ready to receive current data beat */
	input	      from_mem_wr_data_ready
);

  //TODO: Please add your D-Cache code here
	localparam S_WAIT     = 11'b00000000001;
	localparam S_TAG_RD   = 11'b00000000010;
	localparam S_EVICT    = 11'b00000000100;
	localparam S_WB_REQ   = 11'b00000001000;
	localparam S_WB_DATA  = 11'b00000010000;
	localparam S_MEM_RD   = 11'b00000100000;
	localparam S_RECV     = 11'b00001000000;
	localparam S_REFILL   = 11'b00010000000;
	localparam S_RESP     = 11'b00100000000;
	localparam S_CACHE_RD = 11'b01000000000;
	localparam S_CACHE_WR = 11'b10000000000;

	reg [10:0] current_state;
	reg [10:0] next_state;

	reg req_is_write_reg;
	reg [31:0] req_addr_reg;
	reg [31:0] req_wdata_reg;
	reg [3:0] req_wstrb_reg;
	wire [23:0] req_tag;
	wire [2:0] req_index;
	wire [2:0] req_word_offset;
	wire [31:0] req_line_addr;
	wire req_uncached;


	assign req_uncached = (req_addr_reg<32'h0000_0020)||(req_addr_reg>=32'h4000_0000);
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
	reg [3:0] dirty_array [0:`CACHE_SET-1];

	wire [3:0] way_hit;
	wire [3:0] store_way;
	wire Cache_Hit;
	wire Cache_Miss;
	wire Load_Hit;
	wire Load_Miss;
	wire Store_Hit;
	wire Store_Miss;

	assign way_hit[0] = valid_array[req_index][0] && (tag_rdata[0] == req_tag);
	assign way_hit[1] = valid_array[req_index][1] && (tag_rdata[1] == req_tag);
	assign way_hit[2] = valid_array[req_index][2] && (tag_rdata[2] == req_tag);
	assign way_hit[3] = valid_array[req_index][3] && (tag_rdata[3] == req_tag);
	
	assign Cache_Hit = |way_hit;
	assign Cache_Miss = ~Cache_Hit;

	assign Load_Hit = !req_is_write_reg && Cache_Hit;
	assign Load_Miss = !req_is_write_reg && Cache_Miss;

	assign Store_Hit = req_is_write_reg && Cache_Hit;
	assign Store_Miss = req_is_write_reg && Cache_Miss;

	assign store_way = Store_Miss ? victim_way_onehot:way_hit;
	reg [1:0] victim_array [0:`CACHE_SET-1];

	wire [1:0] victim_way;
	wire [3:0] victim_way_onehot;
	wire victim_valid;
	wire victim_dirty;
	wire need_writeback;

	assign victim_way = victim_array[req_index];

	assign victim_way_onehot = (victim_way==2'd0) ? 4'b0001:
								(victim_way==2'd1) ? 4'b0010:
								(victim_way==2'd2) ? 4'b0100:
								(victim_way==2'd3) ? 4'b1000:4'b0001;
	assign victim_valid = |(valid_array[req_index]&victim_way_onehot);
	assign victim_dirty = |(dirty_array[req_index]&victim_way_onehot);
	assign need_writeback = victim_valid && victim_dirty;

	reg [255:0] refill_line;
	reg [2:0] refill_cnt;
	wire refill_fire;
	wire [31:0] wb_data;
	reg [2:0] wb_cnt;
	wire wb_fire;

	assign refill_fire = from_mem_rd_rsp_valid && to_mem_rd_rsp_ready;
	assign wb_fire = to_mem_wr_data_valid && from_mem_wr_data_ready;

	assign tag_waddr = req_index;
	assign data_waddr = req_index;

	assign tag_wen = (current_state==S_REFILL)?victim_way_onehot:4'b0000;
	assign data_wen = (current_state==S_REFILL)?victim_way_onehot:
						(current_state==S_CACHE_WR)?store_way:4'b0000;

	assign tag_wdata = req_tag;
	assign data_wdata = (current_state==S_CACHE_WR)?store_line:refill_line;

	wire [255:0] hit_line;
	wire [255:0] resp_line;
	wire [31:0] resp_inst;
	wire [255:0] victim_line;
	wire [23:0] victim_tag;
	wire [31:0] victim_line_addr;

	reg [31:0] rsp_data_reg;

	assign hit_line = way_hit[0] ? data_rdata[0]:
						way_hit[1] ? data_rdata[1]:
						way_hit[2] ? data_rdata[2]:
						way_hit[3] ? data_rdata[3]:256'b0;
 
	assign victim_line = (victim_way==2'd0) ? data_rdata[0]:
							(victim_way==2'd1)?data_rdata[1]:
							(victim_way==2'd2)?data_rdata[2]:data_rdata[3];
	assign victim_tag = (victim_way==2'd0)?tag_rdata[0]:
							(victim_way==2'd1)?tag_rdata[1]:
							(victim_way==2'd2)?tag_rdata[2]:tag_rdata[3];
	assign victim_line_addr = {victim_tag,req_index,5'b0};

	wire [31:0] hit_word;
	wire [31:0] store_word;
	wire [255:0] store_line;
	wire [255:0] store_base_line;
	wire [31:0] store_base_word;

	assign hit_word=hit_line[req_word_offset*32+:32];
	assign store_base_line = (Store_Miss)?refill_line : hit_line;
	assign store_base_word = store_base_line[req_word_offset*32+:32];

	assign store_word = { 
		req_wstrb_reg[3]?req_wdata_reg[31:24]:store_base_word[31:24],
		req_wstrb_reg[2]?req_wdata_reg[23:16]:store_base_word[23:16],
		req_wstrb_reg[1]?req_wdata_reg[15:8]:store_base_word[15:8],
		req_wstrb_reg[0]?req_wdata_reg[7:0]:store_base_word[7:0]
	};

	assign store_line =
		(req_word_offset == 3'd0)?{store_base_line[255:32],store_word}:
		(req_word_offset == 3'd1)?{store_base_line[255:64],store_word,store_base_line[31:0]}:
		(req_word_offset == 3'd2)?{store_base_line[255:96],store_word,store_base_line[63:0]}:
		(req_word_offset == 3'd3)?{store_base_line[255:128],store_word,store_base_line[95:0]}:
		(req_word_offset == 3'd4)?{store_base_line[255:160],store_word,store_base_line[127:0]}:
		(req_word_offset == 3'd5)?{store_base_line[255:192],store_word,store_base_line[159:0]}:
		(req_word_offset == 3'd6)?{store_base_line[255:224],store_word,store_base_line[191:0]}:
		{store_word,store_base_line[223:0]};

	
	assign wb_data = victim_line[wb_cnt*32+:32];
	assign resp_line = (current_state == S_RESP && Cache_Miss) ? refill_line:hit_line;

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
				if (from_cpu_mem_req_valid)begin
					next_state = S_TAG_RD;
				end
				else begin
					next_state = S_WAIT;
				end
			end 
			S_TAG_RD:begin
				if (req_uncached && !req_is_write_reg)begin
					next_state = S_MEM_RD;
				end
				else if (req_uncached && req_is_write_reg)begin
					next_state = S_WB_REQ;
				end
				else if (Cache_Miss)begin
					next_state = S_EVICT;
				end
				else if (Load_Hit)begin
					next_state = S_CACHE_RD;
				end
				else if (Store_Hit)begin
					next_state = S_CACHE_WR;
				end
			end
			S_EVICT:begin
				if (need_writeback)begin
					next_state = S_WB_REQ;
				end
				else begin
					next_state = S_MEM_RD;
				end
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
					if (req_uncached)begin
						next_state = S_RESP;
					end
					else begin
						next_state = S_REFILL;
					end
				end
				else begin
					next_state = S_RECV;
				end
			end
			S_REFILL:begin
				if (req_is_write_reg)begin
					next_state = S_CACHE_WR;
				end
				else begin
					next_state = S_RESP;
				end
				
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
			S_CACHE_WR:begin
				next_state = S_WAIT;
			end
			S_WB_REQ:begin
				if (from_mem_wr_req_ready)begin
					next_state = S_WB_DATA;
				end
				else begin
					next_state = S_WB_REQ;
				end
			end
			S_WB_DATA:begin
				if (from_mem_wr_data_ready && to_mem_wr_data_last)begin
					if (req_uncached)begin
						next_state = S_WAIT;
					end
					else begin
						next_state = S_MEM_RD;
					end
				end
				else begin
					next_state = S_WB_DATA;
				end
			end
			default: begin
				next_state = S_WAIT;
			end
		endcase
	end

	integer i;
	always @(posedge clk) begin
		if (rst) begin
			req_is_write_reg <= 1'b0;
			req_addr_reg <= 32'b0;
			req_wdata_reg <= 32'b0;
			req_wstrb_reg <= 4'b0;

			for (i=0;i<8;i=i+1)begin
				valid_array[i] <= 4'b0000;
				victim_array[i] <= 2'b00;
				dirty_array[i] <= 4'b0000;
			end

			refill_cnt <= 3'b0;
			refill_line <= 256'b0;
			rsp_data_reg <= 32'b0;
			wb_cnt <= 3'b0;
		end
		else begin
			if (current_state==S_WAIT && from_cpu_mem_req_valid)begin
				req_is_write_reg <= from_cpu_mem_req;
				req_addr_reg <= from_cpu_mem_req_addr;
				req_wdata_reg <= from_cpu_mem_req_wdata;
				req_wstrb_reg <= from_cpu_mem_req_wstrb;
			end
			else if (current_state==S_MEM_RD && from_mem_rd_req_ready)begin
				refill_cnt <= 3'b0;
				refill_line <= 256'b0;
			end
			else if (current_state==S_RECV && refill_fire)begin
				if (req_uncached)begin
					rsp_data_reg <= from_mem_rd_rsp_data;
				end
				else begin
					refill_line[refill_cnt*32+:32] <= from_mem_rd_rsp_data;
					refill_cnt <= refill_cnt + 3'd1;
				end
			end
			else if (current_state==S_REFILL)begin
				valid_array[req_index] <= valid_array[req_index] | victim_way_onehot;
				victim_array[req_index] <= victim_array[req_index] + 2'd1;
				if (!req_is_write_reg)begin
					dirty_array[req_index] <= dirty_array[req_index] & ~victim_way_onehot;
				end
				rsp_data_reg <= refill_line[req_word_offset * 32 +: 32];
			end
			else if (current_state==S_CACHE_RD)begin
				rsp_data_reg <= resp_inst;
			end
			else if (current_state==S_CACHE_WR)begin
				dirty_array[req_index] <= dirty_array[req_index] | store_way;
			end
			else if (current_state==S_WB_REQ && from_mem_wr_req_ready)begin
				wb_cnt <= 3'b0;
			end
			else if (current_state==S_WB_DATA && wb_fire && to_mem_wr_data_last)begin
				if(!req_uncached)begin
					dirty_array[req_index] <= dirty_array[req_index] & ~victim_way_onehot;
				end
				wb_cnt <= wb_cnt +3'b1;
			end
			else if (current_state==S_WB_DATA && wb_fire)begin
				wb_cnt <= wb_cnt +3'b1;
			end

		end
	end
	assign to_cpu_mem_req_ready = (current_state==S_WAIT && from_cpu_mem_req_valid && !from_cpu_mem_req)
								||(current_state==S_CACHE_WR)
								||(current_state==S_WB_DATA && req_uncached && wb_fire && to_mem_wr_data_last);

	assign to_mem_rd_req_valid = (current_state==S_MEM_RD);
	assign to_mem_rd_req_addr = req_uncached?req_addr_reg:req_line_addr;
	assign to_mem_rd_req_len = req_uncached?8'd0:8'd7;
	assign to_mem_rd_rsp_ready = (current_state==S_RECV);

	assign to_mem_wr_req_valid = (current_state==S_WB_REQ);
	assign to_mem_wr_req_addr =req_uncached?req_addr_reg:victim_line_addr;
	assign to_mem_wr_req_len = req_uncached?8'd0:8'd7;

	assign to_mem_wr_data_valid = (current_state==S_WB_DATA);
	assign to_mem_wr_data=req_uncached?req_wdata_reg:wb_data;
	assign to_mem_wr_data_strb = req_uncached?req_wstrb_reg:4'b1111;
	assign to_mem_wr_data_last = req_uncached?1'b1:(wb_cnt==3'd7);

	assign to_cpu_cache_rsp_valid = (current_state==S_RESP) && !req_is_write_reg;
	assign to_cpu_cache_rsp_data = rsp_data_reg;
endmodule

