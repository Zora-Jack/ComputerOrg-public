`timescale 10ns / 1ns

module custom_cpu_test (
    input sys_clk,
    input sys_reset_n
);

    cpu_test_top u_cpu_test (
        .sys_clk    (sys_clk),
        .sys_reset_n(sys_reset_n)
    );

`define GLOBAL_RESULT u_cpu_test.u_axi_ram_wrap.ram.mem[3]

    wire [31:0] pc_rt = u_cpu_test.u_cpu.inst_retire[31:0];
    wire [31:0] rf_wdata_rt = u_cpu_test.u_cpu.inst_retire[63:32];
    wire [ 4:0] rf_waddr_rt = u_cpu_test.u_cpu.inst_retire[68:64];
    wire        rf_en_rt = u_cpu_test.u_cpu.inst_retire[69];

    reg  [31:0] pc_golden;
    reg  [31:0] rf_wdata_golden;
    reg  [ 4:0] rf_waddr_golden;

    // Open trace file
    integer trace_file, type_num, ret;
    reg [4095:0] trace_filename;
    initial begin
        $value$plusargs("TRACE_FILE=%s", trace_filename);
        trace_file = $fopen(trace_filename, "r");
        if (trace_file == 0) begin
            $display("ERROR: open file failed.");
            $fatal;
        end
    end


    reg [31:0] PC_ref, new_PC_ref;
    reg [31:0] rf_bit_cmp_ref;
    reg [31:0] mem_addr_ref, mem_wdata_ref, mem_bit_cmp_ref;
    reg [3:0] mem_wstrb_ref;
    reg       mem_read_ref;

    reg       trace_end;

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
        end else begin
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

    always @(posedge sys_clk) begin
        if (`GLOBAL_RESULT == 32'h0) begin
            $display("=================================================");
            $display("Hit good trap");
            $display("=================================================");
            $finish;
        end
        if (`GLOBAL_RESULT == 32'h1) begin
            $display("=================================================");
            $display("ERROR: Hit bad trap");
            $display("=================================================");
            $finish;
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
