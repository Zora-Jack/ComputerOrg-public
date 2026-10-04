// DESCRIPTION: Verilator generated Verilog
// Wrapper module for DPI protected library
// This module requires libcustom_cpu_golden.a or libcustom_cpu_golden.so to work
// See instructions in your simulator for how to use DPI libraries

module custom_cpu_golden (
        input logic clk
        , input logic rst
        , output logic Inst_Req_Valid
        , input logic Inst_Req_Ready
        , input logic Inst_Valid
        , output logic Inst_Ready
        , output logic MemWrite
        , output logic [3:0]  Write_strb
        , output logic MemRead
        , input logic Mem_Req_Ready
        , input logic Read_data_Valid
        , output logic Read_data_Ready
        , input logic intr
        , output logic RF_wen
        , output logic [4:0]  RF_waddr
        , output logic [31:0]  PC
        , input logic [31:0]  Instruction
        , output logic [31:0]  Address
        , output logic [31:0]  Write_data
        , input logic [31:0]  Read_data
        , output logic [31:0]  cpu_perf_cnt_0
        , output logic [31:0]  cpu_perf_cnt_1
        , output logic [31:0]  cpu_perf_cnt_2
        , output logic [31:0]  cpu_perf_cnt_3
        , output logic [31:0]  cpu_perf_cnt_4
        , output logic [31:0]  cpu_perf_cnt_5
        , output logic [31:0]  cpu_perf_cnt_6
        , output logic [31:0]  cpu_perf_cnt_7
        , output logic [31:0]  cpu_perf_cnt_8
        , output logic [31:0]  cpu_perf_cnt_9
        , output logic [31:0]  cpu_perf_cnt_10
        , output logic [31:0]  cpu_perf_cnt_11
        , output logic [31:0]  cpu_perf_cnt_12
        , output logic [31:0]  cpu_perf_cnt_13
        , output logic [31:0]  cpu_perf_cnt_14
        , output logic [31:0]  cpu_perf_cnt_15
        , output logic [31:0]  register_01
        , output logic [31:0]  register_02
        , output logic [31:0]  register_03
        , output logic [31:0]  register_04
        , output logic [31:0]  register_05
        , output logic [31:0]  register_06
        , output logic [31:0]  register_07
        , output logic [31:0]  register_08
        , output logic [31:0]  register_09
        , output logic [31:0]  register_10
        , output logic [31:0]  register_11
        , output logic [31:0]  register_12
        , output logic [31:0]  register_13
        , output logic [31:0]  register_14
        , output logic [31:0]  register_15
        , output logic [31:0]  register_16
        , output logic [31:0]  register_17
        , output logic [31:0]  register_18
        , output logic [31:0]  register_19
        , output logic [31:0]  register_20
        , output logic [31:0]  register_21
        , output logic [31:0]  register_22
        , output logic [31:0]  register_23
        , output logic [31:0]  register_24
        , output logic [31:0]  register_25
        , output logic [31:0]  register_26
        , output logic [31:0]  register_27
        , output logic [31:0]  register_28
        , output logic [31:0]  register_29
        , output logic [31:0]  register_30
        , output logic [31:0]  register_31
        , output logic [31:0]  RF_wdata
    );
    
    // Precision of submodule (commented out to avoid requiring timescale on all modules)
    // timeunit 10ns;
    // timeprecision 1ns;
    
    // Checks to make sure the .sv wrapper and library agree
    import "DPI-C" function void custom_cpu_golden_protectlib_check_hash(int protectlib_hash__V);
        
        // Creates an instance of the library module at initial-time
        // (one for each instance in the user's design) also evaluates
        // the library module's initial process
        import "DPI-C" function chandle custom_cpu_golden_protectlib_create(string scope__V);
            
            // Updates all non-clock inputs and retrieves the results
            import "DPI-C" function longint custom_cpu_golden_protectlib_combo_update (
                    chandle handle__V
                    , input logic rst
                    , output logic Inst_Req_Valid
                    , input logic Inst_Req_Ready
                    , input logic Inst_Valid
                    , output logic Inst_Ready
                    , output logic MemWrite
                    , output logic [3:0]  Write_strb
                    , output logic MemRead
                    , input logic Mem_Req_Ready
                    , input logic Read_data_Valid
                    , output logic Read_data_Ready
                    , input logic intr
                    , output logic RF_wen
                    , output logic [4:0]  RF_waddr
                    , output logic [31:0]  PC
                    , input logic [31:0]  Instruction
                    , output logic [31:0]  Address
                    , output logic [31:0]  Write_data
                    , input logic [31:0]  Read_data
                    , output logic [31:0]  cpu_perf_cnt_0
                    , output logic [31:0]  cpu_perf_cnt_1
                    , output logic [31:0]  cpu_perf_cnt_2
                    , output logic [31:0]  cpu_perf_cnt_3
                    , output logic [31:0]  cpu_perf_cnt_4
                    , output logic [31:0]  cpu_perf_cnt_5
                    , output logic [31:0]  cpu_perf_cnt_6
                    , output logic [31:0]  cpu_perf_cnt_7
                    , output logic [31:0]  cpu_perf_cnt_8
                    , output logic [31:0]  cpu_perf_cnt_9
                    , output logic [31:0]  cpu_perf_cnt_10
                    , output logic [31:0]  cpu_perf_cnt_11
                    , output logic [31:0]  cpu_perf_cnt_12
                    , output logic [31:0]  cpu_perf_cnt_13
                    , output logic [31:0]  cpu_perf_cnt_14
                    , output logic [31:0]  cpu_perf_cnt_15
                    , output logic [31:0]  register_01
                    , output logic [31:0]  register_02
                    , output logic [31:0]  register_03
                    , output logic [31:0]  register_04
                    , output logic [31:0]  register_05
                    , output logic [31:0]  register_06
                    , output logic [31:0]  register_07
                    , output logic [31:0]  register_08
                    , output logic [31:0]  register_09
                    , output logic [31:0]  register_10
                    , output logic [31:0]  register_11
                    , output logic [31:0]  register_12
                    , output logic [31:0]  register_13
                    , output logic [31:0]  register_14
                    , output logic [31:0]  register_15
                    , output logic [31:0]  register_16
                    , output logic [31:0]  register_17
                    , output logic [31:0]  register_18
                    , output logic [31:0]  register_19
                    , output logic [31:0]  register_20
                    , output logic [31:0]  register_21
                    , output logic [31:0]  register_22
                    , output logic [31:0]  register_23
                    , output logic [31:0]  register_24
                    , output logic [31:0]  register_25
                    , output logic [31:0]  register_26
                    , output logic [31:0]  register_27
                    , output logic [31:0]  register_28
                    , output logic [31:0]  register_29
                    , output logic [31:0]  register_30
                    , output logic [31:0]  register_31
                    , output logic [31:0]  RF_wdata
                );
                
                // Updates all clocks and retrieves the results
                import "DPI-C" function longint custom_cpu_golden_protectlib_seq_update(
                        chandle handle__V
                        , input logic clk
                        , output logic Inst_Req_Valid
                        , output logic Inst_Ready
                        , output logic MemWrite
                        , output logic [3:0]  Write_strb
                        , output logic MemRead
                        , output logic Read_data_Ready
                        , output logic RF_wen
                        , output logic [4:0]  RF_waddr
                        , output logic [31:0]  PC
                        , output logic [31:0]  Address
                        , output logic [31:0]  Write_data
                        , output logic [31:0]  cpu_perf_cnt_0
                        , output logic [31:0]  cpu_perf_cnt_1
                        , output logic [31:0]  cpu_perf_cnt_2
                        , output logic [31:0]  cpu_perf_cnt_3
                        , output logic [31:0]  cpu_perf_cnt_4
                        , output logic [31:0]  cpu_perf_cnt_5
                        , output logic [31:0]  cpu_perf_cnt_6
                        , output logic [31:0]  cpu_perf_cnt_7
                        , output logic [31:0]  cpu_perf_cnt_8
                        , output logic [31:0]  cpu_perf_cnt_9
                        , output logic [31:0]  cpu_perf_cnt_10
                        , output logic [31:0]  cpu_perf_cnt_11
                        , output logic [31:0]  cpu_perf_cnt_12
                        , output logic [31:0]  cpu_perf_cnt_13
                        , output logic [31:0]  cpu_perf_cnt_14
                        , output logic [31:0]  cpu_perf_cnt_15
                        , output logic [31:0]  register_01
                        , output logic [31:0]  register_02
                        , output logic [31:0]  register_03
                        , output logic [31:0]  register_04
                        , output logic [31:0]  register_05
                        , output logic [31:0]  register_06
                        , output logic [31:0]  register_07
                        , output logic [31:0]  register_08
                        , output logic [31:0]  register_09
                        , output logic [31:0]  register_10
                        , output logic [31:0]  register_11
                        , output logic [31:0]  register_12
                        , output logic [31:0]  register_13
                        , output logic [31:0]  register_14
                        , output logic [31:0]  register_15
                        , output logic [31:0]  register_16
                        , output logic [31:0]  register_17
                        , output logic [31:0]  register_18
                        , output logic [31:0]  register_19
                        , output logic [31:0]  register_20
                        , output logic [31:0]  register_21
                        , output logic [31:0]  register_22
                        , output logic [31:0]  register_23
                        , output logic [31:0]  register_24
                        , output logic [31:0]  register_25
                        , output logic [31:0]  register_26
                        , output logic [31:0]  register_27
                        , output logic [31:0]  register_28
                        , output logic [31:0]  register_29
                        , output logic [31:0]  register_30
                        , output logic [31:0]  register_31
                        , output logic [31:0]  RF_wdata
                    );
                    
                    // Need to convince some simulators that the input to the module
                    // must be evaluated before evaluating the clock edge
                    import "DPI-C" function void custom_cpu_golden_protectlib_combo_ignore(
                            chandle handle__V
                            , input logic rst
                            , input logic Inst_Req_Ready
                            , input logic Inst_Valid
                            , input logic Mem_Req_Ready
                            , input logic Read_data_Valid
                            , input logic intr
                            , input logic [31:0]  Instruction
                            , input logic [31:0]  Read_data
                        );
                        
                        // Evaluates the library module's final process
                        import "DPI-C" function void custom_cpu_golden_protectlib_final(chandle handle__V);
                            
                            // verilator tracing_off
                            chandle handle__V;
                            time last_combo_seqnum__V;
                            time last_seq_seqnum__V;

                            logic Inst_Req_Valid_combo__V;
                            logic Inst_Ready_combo__V;
                            logic MemWrite_combo__V;
                            logic [3:0]  Write_strb_combo__V;
                            logic MemRead_combo__V;
                            logic Read_data_Ready_combo__V;
                            logic RF_wen_combo__V;
                            logic [4:0]  RF_waddr_combo__V;
                            logic [31:0]  PC_combo__V;
                            logic [31:0]  Address_combo__V;
                            logic [31:0]  Write_data_combo__V;
                            logic [31:0]  cpu_perf_cnt_0_combo__V;
                            logic [31:0]  cpu_perf_cnt_1_combo__V;
                            logic [31:0]  cpu_perf_cnt_2_combo__V;
                            logic [31:0]  cpu_perf_cnt_3_combo__V;
                            logic [31:0]  cpu_perf_cnt_4_combo__V;
                            logic [31:0]  cpu_perf_cnt_5_combo__V;
                            logic [31:0]  cpu_perf_cnt_6_combo__V;
                            logic [31:0]  cpu_perf_cnt_7_combo__V;
                            logic [31:0]  cpu_perf_cnt_8_combo__V;
                            logic [31:0]  cpu_perf_cnt_9_combo__V;
                            logic [31:0]  cpu_perf_cnt_10_combo__V;
                            logic [31:0]  cpu_perf_cnt_11_combo__V;
                            logic [31:0]  cpu_perf_cnt_12_combo__V;
                            logic [31:0]  cpu_perf_cnt_13_combo__V;
                            logic [31:0]  cpu_perf_cnt_14_combo__V;
                            logic [31:0]  cpu_perf_cnt_15_combo__V;
                            logic [31:0]  register_01_combo__V;
                            logic [31:0]  register_02_combo__V;
                            logic [31:0]  register_03_combo__V;
                            logic [31:0]  register_04_combo__V;
                            logic [31:0]  register_05_combo__V;
                            logic [31:0]  register_06_combo__V;
                            logic [31:0]  register_07_combo__V;
                            logic [31:0]  register_08_combo__V;
                            logic [31:0]  register_09_combo__V;
                            logic [31:0]  register_10_combo__V;
                            logic [31:0]  register_11_combo__V;
                            logic [31:0]  register_12_combo__V;
                            logic [31:0]  register_13_combo__V;
                            logic [31:0]  register_14_combo__V;
                            logic [31:0]  register_15_combo__V;
                            logic [31:0]  register_16_combo__V;
                            logic [31:0]  register_17_combo__V;
                            logic [31:0]  register_18_combo__V;
                            logic [31:0]  register_19_combo__V;
                            logic [31:0]  register_20_combo__V;
                            logic [31:0]  register_21_combo__V;
                            logic [31:0]  register_22_combo__V;
                            logic [31:0]  register_23_combo__V;
                            logic [31:0]  register_24_combo__V;
                            logic [31:0]  register_25_combo__V;
                            logic [31:0]  register_26_combo__V;
                            logic [31:0]  register_27_combo__V;
                            logic [31:0]  register_28_combo__V;
                            logic [31:0]  register_29_combo__V;
                            logic [31:0]  register_30_combo__V;
                            logic [31:0]  register_31_combo__V;
                            logic [31:0]  RF_wdata_combo__V;
                            logic Inst_Req_Valid_seq__V;
                            logic Inst_Ready_seq__V;
                            logic MemWrite_seq__V;
                            logic [3:0]  Write_strb_seq__V;
                            logic MemRead_seq__V;
                            logic Read_data_Ready_seq__V;
                            logic RF_wen_seq__V;
                            logic [4:0]  RF_waddr_seq__V;
                            logic [31:0]  PC_seq__V;
                            logic [31:0]  Address_seq__V;
                            logic [31:0]  Write_data_seq__V;
                            logic [31:0]  cpu_perf_cnt_0_seq__V;
                            logic [31:0]  cpu_perf_cnt_1_seq__V;
                            logic [31:0]  cpu_perf_cnt_2_seq__V;
                            logic [31:0]  cpu_perf_cnt_3_seq__V;
                            logic [31:0]  cpu_perf_cnt_4_seq__V;
                            logic [31:0]  cpu_perf_cnt_5_seq__V;
                            logic [31:0]  cpu_perf_cnt_6_seq__V;
                            logic [31:0]  cpu_perf_cnt_7_seq__V;
                            logic [31:0]  cpu_perf_cnt_8_seq__V;
                            logic [31:0]  cpu_perf_cnt_9_seq__V;
                            logic [31:0]  cpu_perf_cnt_10_seq__V;
                            logic [31:0]  cpu_perf_cnt_11_seq__V;
                            logic [31:0]  cpu_perf_cnt_12_seq__V;
                            logic [31:0]  cpu_perf_cnt_13_seq__V;
                            logic [31:0]  cpu_perf_cnt_14_seq__V;
                            logic [31:0]  cpu_perf_cnt_15_seq__V;
                            logic [31:0]  register_01_seq__V;
                            logic [31:0]  register_02_seq__V;
                            logic [31:0]  register_03_seq__V;
                            logic [31:0]  register_04_seq__V;
                            logic [31:0]  register_05_seq__V;
                            logic [31:0]  register_06_seq__V;
                            logic [31:0]  register_07_seq__V;
                            logic [31:0]  register_08_seq__V;
                            logic [31:0]  register_09_seq__V;
                            logic [31:0]  register_10_seq__V;
                            logic [31:0]  register_11_seq__V;
                            logic [31:0]  register_12_seq__V;
                            logic [31:0]  register_13_seq__V;
                            logic [31:0]  register_14_seq__V;
                            logic [31:0]  register_15_seq__V;
                            logic [31:0]  register_16_seq__V;
                            logic [31:0]  register_17_seq__V;
                            logic [31:0]  register_18_seq__V;
                            logic [31:0]  register_19_seq__V;
                            logic [31:0]  register_20_seq__V;
                            logic [31:0]  register_21_seq__V;
                            logic [31:0]  register_22_seq__V;
                            logic [31:0]  register_23_seq__V;
                            logic [31:0]  register_24_seq__V;
                            logic [31:0]  register_25_seq__V;
                            logic [31:0]  register_26_seq__V;
                            logic [31:0]  register_27_seq__V;
                            logic [31:0]  register_28_seq__V;
                            logic [31:0]  register_29_seq__V;
                            logic [31:0]  register_30_seq__V;
                            logic [31:0]  register_31_seq__V;
                            logic [31:0]  RF_wdata_seq__V;
                            logic Inst_Req_Valid_tmp__V;
                            logic Inst_Ready_tmp__V;
                            logic MemWrite_tmp__V;
                            logic [3:0]  Write_strb_tmp__V;
                            logic MemRead_tmp__V;
                            logic Read_data_Ready_tmp__V;
                            logic RF_wen_tmp__V;
                            logic [4:0]  RF_waddr_tmp__V;
                            logic [31:0]  PC_tmp__V;
                            logic [31:0]  Address_tmp__V;
                            logic [31:0]  Write_data_tmp__V;
                            logic [31:0]  cpu_perf_cnt_0_tmp__V;
                            logic [31:0]  cpu_perf_cnt_1_tmp__V;
                            logic [31:0]  cpu_perf_cnt_2_tmp__V;
                            logic [31:0]  cpu_perf_cnt_3_tmp__V;
                            logic [31:0]  cpu_perf_cnt_4_tmp__V;
                            logic [31:0]  cpu_perf_cnt_5_tmp__V;
                            logic [31:0]  cpu_perf_cnt_6_tmp__V;
                            logic [31:0]  cpu_perf_cnt_7_tmp__V;
                            logic [31:0]  cpu_perf_cnt_8_tmp__V;
                            logic [31:0]  cpu_perf_cnt_9_tmp__V;
                            logic [31:0]  cpu_perf_cnt_10_tmp__V;
                            logic [31:0]  cpu_perf_cnt_11_tmp__V;
                            logic [31:0]  cpu_perf_cnt_12_tmp__V;
                            logic [31:0]  cpu_perf_cnt_13_tmp__V;
                            logic [31:0]  cpu_perf_cnt_14_tmp__V;
                            logic [31:0]  cpu_perf_cnt_15_tmp__V;
                            logic [31:0]  register_01_tmp__V;
                            logic [31:0]  register_02_tmp__V;
                            logic [31:0]  register_03_tmp__V;
                            logic [31:0]  register_04_tmp__V;
                            logic [31:0]  register_05_tmp__V;
                            logic [31:0]  register_06_tmp__V;
                            logic [31:0]  register_07_tmp__V;
                            logic [31:0]  register_08_tmp__V;
                            logic [31:0]  register_09_tmp__V;
                            logic [31:0]  register_10_tmp__V;
                            logic [31:0]  register_11_tmp__V;
                            logic [31:0]  register_12_tmp__V;
                            logic [31:0]  register_13_tmp__V;
                            logic [31:0]  register_14_tmp__V;
                            logic [31:0]  register_15_tmp__V;
                            logic [31:0]  register_16_tmp__V;
                            logic [31:0]  register_17_tmp__V;
                            logic [31:0]  register_18_tmp__V;
                            logic [31:0]  register_19_tmp__V;
                            logic [31:0]  register_20_tmp__V;
                            logic [31:0]  register_21_tmp__V;
                            logic [31:0]  register_22_tmp__V;
                            logic [31:0]  register_23_tmp__V;
                            logic [31:0]  register_24_tmp__V;
                            logic [31:0]  register_25_tmp__V;
                            logic [31:0]  register_26_tmp__V;
                            logic [31:0]  register_27_tmp__V;
                            logic [31:0]  register_28_tmp__V;
                            logic [31:0]  register_29_tmp__V;
                            logic [31:0]  register_30_tmp__V;
                            logic [31:0]  register_31_tmp__V;
                            logic [31:0]  RF_wdata_tmp__V;
                            // Hash value to make sure this file and the corresponding
                            // library agree
                            localparam int protectlib_hash__V = 32'd1197908583;

                            initial begin
                                custom_cpu_golden_protectlib_check_hash(protectlib_hash__V);
                                handle__V = custom_cpu_golden_protectlib_create($sformatf("%m"));
                            end
                            
                            // Combinatorialy evaluate changes to inputs
                            always @(*) begin
                                last_combo_seqnum__V = custom_cpu_golden_protectlib_combo_update(
                                    handle__V
                                    , rst
                                    , Inst_Req_Valid_combo__V
                                    , Inst_Req_Ready
                                    , Inst_Valid
                                    , Inst_Ready_combo__V
                                    , MemWrite_combo__V
                                    , Write_strb_combo__V
                                    , MemRead_combo__V
                                    , Mem_Req_Ready
                                    , Read_data_Valid
                                    , Read_data_Ready_combo__V
                                    , intr
                                    , RF_wen_combo__V
                                    , RF_waddr_combo__V
                                    , PC_combo__V
                                    , Instruction
                                    , Address_combo__V
                                    , Write_data_combo__V
                                    , Read_data
                                    , cpu_perf_cnt_0_combo__V
                                    , cpu_perf_cnt_1_combo__V
                                    , cpu_perf_cnt_2_combo__V
                                    , cpu_perf_cnt_3_combo__V
                                    , cpu_perf_cnt_4_combo__V
                                    , cpu_perf_cnt_5_combo__V
                                    , cpu_perf_cnt_6_combo__V
                                    , cpu_perf_cnt_7_combo__V
                                    , cpu_perf_cnt_8_combo__V
                                    , cpu_perf_cnt_9_combo__V
                                    , cpu_perf_cnt_10_combo__V
                                    , cpu_perf_cnt_11_combo__V
                                    , cpu_perf_cnt_12_combo__V
                                    , cpu_perf_cnt_13_combo__V
                                    , cpu_perf_cnt_14_combo__V
                                    , cpu_perf_cnt_15_combo__V
                                    , register_01_combo__V
                                    , register_02_combo__V
                                    , register_03_combo__V
                                    , register_04_combo__V
                                    , register_05_combo__V
                                    , register_06_combo__V
                                    , register_07_combo__V
                                    , register_08_combo__V
                                    , register_09_combo__V
                                    , register_10_combo__V
                                    , register_11_combo__V
                                    , register_12_combo__V
                                    , register_13_combo__V
                                    , register_14_combo__V
                                    , register_15_combo__V
                                    , register_16_combo__V
                                    , register_17_combo__V
                                    , register_18_combo__V
                                    , register_19_combo__V
                                    , register_20_combo__V
                                    , register_21_combo__V
                                    , register_22_combo__V
                                    , register_23_combo__V
                                    , register_24_combo__V
                                    , register_25_combo__V
                                    , register_26_combo__V
                                    , register_27_combo__V
                                    , register_28_combo__V
                                    , register_29_combo__V
                                    , register_30_combo__V
                                    , register_31_combo__V
                                    , RF_wdata_combo__V
                                );
                            end
                            
                            // Evaluate clock edges
                            always @(posedge clk or negedge clk) begin
                                custom_cpu_golden_protectlib_combo_ignore(
                                    handle__V
                                    , rst
                                    , Inst_Req_Ready
                                    , Inst_Valid
                                    , Mem_Req_Ready
                                    , Read_data_Valid
                                    , intr
                                    , Instruction
                                    , Read_data
                                );
                                last_seq_seqnum__V <= custom_cpu_golden_protectlib_seq_update(
                                    handle__V
                                    , clk
                                    , Inst_Req_Valid_tmp__V
                                    , Inst_Ready_tmp__V
                                    , MemWrite_tmp__V
                                    , Write_strb_tmp__V
                                    , MemRead_tmp__V
                                    , Read_data_Ready_tmp__V
                                    , RF_wen_tmp__V
                                    , RF_waddr_tmp__V
                                    , PC_tmp__V
                                    , Address_tmp__V
                                    , Write_data_tmp__V
                                    , cpu_perf_cnt_0_tmp__V
                                    , cpu_perf_cnt_1_tmp__V
                                    , cpu_perf_cnt_2_tmp__V
                                    , cpu_perf_cnt_3_tmp__V
                                    , cpu_perf_cnt_4_tmp__V
                                    , cpu_perf_cnt_5_tmp__V
                                    , cpu_perf_cnt_6_tmp__V
                                    , cpu_perf_cnt_7_tmp__V
                                    , cpu_perf_cnt_8_tmp__V
                                    , cpu_perf_cnt_9_tmp__V
                                    , cpu_perf_cnt_10_tmp__V
                                    , cpu_perf_cnt_11_tmp__V
                                    , cpu_perf_cnt_12_tmp__V
                                    , cpu_perf_cnt_13_tmp__V
                                    , cpu_perf_cnt_14_tmp__V
                                    , cpu_perf_cnt_15_tmp__V
                                    , register_01_tmp__V
                                    , register_02_tmp__V
                                    , register_03_tmp__V
                                    , register_04_tmp__V
                                    , register_05_tmp__V
                                    , register_06_tmp__V
                                    , register_07_tmp__V
                                    , register_08_tmp__V
                                    , register_09_tmp__V
                                    , register_10_tmp__V
                                    , register_11_tmp__V
                                    , register_12_tmp__V
                                    , register_13_tmp__V
                                    , register_14_tmp__V
                                    , register_15_tmp__V
                                    , register_16_tmp__V
                                    , register_17_tmp__V
                                    , register_18_tmp__V
                                    , register_19_tmp__V
                                    , register_20_tmp__V
                                    , register_21_tmp__V
                                    , register_22_tmp__V
                                    , register_23_tmp__V
                                    , register_24_tmp__V
                                    , register_25_tmp__V
                                    , register_26_tmp__V
                                    , register_27_tmp__V
                                    , register_28_tmp__V
                                    , register_29_tmp__V
                                    , register_30_tmp__V
                                    , register_31_tmp__V
                                    , RF_wdata_tmp__V
                                );
                                Inst_Req_Valid_seq__V <= Inst_Req_Valid_tmp__V;
                                Inst_Ready_seq__V <= Inst_Ready_tmp__V;
                                MemWrite_seq__V <= MemWrite_tmp__V;
                                Write_strb_seq__V <= Write_strb_tmp__V;
                                MemRead_seq__V <= MemRead_tmp__V;
                                Read_data_Ready_seq__V <= Read_data_Ready_tmp__V;
                                RF_wen_seq__V <= RF_wen_tmp__V;
                                RF_waddr_seq__V <= RF_waddr_tmp__V;
                                PC_seq__V <= PC_tmp__V;
                                Address_seq__V <= Address_tmp__V;
                                Write_data_seq__V <= Write_data_tmp__V;
                                cpu_perf_cnt_0_seq__V <= cpu_perf_cnt_0_tmp__V;
                                cpu_perf_cnt_1_seq__V <= cpu_perf_cnt_1_tmp__V;
                                cpu_perf_cnt_2_seq__V <= cpu_perf_cnt_2_tmp__V;
                                cpu_perf_cnt_3_seq__V <= cpu_perf_cnt_3_tmp__V;
                                cpu_perf_cnt_4_seq__V <= cpu_perf_cnt_4_tmp__V;
                                cpu_perf_cnt_5_seq__V <= cpu_perf_cnt_5_tmp__V;
                                cpu_perf_cnt_6_seq__V <= cpu_perf_cnt_6_tmp__V;
                                cpu_perf_cnt_7_seq__V <= cpu_perf_cnt_7_tmp__V;
                                cpu_perf_cnt_8_seq__V <= cpu_perf_cnt_8_tmp__V;
                                cpu_perf_cnt_9_seq__V <= cpu_perf_cnt_9_tmp__V;
                                cpu_perf_cnt_10_seq__V <= cpu_perf_cnt_10_tmp__V;
                                cpu_perf_cnt_11_seq__V <= cpu_perf_cnt_11_tmp__V;
                                cpu_perf_cnt_12_seq__V <= cpu_perf_cnt_12_tmp__V;
                                cpu_perf_cnt_13_seq__V <= cpu_perf_cnt_13_tmp__V;
                                cpu_perf_cnt_14_seq__V <= cpu_perf_cnt_14_tmp__V;
                                cpu_perf_cnt_15_seq__V <= cpu_perf_cnt_15_tmp__V;
                                register_01_seq__V <= register_01_tmp__V;
                                register_02_seq__V <= register_02_tmp__V;
                                register_03_seq__V <= register_03_tmp__V;
                                register_04_seq__V <= register_04_tmp__V;
                                register_05_seq__V <= register_05_tmp__V;
                                register_06_seq__V <= register_06_tmp__V;
                                register_07_seq__V <= register_07_tmp__V;
                                register_08_seq__V <= register_08_tmp__V;
                                register_09_seq__V <= register_09_tmp__V;
                                register_10_seq__V <= register_10_tmp__V;
                                register_11_seq__V <= register_11_tmp__V;
                                register_12_seq__V <= register_12_tmp__V;
                                register_13_seq__V <= register_13_tmp__V;
                                register_14_seq__V <= register_14_tmp__V;
                                register_15_seq__V <= register_15_tmp__V;
                                register_16_seq__V <= register_16_tmp__V;
                                register_17_seq__V <= register_17_tmp__V;
                                register_18_seq__V <= register_18_tmp__V;
                                register_19_seq__V <= register_19_tmp__V;
                                register_20_seq__V <= register_20_tmp__V;
                                register_21_seq__V <= register_21_tmp__V;
                                register_22_seq__V <= register_22_tmp__V;
                                register_23_seq__V <= register_23_tmp__V;
                                register_24_seq__V <= register_24_tmp__V;
                                register_25_seq__V <= register_25_tmp__V;
                                register_26_seq__V <= register_26_tmp__V;
                                register_27_seq__V <= register_27_tmp__V;
                                register_28_seq__V <= register_28_tmp__V;
                                register_29_seq__V <= register_29_tmp__V;
                                register_30_seq__V <= register_30_tmp__V;
                                register_31_seq__V <= register_31_tmp__V;
                                RF_wdata_seq__V <= RF_wdata_tmp__V;
                            end
                            
                            // Select between combinatorial and sequential results
                            always @(*) begin
                                if (last_seq_seqnum__V > last_combo_seqnum__V) begin
                                    Inst_Req_Valid = Inst_Req_Valid_seq__V;
                                    Inst_Ready = Inst_Ready_seq__V;
                                    MemWrite = MemWrite_seq__V;
                                    Write_strb = Write_strb_seq__V;
                                    MemRead = MemRead_seq__V;
                                    Read_data_Ready = Read_data_Ready_seq__V;
                                    RF_wen = RF_wen_seq__V;
                                    RF_waddr = RF_waddr_seq__V;
                                    PC = PC_seq__V;
                                    Address = Address_seq__V;
                                    Write_data = Write_data_seq__V;
                                    cpu_perf_cnt_0 = cpu_perf_cnt_0_seq__V;
                                    cpu_perf_cnt_1 = cpu_perf_cnt_1_seq__V;
                                    cpu_perf_cnt_2 = cpu_perf_cnt_2_seq__V;
                                    cpu_perf_cnt_3 = cpu_perf_cnt_3_seq__V;
                                    cpu_perf_cnt_4 = cpu_perf_cnt_4_seq__V;
                                    cpu_perf_cnt_5 = cpu_perf_cnt_5_seq__V;
                                    cpu_perf_cnt_6 = cpu_perf_cnt_6_seq__V;
                                    cpu_perf_cnt_7 = cpu_perf_cnt_7_seq__V;
                                    cpu_perf_cnt_8 = cpu_perf_cnt_8_seq__V;
                                    cpu_perf_cnt_9 = cpu_perf_cnt_9_seq__V;
                                    cpu_perf_cnt_10 = cpu_perf_cnt_10_seq__V;
                                    cpu_perf_cnt_11 = cpu_perf_cnt_11_seq__V;
                                    cpu_perf_cnt_12 = cpu_perf_cnt_12_seq__V;
                                    cpu_perf_cnt_13 = cpu_perf_cnt_13_seq__V;
                                    cpu_perf_cnt_14 = cpu_perf_cnt_14_seq__V;
                                    cpu_perf_cnt_15 = cpu_perf_cnt_15_seq__V;
                                    register_01 = register_01_seq__V;
                                    register_02 = register_02_seq__V;
                                    register_03 = register_03_seq__V;
                                    register_04 = register_04_seq__V;
                                    register_05 = register_05_seq__V;
                                    register_06 = register_06_seq__V;
                                    register_07 = register_07_seq__V;
                                    register_08 = register_08_seq__V;
                                    register_09 = register_09_seq__V;
                                    register_10 = register_10_seq__V;
                                    register_11 = register_11_seq__V;
                                    register_12 = register_12_seq__V;
                                    register_13 = register_13_seq__V;
                                    register_14 = register_14_seq__V;
                                    register_15 = register_15_seq__V;
                                    register_16 = register_16_seq__V;
                                    register_17 = register_17_seq__V;
                                    register_18 = register_18_seq__V;
                                    register_19 = register_19_seq__V;
                                    register_20 = register_20_seq__V;
                                    register_21 = register_21_seq__V;
                                    register_22 = register_22_seq__V;
                                    register_23 = register_23_seq__V;
                                    register_24 = register_24_seq__V;
                                    register_25 = register_25_seq__V;
                                    register_26 = register_26_seq__V;
                                    register_27 = register_27_seq__V;
                                    register_28 = register_28_seq__V;
                                    register_29 = register_29_seq__V;
                                    register_30 = register_30_seq__V;
                                    register_31 = register_31_seq__V;
                                    RF_wdata = RF_wdata_seq__V;
                                end
                                else begin
                                    Inst_Req_Valid = Inst_Req_Valid_combo__V;
                                    Inst_Ready = Inst_Ready_combo__V;
                                    MemWrite = MemWrite_combo__V;
                                    Write_strb = Write_strb_combo__V;
                                    MemRead = MemRead_combo__V;
                                    Read_data_Ready = Read_data_Ready_combo__V;
                                    RF_wen = RF_wen_combo__V;
                                    RF_waddr = RF_waddr_combo__V;
                                    PC = PC_combo__V;
                                    Address = Address_combo__V;
                                    Write_data = Write_data_combo__V;
                                    cpu_perf_cnt_0 = cpu_perf_cnt_0_combo__V;
                                    cpu_perf_cnt_1 = cpu_perf_cnt_1_combo__V;
                                    cpu_perf_cnt_2 = cpu_perf_cnt_2_combo__V;
                                    cpu_perf_cnt_3 = cpu_perf_cnt_3_combo__V;
                                    cpu_perf_cnt_4 = cpu_perf_cnt_4_combo__V;
                                    cpu_perf_cnt_5 = cpu_perf_cnt_5_combo__V;
                                    cpu_perf_cnt_6 = cpu_perf_cnt_6_combo__V;
                                    cpu_perf_cnt_7 = cpu_perf_cnt_7_combo__V;
                                    cpu_perf_cnt_8 = cpu_perf_cnt_8_combo__V;
                                    cpu_perf_cnt_9 = cpu_perf_cnt_9_combo__V;
                                    cpu_perf_cnt_10 = cpu_perf_cnt_10_combo__V;
                                    cpu_perf_cnt_11 = cpu_perf_cnt_11_combo__V;
                                    cpu_perf_cnt_12 = cpu_perf_cnt_12_combo__V;
                                    cpu_perf_cnt_13 = cpu_perf_cnt_13_combo__V;
                                    cpu_perf_cnt_14 = cpu_perf_cnt_14_combo__V;
                                    cpu_perf_cnt_15 = cpu_perf_cnt_15_combo__V;
                                    register_01 = register_01_combo__V;
                                    register_02 = register_02_combo__V;
                                    register_03 = register_03_combo__V;
                                    register_04 = register_04_combo__V;
                                    register_05 = register_05_combo__V;
                                    register_06 = register_06_combo__V;
                                    register_07 = register_07_combo__V;
                                    register_08 = register_08_combo__V;
                                    register_09 = register_09_combo__V;
                                    register_10 = register_10_combo__V;
                                    register_11 = register_11_combo__V;
                                    register_12 = register_12_combo__V;
                                    register_13 = register_13_combo__V;
                                    register_14 = register_14_combo__V;
                                    register_15 = register_15_combo__V;
                                    register_16 = register_16_combo__V;
                                    register_17 = register_17_combo__V;
                                    register_18 = register_18_combo__V;
                                    register_19 = register_19_combo__V;
                                    register_20 = register_20_combo__V;
                                    register_21 = register_21_combo__V;
                                    register_22 = register_22_combo__V;
                                    register_23 = register_23_combo__V;
                                    register_24 = register_24_combo__V;
                                    register_25 = register_25_combo__V;
                                    register_26 = register_26_combo__V;
                                    register_27 = register_27_combo__V;
                                    register_28 = register_28_combo__V;
                                    register_29 = register_29_combo__V;
                                    register_30 = register_30_combo__V;
                                    register_31 = register_31_combo__V;
                                    RF_wdata = RF_wdata_combo__V;
                                end
                            end
                            
                            final custom_cpu_golden_protectlib_final(handle__V);
                            
                        endmodule
