# 第三方来源与许可说明

本文件记录本仓库中已识别的第三方材料及其许可证据，不授予覆盖整个仓库的统一许可。上游代码的许可、课程适配部分的权利和个人新增实现的权利应分别核实。源码中的原始作者、版权和许可标记应继续保留。

核查基线：[1afd91f59fec92289d7120d8dc65cb96e3149561](https://github.com/Zora-Jack/ComputerOrg-public/commit/1afd91f59fec92289d7120d8dc65cb96e3149561)。核查日期：2026-10-08 UTC。

## 已核实的上游组件

| 组件 | 本地范围 | 许可证据与随附全文 |
|---|---|---|
| Alex Forencich AXI/AXI-Lite、仲裁与 DMA 代码 | 下表列出的 19 个 RTL 文件 | 各文件保留完整 MIT 许可头；[随附版权与许可](LICENSES/MIT-Alex-Forencich.txt)，[上游项目](https://github.com/alexforencich/verilog-axi) |
| Brainfuck-C / Krzysztof Gabis | `software/workload/ucas-cod/benchmark/simple_test/microbench/src/bf.c` 中来自上游的解释器实现 | 文件保留 Copyright (c) 2012 Krzysztof Gabis 及完整 MIT 许可；[随附全文](LICENSES/MIT-Brainfuck-C.txt)，[上游源码](https://github.com/kgabis/brainfuck-c/blob/1ea970e531bb445f9cdeb346c3526dc0e07bd003/brainfuck.c) |
| mini-printf / Michal Ludvig | `simple_test/common/printf.c`、`simple_test/include/printf.h`，以及 `simple_test/hello/src/hello.c` 中取自上游测试的内容；路径前缀均为 `software/workload/ucas-cod/benchmark/` | 前两个文件保留 BSD 三条款许可头，hello 文件已有来源链接；[随附全文](LICENSES/BSD-3-Clause-mini-printf.txt)，[上游许可说明](https://github.com/mludvig/mini-printf/blob/f7479a4bbc101d543444ef99626ea25d5ea0e3df/README.md#license) |
| pod32g/MD5 | `software/workload/ucas-cod/benchmark/simple_test/microbench/src/md5.c` 中的上游 MD5 实现 | 本地注释明确指出来源；上游 LICENSE 为 Apache 2.0，本次补附 [原文](LICENSES/Apache-2.0-pod32g-MD5.txt)；[上游 LICENSE](https://github.com/pod32g/MD5/blob/27d3b3d87c9a82cfb1c140a404b1ac2585d95dd4/LICENSE) |
| EEMBC CoreMark / Shay Gal-On | `software/workload/ucas-cod/benchmark/perf_test/coremark/src/` 中的 EEMBC 原始代码部分 | [现行许可与可接受使用协议](software/workload/ucas-cod/benchmark/perf_test/coremark/LICENSE.txt)；[EEMBC 的旧许可替代声明](https://www.eembc.org/coremark/download.php)，[上游原文](https://github.com/eembc/coremark/blob/1f483d5b8316753a742cbf5590caf5bd0a4e4777/LICENSE.md) |

MIT 和 BSD 的源码再分发要求保留版权、许可条件与免责声明。BSD 的二进制再分发还需在随附文档或其他材料中提供这些内容；这里附上的完整文本可随整个仓库分发。单独分发 ELF、bin、静态库或 FPGA 产物时，应另行携带其实际使用组件的许可与归属材料。

Apache 2.0 要求随分发提供许可、保留相关标记，并在修改过的文件中明确说明修改；上游若附有 NOTICE，也需按条款保留。该许可不自动为来源不明的课程新增内容确立授权。MD5 和 CoreMark 的来源说明保留了课程适配及其作者、版本尚待核实的状态。

### Alex Forencich 文件范围

以下路径均以 `fpga/design/ucas-cod/hardware/` 为前缀。范围以文件中实际保留的 MIT 许可头为依据，不扩大到同目录中的其他文件，也未认定课程副本与当前上游版本完全一致。

| 子目录 | 文件 |
|---|---|
| `emu/custom_cpu/` | `arbiter.v`、`priority_encoder.v`、`axi_axil_adapter.v`、`axi_axil_adapter_rd.v`、`axi_axil_adapter_wr.v`、`axi_interconnect.v`、`axi_interconnect_wrap_1x2.v`、`axi_interconnect_wrap_2x1.v`、`axi_interconnect_wrap_3x1.v`、`axil_interconnect.v`、`axil_interconnect_wrap_1x2.v`、`axil_interconnect_wrap_1x3.v` |
| `emu/fpga_srcs/` | `axi_dma.v`、`axi_dma_rd.v`、`axi_dma_wr.v` |
| `sim/custom_cpu/common/` | `arbiter.v`、`priority_encoder.v`、`axi_interconnect.v`、`axi_interconnect_wrap_2x1.v` |

### CoreMark 旧许可的处理依据

公开基线中的 LICENSE.txt 是旧 EEMBC 专有许可，原始源码也带有 2009 年版权与旧版许可提示。EEMBC 官方下载页明确说明，所有旧许可已经由 Apache 许可和可接受使用说明替代。因此，本次用上述固定上游提交的 LICENSE.md 原文更新本地 LICENSE.txt，保留原始源码版权标记，没有将这份许可推广到整个实验平台。

这一处理确认的是 EEMBC 原始材料的现行许可。课程移植代码、包装入口、链接脚本及其他新增部分的作者和适用许可仍待确认；具体源文件的历史版本也尚未锁定。CoreMark 可接受使用协议第 1.2 条限制商标与修改版本结合使用；本地 `core_main.c` 仍包含带 CoreMark 名称的输出，运行和展示方式需另行核实，不能仅凭 Apache 2.0 认定商标使用已获许可。这里保留组件名称用于说明来源，不把课程适配版本的运行结果宣称为官方认证分数。

## 来源可识别、授权仍待确认的材料

| 材料 | 已有证据 | 当前状态 |
|---|---|---|
| UCAS COD 实验平台、参考模型、Testbench、SoC 包装与构建脚本 | 多个文件有 Yisong Chang 作者标记；`hardware/sources/custom_cpu/dma/dma_engine.v` 有 Xu Zhang 作者标记；构建脚本引用 `ucas-cod-2021-dev/cod-verilator-bin` | 未找到覆盖课程框架的公开再分发许可；作者标记不等于许可，也不足以认定全部版权主体 |
| Harder 的可更新堆与 N-puzzle 代码 | `simple_test/microbench/include/heap.h`、`puzzle.h` 保留 Copyright (c) 2009 by Douglas Wilhelm Harder. All rights reserved.；[作者网站](https://ece.uwaterloo.ca/~dwharder/aads/Algorithms/N_puzzles/src/) 的对应源码也保留相同标记 | 本次未找到再分发授权；使用这两个头文件的 `simple_test/microbench/src/15pz.cpp` 及相应产物也需一并核实 |
| Dhrystone 2.1 / Reinhold P. Weicker | `perf_test/dhrystone/src/dhry.h`、`dhry_1.c`、`dhry_2.c` 有版本、日期与作者信息 | 随附文件未提供明确再分发条款；不根据其他发行版的许可证认定本副本的许可 |
| 预编译参考库、DCP、设备树叠加文件、loader、程序镜像及参考 Trace | 仓库存在 `libcustom_cpu_golden.a`、`fpga/design/ucas-cod/fpga/dcp/*.dcp`、`fpga/design/ucas-cod/dtbo/*.dtbo`、`software/workload/ucas-cod/host/*/elf/loader_*` 和测试产物 | 未获得完整来源、构建链及产物/IP 的分发许可证据 |
| DNN 输入、权重与结果数据 | `simple_test/dnn_test/data/` 中保存 raw、软件及硬件布局的数据 | 数据集、权重和生成方式未声明；不能依据张量尺寸推断来源或许可 |

本表中的软件路径除特别注明外，以 `software/workload/ucas-cod/benchmark/` 为前缀；FPGA 和 loader 的完整范围见 [核查记录](docs/provenance-and-licensing.md)。

## 外部工具与依赖

构建配置引用 Vivado/SDK、GNU 交叉编译工具链、DTC、Verilator、Icarus Verilog、Yosys 等外部工具；Python monitor 导入 NumPy 和 PyYAML。本次未发现这些完整工具或 Python 包被随源码整体打包。工具安装依赖不等于仓库中课程材料的再分发许可。

尤其是 `fpga/design/ucas-cod/scripts/hardware.mk` 自动获取的课程 Verilator 二进制包，应核实该包自己的版本、COPYING/NOTICE 和实际打包内容，不能仅凭名称按标准 Verilator 发行包处理。Vivado 生成或使用的 DCP/IP 产物也需按供应方与实际 IP 条款核实。

## 后续许可安排

个人实现应先与课程原始模板和开发历史核对，确认独立新增部分或可以明确划定的文件，再由权利人决定是否采用 MIT、Apache 2.0 等许可证。课程和第三方材料继续使用各自的许可，不能用一个新的根目录 LICENSE 将它们全部重新授权。

待确认的具体范围、所需证据和后续处理建议列于 [核查记录](docs/provenance-and-licensing.md)。在授权未确认前，本说明只记录来源与当前证据，不构成第三方授权，也不能解决原先可能缺少的公开再分发许可。
