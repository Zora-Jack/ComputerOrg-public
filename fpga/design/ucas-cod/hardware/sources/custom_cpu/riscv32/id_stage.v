`include "cpu_defs.vh"

module id_stage(
    input  [31:0] inst,

    output [4:0]  rs1,
    output [4:0]  rs2,
    output [4:0]  rd,
    output [2:0]  funct3,
    output [6:0]  funct7,
    output [4:0]  shamt,
    output        inst30,

    output [31:0] imm,

    output        Lui,
    output        Auipc,
    output        Jal,
    output        Jalr,
    output        J,
    output        L,
    output        S,
    output        I,
    output        R,

    output        reg_wen,
    output [1:0]  wb_sel
);

    wire [6:0] opcode = inst[6:0];

    assign Lui   = opcode == `LUI;
    assign Auipc = opcode == `AUIPC;
    assign Jal   = opcode == `JAL;
    assign Jalr  = opcode == `JALR;

    assign J = (opcode[6] == `J_type) & (opcode[2:0] == `U_type);
    assign L = (opcode[5:4] == `L_type) & (opcode[2:0] == `U_type);
    assign S = (~(opcode[6] == `J_type)) &
               (opcode[5:4] == `S_type) &
               (opcode[2:0] == `U_type);
    assign I = (opcode[5:4] == `I_type) & (opcode[2:0] == `U_type);
    assign R = (opcode[5:4] == `R_type) & (opcode[2:0] == `U_type);

    assign rd     = inst[11:7];
    assign funct3 = inst[14:12];
    assign funct7 = inst[31:25];
    assign rs1    = inst[19:15];
    assign rs2    = inst[24:20];
    assign shamt  = inst[24:20];
    assign inst30 = inst[30];

    assign reg_wen =
        Lui || Auipc || I || R || L || Jal || Jalr;

    assign wb_sel =
        L ? 2'b01 :
        (Jal || Jalr) ? 2'b10 :
        2'b00;

    wire [31:0] imm32 = {
        inst[31:12],
        12'b0
    };

    wire [31:0] imm20 = {
        {12{inst[31]}},
        inst[19:12],
        inst[20],
        inst[30:21],
        1'b0
    };

    wire [31:0] imm121 = {
        {20{inst[31]}},
        inst[7],
        inst[30:25],
        inst[11:8],
        1'b0
    };

    wire [31:0] imm122 = {
        {20{inst[31]}},
        inst[31:20]
    };

    wire [31:0] imm123 = {
        {20{inst[31]}},
        inst[31:25],
        inst[11:7]
    };

    assign imm =
        (Lui || Auipc) ? imm32  :
        Jal            ? imm20  :
        J              ? imm121 :
        Jalr           ? imm122 :
        L              ? imm122 :
        I              ? imm122 :
        S              ? imm123 :
                         32'b0;

endmodule