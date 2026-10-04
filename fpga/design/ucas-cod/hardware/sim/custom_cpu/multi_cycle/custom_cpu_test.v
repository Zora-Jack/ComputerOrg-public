`timescale 10ns / 1ns

module custom_cpu_test(
	input sys_clk,
	input sys_reset_n
);
	
	cpu_test_top    u_cpu_test (
		.sys_clk	(sys_clk),
		.sys_reset_n	(sys_reset_n)
	);
	
	cpu_test_top_golden    u_cpu_test_golden (
		.sys_clk	(sys_clk),
		.sys_reset_n	(sys_reset_n)
	);

	`define RST u_cpu_test.u_cpu.rst

	`define PC              u_cpu_test.u_cpu.PC
	`define INST_REQ_VALID	u_cpu_test.u_cpu.Inst_Req_Valid
	`define INST_REQ_READY	u_cpu_test.u_cpu.Inst_Req_Ready

	`define PC_GOLDEN		u_cpu_test_golden.u_cpu.PC
	`define INST_REQ_VALID_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Req_Valid
	`define INST_REQ_READY_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Req_Ready

	`define INST_VALID	u_cpu_test.u_cpu.Inst_Valid
	`define INST_READY	u_cpu_test.u_cpu.Inst_Ready

	`define INST_VALID_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Valid
	`define INST_READY_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Ready

	`define MEM_WEN		 u_cpu_test.u_cpu.MemWrite
	`define MEM_ADDR	 u_cpu_test.u_cpu.Address
	`define MEM_WSTRB	 u_cpu_test.u_cpu.Write_strb
	`define MEM_WDATA	 u_cpu_test.u_cpu.Write_data
	`define MEM_READ	 u_cpu_test.u_cpu.MemRead
	`define MEM_REQ_READY    u_cpu_test.u_cpu.Mem_Req_Ack

	`define MEM_WEN_GOLDEN	      u_cpu_test_golden.u_cpu.MemWrite
	`define MEM_ADDR_GOLDEN	      u_cpu_test_golden.u_cpu.Address
	`define MEM_WSTRB_GOLDEN      u_cpu_test_golden.u_cpu.Write_strb
	`define MEM_WDATA_GOLDEN      u_cpu_test_golden.u_cpu.Write_data
	`define MEM_READ_GOLDEN	      u_cpu_test_golden.u_cpu.MemRead
	`define MEM_REQ_READY_GOLDEN  u_cpu_test_golden.u_cpu.Mem_Req_Ack

	`define DATA_VALID	u_cpu_test.u_cpu.Read_data_Valid
	`define DATA_READY	u_cpu_test.u_cpu.Read_data_Ready

	`define DATA_VALID_GOLDEN     u_cpu_test_golden.u_cpu.Read_data_Valid
	`define DATA_READY_GOLDEN     u_cpu_test_golden.u_cpu.Read_data_Ready

	`define FIFO_EMPTY  u_cpu_test.u_uart_sim.empty_fifo


	reg benchmark_finish;

	wire [31:0] mask_strb = {{8{`MEM_WSTRB_GOLDEN[3]}},
				 {8{`MEM_WSTRB_GOLDEN[2]}},
				 {8{`MEM_WSTRB_GOLDEN[1]}},
				 {8{`MEM_WSTRB_GOLDEN[0]}}};

	always @(posedge sys_clk)
	begin
		if(`RST)
			benchmark_finish <= 1'b0;
		else // if(!`RST)
		begin
			if (`INST_REQ_VALID !== `INST_REQ_VALID_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns.", $time);
				$display("Yours:     Inst_Req_Valid = 0x%h", `INST_REQ_VALID);
				$display("Reference: Inst_Req_Valid = 0x%h", `INST_REQ_VALID_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if ((`INST_REQ_VALID == 1'b1) & (`PC !== `PC_GOLDEN))
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns.", $time);
				$display("Yours:     Inst_Req_Valid = 1, PC = 0x%h", `PC);
				$display("Reference: Inst_Req_Valid = 1, PC = 0x%h", `PC_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if (`INST_READY !== `INST_READY_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     Inst_Ready = 0x%h", `INST_READY);
				$display("Reference: Inst_Ready = 0x%h", `INST_READY_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if (`MEM_READ_GOLDEN !== `MEM_READ)
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemRead = 0x%h", `MEM_READ);
				$display("Reference: MemRead = 0x%h", `MEM_READ_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if (`MEM_WEN_GOLDEN !== `MEM_WEN)
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemWrite = 0x%h", `MEM_WEN);
				$display("Reference: MemWrite = 0x%h", `MEM_WEN_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if ((`MEM_READ == 1'b1) & (`MEM_ADDR_GOLDEN[31:2] !== `MEM_ADDR[31:2]))
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemRead Address & 0xfffffffc = 0x%h", {`MEM_ADDR[31:2],        2'b0});
				$display("Reference: MemRead Address & 0xfffffffc = 0x%h", {`MEM_ADDR_GOLDEN[31:2], 2'b0});
				$display("=================================================");
				$fatal;
			end

			else if ((`MEM_WEN == 1'b1) & (`MEM_ADDR_GOLDEN[31:2] !== `MEM_ADDR[31:2]))
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemWrite Address & 0xfffffffc = 0x%h", {`MEM_ADDR[31:2],        2'b0});
				$display("Reference: MemWrite Address & 0xfffffffc = 0x%h", {`MEM_ADDR_GOLDEN[31:2], 2'b0});
				$display("=================================================");
				$fatal;
			end

			else if ((`MEM_WEN == 1'b1) & (`MEM_WSTRB_GOLDEN !== `MEM_WSTRB))
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     Write_strb = 0x%h", `MEM_WSTRB);
				$display("Reference: Write_strb = 0x%h", `MEM_WSTRB_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if ((`MEM_WEN == 1'b1) & ((`MEM_WDATA_GOLDEN & mask_strb) !== (`MEM_WDATA & mask_strb)))
			begin
				if ((`MEM_WDATA_GOLDEN != 32'd0) | (`MEM_WDATA !== 32'hxxxxxxxx))
				begin
					$display("=================================================");
					$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
					$display("Yours:     Write_data & 0x%h = 0x%h", mask_strb, `MEM_WDATA & mask_strb);
					$display("Reference: Write_data & 0x%h = 0x%h", mask_strb, `MEM_WDATA_GOLDEN & mask_strb);
					$display("=================================================");
					$fatal;
				end
			end

			else if (`DATA_READY !== `DATA_READY_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %d0ns, PC = 0x%h.", $time, `PC);
				$display("Yours:     Read_data_Ready = 0x%h", `DATA_READY);
				$display("Reference: Read_data_Ready = 0x%h", `DATA_READY_GOLDEN);
				$display("=================================================");
				$fatal;
			end

			else if ((`MEM_WEN == 1'b1) & (`MEM_ADDR == 32'h0C) & (`MEM_WDATA == 32'h0))
			begin
				/*$display("");
				$display("=================================================");
				$display("Benchmark simulation passed!!!");
				$display("=================================================");
				$fatal;*/
				benchmark_finish <= 1'b1;
			end

			else if (benchmark_finish & `FIFO_EMPTY)
			begin
				$display("=================================================");
				$display("Benchmark simulation passed!!!");
				$display("=================================================");
				$finish;
			end
		end
	end

	integer trace_file, type_num;
    integer ret;

	wire [31:0] pc_rt = u_cpu_test.u_cpu.inst_retire[31:0];
    wire [31:0] rf_wdata_rt = u_cpu_test.u_cpu.inst_retire[63:32];
    wire [ 4:0] rf_waddr_rt = u_cpu_test.u_cpu.inst_retire[68:64];
    wire        rf_en_rt = u_cpu_test.u_cpu.inst_retire[69];
	
	reg [31:0]  new_PC_ref;
    reg [31:0]  rf_bit_cmp_ref;
    reg [31:0]  mem_addr_ref, mem_wdata_ref, mem_bit_cmp_ref;
    reg [3:0]   mem_wstrb_ref;
    reg         mem_read_ref;
	reg  [31:0] pc_golden;
    reg  [31:0] rf_wdata_golden;
    reg  [ 4:0] rf_waddr_golden;
    reg         trace_end;
	reg [4095:0] trace_filename;

	initial begin
        $value$plusargs("TRACE_FILE=%s", trace_filename);
        trace_file = $fopen(trace_filename, "r");
        if (trace_file == 0) begin
            $display("INFO: open trace failed.");
        end
    end
	    
	task read_trace; begin
        if ($feof(trace_file)) trace_end = 1'b1;
        // It's OK to continue read file after feof is true, because scanf will return fault value rather than throw error.
        ret = $fscanf(trace_file, "%d", type_num);
        ret = $fscanf(trace_file, "%h", pc_golden);
        case (type_num)
            1: ret = $fscanf(trace_file, "%d %h %h %d", rf_waddr_golden, rf_wdata_golden, rf_bit_cmp_ref, mem_read_ref);
            2: ret = $fscanf(trace_file, "%h %h %h %h", mem_addr_ref, mem_wstrb_ref, mem_wdata_ref, mem_bit_cmp_ref);
            3: ret = $fscanf(trace_file, "%h", new_PC_ref);
            4: ret = $fscanf(trace_file, "%h %d %h", new_PC_ref, rf_waddr_golden, rf_wdata_golden);
            default: begin
                $display("ERROR: unknown type.");
                $fclose(trace_file);
                $fatal;
            end
        endcase
		if (ret == 0 || ret == -1) trace_end = 1'b1;
        end
    endtask

	// Get golden records & Compare result
    always @(posedge sys_clk) begin
        if (~sys_reset_n) begin
            trace_end = 1'b0;
        end else if(trace_file != 0) begin
            if ($feof(trace_file)) trace_end = 1'b1;
            if (rf_en_rt & rf_waddr_rt != 5'd0 && ~trace_end) begin
                read_trace;

                while ((type_num != 1 || rf_waddr_golden == 5'b0) && type_num != 4) begin
                    if ($feof(trace_file)) begin
                        trace_end = 1'b1;
                        break;
                    end
                    read_trace;
                end

                if (~trace_end && ((pc_rt !== pc_golden) || (rf_waddr_rt !== rf_waddr_golden) || ((rf_wdata_rt & rf_bit_cmp_ref) !== (rf_wdata_golden & rf_bit_cmp_ref))))
                begin
                    $display("===================================================================");
                    $display("ERROR: at %d0ns.", $time);
                    $display("Yours:     PC = 0x%8h, rf_waddr = 0x%2h, rf_wdata = 0x%8h", pc_rt, rf_waddr_rt, rf_wdata_rt);
                    $display("Reference: PC = 0x%8h, rf_waddr = 0x%2h, rf_wdata = 0x%8h", pc_golden, rf_waddr_golden, rf_wdata_golden);
                    $display("===================================================================");
                    $fclose(trace_file);
                    $fatal;
                end
            end
        end
    end
	
	reg [4095:0] dumpfile;
	initial begin
		if ($value$plusargs("DUMP=%s", dumpfile)) begin
			$dumpfile(dumpfile);
			$dumpvars();
		end
	end

endmodule
