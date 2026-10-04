`timescale 10ns / 1ns

module if_stage(
    input         clk,
    input         rst,

    input         mem_stall,
    input         data_stall,
    input         ex_redirect,
    input  [31:0] ex_redirect_pc,

    output [31:0] PC,
    output        Inst_Req_Valid,
    input         Inst_Req_Ready,

    input  [31:0] Instruction,
    input         Inst_Valid,
    output        Inst_Ready,

    output        rst_ready,
    output        if_req_fire,
    output        if_resp_fire,
    output        if_req_valid_o,
    output        if_wait_resp_o,
    output        if_discard_resp_o,
    output        if_buf_valid_o,

    output        if_id_fetch_valid,
    output [31:0] if_id_fetch_pc,
    output [31:0] if_id_fetch_inst
);

    reg [31:0] pc_reg;
    reg        if_req_valid;
    reg        if_wait_resp;
    reg [31:0] if_req_pc;
    reg        if_discard_resp;
    reg        rst_ready_r;
    reg        if_buf_valid;
    reg [31:0] if_buf_pc;
    reg [31:0] if_buf_inst;

    assign PC = (if_req_valid || if_wait_resp) ? if_req_pc : pc_reg;
    assign Inst_Req_Valid = !rst && if_req_valid;

    assign if_req_fire  = Inst_Req_Valid && Inst_Req_Ready;
    assign if_resp_fire = Inst_Valid && Inst_Ready;

    wire [31:0] if_next_req_pc =
        (if_req_fire && !if_discard_resp && !ex_redirect) ? (if_req_pc + 32'd4) :
        pc_reg;

    wire if_can_req =
        !if_req_valid &&
        (!if_wait_resp || if_resp_fire) &&
        !if_discard_resp &&
        !if_buf_valid &&
        !mem_stall &&
        !data_stall &&
        !ex_redirect;

    assign Inst_Ready =
        rst ||
        rst_ready_r ||
        (
            if_wait_resp &&
            (!if_buf_valid || if_discard_resp || ex_redirect)
        );

    wire [31:0] if_resp_pc = if_req_pc;

    assign rst_ready = rst_ready_r;
    assign if_req_valid_o = if_req_valid;
    assign if_wait_resp_o = if_wait_resp;
    assign if_discard_resp_o = if_discard_resp;
    assign if_buf_valid_o = if_buf_valid;

    assign if_id_fetch_valid =
        if_buf_valid ||
        (if_resp_fire && !if_discard_resp);
    assign if_id_fetch_pc = if_buf_valid ? if_buf_pc : if_resp_pc;
    assign if_id_fetch_inst = if_buf_valid ? if_buf_inst : Instruction;

    always @(posedge clk) begin
        if (rst) begin
            pc_reg          <= 32'b0;
            if_req_valid    <= 1'b0;
            if_wait_resp    <= 1'b0;
            if_req_pc       <= 32'b0;
            if_discard_resp <= 1'b0;
            rst_ready_r     <= 1'b1;
            if_buf_valid    <= 1'b0;
            if_buf_pc       <= 32'b0;
            if_buf_inst     <= 32'b0;
        end
        else begin
            rst_ready_r <= 1'b0;

            if (if_resp_fire) begin
                if_wait_resp    <= 1'b0;
                if_discard_resp <= 1'b0;
            end

            if (if_req_fire) begin
                if_req_valid <= 1'b0;
                if_wait_resp <= 1'b1;

                if (!if_discard_resp && !ex_redirect) begin
                    pc_reg <= if_req_pc + 32'd4;
                end
            end
            else if (if_can_req) begin
                if_req_valid <= 1'b1;
                if_req_pc    <= if_next_req_pc;
            end

            if (mem_stall) begin
                if (if_resp_fire && !if_discard_resp && !ex_redirect) begin
                    if_buf_valid <= 1'b1;
                    if_buf_pc    <= if_resp_pc;
                    if_buf_inst  <= Instruction;
                end
            end
            else begin
                if (ex_redirect) begin
                    pc_reg <= ex_redirect_pc;
                    if_buf_valid <= 1'b0;

                    if (if_resp_fire) begin
                        if_discard_resp <= 1'b0;
                    end
                    else if (if_wait_resp || if_req_valid || if_req_fire) begin
                        if_discard_resp <= 1'b1;
                    end
                end
                else if (data_stall) begin
                    if (if_resp_fire && !if_discard_resp) begin
                        if_buf_valid <= 1'b1;
                        if_buf_pc    <= if_resp_pc;
                        if_buf_inst  <= Instruction;
                    end
                end
                else begin
                    if (if_buf_valid) begin
                        if_buf_valid <= 1'b0;
                    end
                    else if (if_resp_fire) begin
                        if (if_discard_resp) begin
                            if_discard_resp <= 1'b0;
                        end
                    end
                end
            end
        end
    end

endmodule
