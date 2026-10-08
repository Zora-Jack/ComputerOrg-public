# 来源与授权核查记录

核查日期：2026-10-08 UTC。基线提交：[1afd91f59fec92289d7120d8dc65cb96e3149561](https://github.com/Zora-Jack/ComputerOrg-public/commit/1afd91f59fec92289d7120d8dc65cb96e3149561)。

## 当前结论

公开范围仍有需要确认的授权边界。已核实的 MIT、BSD 和 Apache 组件可以记录其原始归属并随附许可；课程框架、部分参考代码、二进制产物和数据则缺少足以确认公开再分发权限的证据。未找到许可不等于已经证明侵权，但也不能据此认定许可存在。

优先确认课程框架整体的对外发布规则，以及 microbench 中 Douglas Wilhelm Harder 的两个头文件。后者在本地和作者网站均明确保留全部权利；课程使用或教师提供并不自动证明可向课程之外公开再分发。

本次没有设置全库统一许可证。公开可见与开源授权是两件事；[GitHub 的许可说明](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) 也区分了公开查看、平台内 fork 与一般版权许可。单纯增加“仅供学习”“版权归原作者”等文字不能补出缺失的授权。

## 检查范围与限制

基线文件树共 815 个条目，其中 655 个文件、160 个目录；没有 `reports/` 路径。检查覆盖已跟踪文件的来源链接、作者、版权、许可、再分发条款及依赖配置，并检查了 6 个 DCP 归档是否附有许可或 NOTICE 文件。

用前 8192 字节中的 NUL 判断得到 163 个二进制候选文件，这只是识别辅助，不能据此证明二进制中所有组件的来源。6 个 DCP 归档均未发现名称包含 license、notice 或 copying 的条目；这不证明 IP 受限，也不证明它们可以公开分发。

公开仓库从一次快照导入开始，未包含足够的课程原始基线和个人修改历史。因此，下列“个人实现”范围依据当前 README 和代码结构，不能作为整文件原创或独占版权的证明。本次也没有从其他学生仓库的 LICENSE 推导本仓库许可。

## 个人实现、课程材料和混合文件

| 范围 | 现有归属依据 | 许可处理 |
|---|---|---|
| `fpga/design/ucas-cod/hardware/sources/alu/alu.v`、`reg_file/reg_file.v`、`shifter/shifter.v`、`simple_cpu/simple_cpu.v` | README 记录为个人设计工作 | 先核对课程模板中的端口、骨架及既有实现；仅对可确认的个人新增内容选择许可 |
| `fpga/design/ucas-cod/hardware/sources/custom_cpu/riscv32/` 与 `custom_cpu/cache/` | README 记录处理器和 Cache 的个人实现、优化 | 目录中的接口和辅助模块也需核对来源，不能只依据目录名统一授权 |
| `software/workload/ucas-cod/benchmark/simple_test/dnn_test/src/conv.c` | README 记录个人卷积、池化、检查与控制软件工作 | 区分模板、课程接口、个人补全和数据；不把预置加速器硬件或权重归为个人实现 |
| `software/workload/ucas-cod/benchmark/simple_test/common/printf.c` | mini-printf 原始版权与 BSD 条款仍在，另有 UART 适配 | 明确上游归属和个人/课程修改，保留原许可；不将整个文件宣称为个人原创 |
| `gen_trace.sh`、`check_trace.sh` 与测试分析 | README 记录批量测试和分析工作 | 可核实独立新增范围后单独选许可；参考 Trace 和既有脚本仍按各自来源处理 |
| `hardware/wrapper/`、`hardware/sim/`、`hardware/emu/`、FPGA 工程、构建/运行/CI 脚本与软件平台材料 | 作者标记、既有框架结构和课程工具包引用 | 课程框架中嵌入的第三方文件有各自许可，其余课程内容的对外发布许可尚未确认 |
| `fpga/design/ucas-cod/hardware/sources/custom_cpu/dma/` | `dma_engine.v` 明示作者 Xu Zhang；同目录另有控制和 FIFO 代码 | 不把整个 `hardware/sources/` 视作个人代码；这些文件的授权由具体来源决定 |

表中的 `hardware/wrapper/`、`hardware/sim/`、`hardware/emu/` 均位于 `fpga/design/ucas-cod/` 下。作者标记只提供来源线索，不能单凭姓名或邮箱判断全部权利属于作者、学校或研究所中的哪一方。

## 已完成的修正

| 修正 | 依据与范围 |
|---|---|
| README 新增来源与许可说明 | 直接区分个人工作、课程平台与第三方组件，并链接本记录及第三方清单 |
| 列明 19 个 Alex Forencich RTL 文件和 Brainfuck-C 的 MIT 许可 | 对应源文件已有完整许可头；随附全文保留观察到的版权年份 |
| 补附 mini-printf 的 BSD 三条款许可及 hello 的归属说明 | 本地 `printf.c`、`printf.h` 有许可头，hello 有上游来源链接；上游 README 包含完整许可 |
| 补附 pod32g/MD5 的 Apache 2.0 许可，并标记本地适配 | 本地 md5.c 声明来源，常量和核心实现可与对应上游源码核对；许可取自官方仓库 |
| 更新 CoreMark 旧 LICENSE.txt，补充来源/修改说明 | EEMBC 官网明确声明旧许可均被 Apache 许可和可接受使用说明取代；以固定上游提交的原文替换旧文本，保留 2009 年原始源码版权 |
| 保留授权未确认状态 | 新增说明没有为课程内容或全库授予 MIT、Apache 2.0 等统一许可 |

许可全文位置及适用路径见 [第三方清单](../THIRD_PARTY_NOTICES.md)。README 中的性能数据仍是原有 DNN 实验结果，不应因随附了 CoreMark 许可而将其理解为 CoreMark 官方成绩。

## 待确认事项

| 编号 | 范围和当前证据 | 所需确认 | 确认后的处理 |
|---|---|---|---|
| P-01 | UCAS COD 框架、SoC 包装、Testbench、参考模型、构建/运行/CI 脚本；部分文件有 Yisong Chang 或 Xu Zhang 标记，但未找到整体对外分发许可 | 向课程维护方或相应权利人取得原始仓库版本、许可文本或书面发布范围；明确源码、参考实现和生成产物是否均允许在课程之外公开 | 按批准范围保留课程归属；若不允许某些材料公开，则后续仅从 public 移除该范围，private 保留，公开仓库通过链接/获取说明或个人补丁提供使用入口 |
| P-02 | `software/workload/ucas-cod/benchmark/simple_test/microbench/include/heap.h`、`puzzle.h`；作者网站的 `Updatable_heap.h`、`N_puzzle.h` 同样保留全部权利 | 确认课程方是否取得覆盖公开再分发的授权，或向权利人核实可用许可；一并检查 `microbench/src/15pz.cpp` 与由其生成的产物 | 有授权则保留证据并注明适用范围；否则后续从 public 排除有关源码/产物，或用经核实许可的实现替换 |
| P-03 | `software/workload/ucas-cod/benchmark/perf_test/dhrystone/` 的版本和作者已知，但随附文件没有明确许可 | 找到实际使用的发行来源与许可/授权记录，包括课程包装 `main.c` 等新增内容 | 依据该副本的实际条款补齐许可；不移植不相关发行版的 GPL、BSD 或“公有领域”声明 |
| P-04 | `fpga/design/ucas-cod/hardware/sim/custom_cpu/multi_cycle/golden/{mips,riscv32}/libcustom_cpu_golden.a`、对应 golden 源码、`fpga/design/ucas-cod/fpga/dcp/*.dcp`、`fpga/design/ucas-cod/dtbo/*.dtbo`、`software/workload/ucas-cod/host/*/elf/loader_*`、测试 ELF/bin/mem、反汇编及参考 Trace | 核实各产物的源代码、生成工具及运行库/IP、版本和再分发许可；不能从源码可用推断参考库或 IP 产物也可发布 | 随分发附上实际涉及的许可；许可不覆盖公开分发的产物可由课程入口另行获取，保留 private/public 分离 |
| P-05 | `software/workload/ucas-cod/benchmark/simple_test/dnn_test/data/` 的原始数据、权重和结果缺少来源声明 | 明确数据集、权重作者/提供方、版本、生成方式及公开分享条件 | 补充数据归属；必要时改为说明如何从合法来源获取或自行生成，不重新授权未知数据 |
| P-06 | 未声明来源的通用基准、运行库和包装；`nemu_assert`、`am.h` 等符号仅提供 NEMU/Abstract Machine 来源线索 | 用课程原始基线和上游历史做逐文件比对，核实借用链；MD5、CoreMark、mini-printf 和 Brainfuck-C 的课程新增部分也需核对 | 来源确认后按实际组件补充许可与修改声明，不用一个上游项目的 LICENSE 覆盖整套基准 |
| P-07 | `fpga/design/ucas-cod/scripts/hardware.mk` 获取 `ucas-cod-2021-dev/cod-verilator-bin`，Python monitor 使用 NumPy/PyYAML，其他构建配置引用外部工具 | 安装时查阅实际工具包许可；如果今后将它们或相关运行库打包发布，再核实该具体包的分发要求 | 在各包自己的范围保留 COPYING/NOTICE 等材料，避免把标准工具许可证误当成课程二进制包的完整授权 |
| P-08 | 个人实现尚无单独许可，公开快照没有足够历史证明全部文件均为独立原创 | 核对个人修改历史、课程模板及可能的共同贡献，划定可授权范围并由权利人选择许可 | 可用路径级许可或独立个人实现目录；继续保留第三方和课程材料的例外，不新增全库可自由再授权的声明 |
| P-09 | CoreMark 可接受使用协议第 1.2 条限制商标与修改版本结合使用；本地 `core_main.c` 仍输出 `CoreMark Size`、`CoreMark 1.0` 等字符串 | 核实课程适配副本的商标、运行和成绩展示方式是否符合协议；区分必要的来源归属与将修改副本作为该商标的基准使用 | 按协议或取得的授权调整展示/运行方式，避免把课程副本的结果标为官方成绩；本次只补充说明，未改动输出逻辑 |

上述移除、替换或重排是取得更多证据后的建议，本次未删除这些材料，也未改变仓库可见性或 private/public 分离方式。当前保留说明不意味着公开分发问题已经全部解决。

## 本次验证

18 个文件的变更限定为来源说明、许可文本和注释；没有删除原有文件或更改 RTL、构建配置和二进制。10 个 C/头文件在排除新增或扩充的前导注释后，与基线的可执行内容逐字节一致，CoreMark 原有版权头继续保留。

CoreMark 与 MD5 的随附许可文件分别与固定上游版本的 blob `14e53e9eecd0369a1aa4b7c388df824d226aca79`、`433f9f93b670b00643d87cf18af53f73ff776758` 完全一致。第三方清单列出的 19 个 Alex Forencich 文件均存在并保留 MIT 许可头；本地 Markdown 链接已检查。公开索引中仍没有 reports 路径或覆盖全库的根目录 LICENSE。

本次未运行 CPU 仿真或 FPGA 流程；源码变更仅为注释，验证针对文档与许可范围，不代表完成硬件功能验收或所有授权事项的确认。CoreMark 官方许可原文自身含行末空格，作为原文保留，其余新增内容通过空白检查。

## 外部核验来源

| 来源 | 可支持的判断 |
|---|---|
| [EEMBC 官方下载页](https://www.eembc.org/coremark/download.php) | 所有旧 CoreMark 许可由 Apache 许可和可接受使用说明替代 |
| [EEMBC 现行许可](https://github.com/eembc/coremark/blob/1f483d5b8316753a742cbf5590caf5bd0a4e4777/LICENSE.md) | Apache 2.0 及 CoreMark 可接受使用协议的完整条款；本地 LICENSE.txt 从此版本复制 |
| [pod32g/MD5 许可](https://github.com/pod32g/MD5/blob/27d3b3d87c9a82cfb1c140a404b1ac2585d95dd4/LICENSE)与[源码](https://github.com/pod32g/MD5/blob/27d3b3d87c9a82cfb1c140a404b1ac2585d95dd4/md5.c) | 上游对应实现的 Apache 2.0 许可；许可文件保留上游的版权附录写法 |
| [mini-printf README](https://github.com/mludvig/mini-printf/blob/f7479a4bbc101d543444ef99626ea25d5ea0e3df/README.md#license)与[test1.c](https://github.com/mludvig/mini-printf/blob/f7479a4bbc101d543444ef99626ea25d5ea0e3df/test1.c) | BSD 三条款许可与 hello 测试代码来源 |
| [Brainfuck-C 源码](https://github.com/kgabis/brainfuck-c/blob/1ea970e531bb445f9cdeb346c3526dc0e07bd003/brainfuck.c) | Krzysztof Gabis 的 MIT 许可；官方仓库未单设 LICENSE，但源码有完整许可头 |
| [verilog-axi COPYING](https://github.com/alexforencich/verilog-axi/blob/master/COPYING) | 上游 MIT 许可；具体适用文件仍以本地 19 个文件保留的许可头为依据 |
| [Harder N-puzzle 源码](https://ece.uwaterloo.ca/~dwharder/aads/Algorithms/N_puzzles/src/N_puzzle.h)与[堆源码](https://ece.uwaterloo.ca/~dwharder/aads/Algorithms/N_puzzles/src/Updatable_heap.h) | 作者、版权和保留全部权利的标记；所检查页面和源码未提供公开再分发许可 |

这些来源用于确认各自的组件，不构成课程方或其他权利人的整体授权。
