`timescale 10ns / 1ns

module custom_cpu_test (
    input sys_clk,
    input sys_reset_n
);

    cpu_test_top_golden    u_cpu_test_golden (
		.sys_clk	(sys_clk),
		.sys_reset_n	(sys_reset_n)
	);

`define GLOBAL_RESULT u_cpu_test_golden.u_axi_ram_wrap.ram.mem[3]

    wire [31:0] pc_rt = u_cpu_test_golden.u_cpu.inst_retire[31:0];
    wire [31:0] rf_wdata_rt = u_cpu_test_golden.u_cpu.inst_retire[63:32];
    wire [ 4:0] rf_waddr_rt = u_cpu_test_golden.u_cpu.inst_retire[68:64];
    wire        rf_en_rt = u_cpu_test_golden.u_cpu.inst_retire[69];

    // Open trace file
    integer trace_file, type_num, ret;
    reg [4095:0] trace_filename;
    initial begin
        $value$plusargs("TRACE_FILE=%s", trace_filename);
        trace_file = $fopen(trace_filename, "w");
        if (trace_file == 0) begin
            $display("ERROR: open file failed. Please compile the software");
            $fatal;
        end
    end


    always @(posedge sys_clk) begin
        if (rf_en_rt & rf_waddr_rt != 5'd0) begin
            $fwrite(trace_file, "1 %h %d %h %h %d\n",pc_rt,rf_waddr_rt, rf_wdata_rt, 32'hffffffff, 0);
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

endmodule
