#!/usr/bin/env bash
set -u

CPU_ARCH=${CPU_ARCH:-riscv32}
FPGA_PRJ=${FPGA_PRJ:-ucas-cod}
FPGA_BD=${FPGA_BD:-nf}
SIM_TARGET=${SIM_TARGET:-custom_cpu}

LOG_DIR=${LOG_DIR:-trace_generate_logs}
mkdir -p "$LOG_DIR"

# 按你之前用过的测试集
tests=(
  "basic:memcpy"

  "medium:sum"
  "medium:mov-c"
  "medium:fib"
  "medium:add"
  "medium:if-else"
  "medium:pascal"
  "medium:quick-sort"
  "medium:select-sort"
  "medium:max"
  "medium:min3"
  "medium:switch"
  "medium:bubble-sort"

  "advanced:shuixianhua"
  "advanced:sub-longlong"
  "advanced:bit"
  "advanced:recursion"
  "advanced:fact"
  "advanced:add-longlong"
  "advanced:shift"
  "advanced:wanshu"
  "advanced:goldbach"
  "advanced:leap-year"
  "advanced:prime"
  "advanced:mul-longlong"
  "advanced:load-store"
  "advanced:to-lower-case"
  "advanced:movsx"
  "advanced:matrix-mul"
  "advanced:unalign"

  "hello:hello"

  "microbench:fib"
  "microbench:md5"
  "microbench:qsort"
  "microbench:queen"
  "microbench:sieve"
  "microbench:ssort"
  "microbench:15pz"
  "microbench:bf"
  "microbench:dinic"
)

pass_cnt=0
fail_cnt=0
fail_list=()

for item in "${tests[@]}"; do
    SIM_SET="${item%%:*}"
    BENCH_NAME="${item#*:}"

    echo "============================================================"
    echo "[TRACE] simple_test:${SIM_SET}:${BENCH_NAME}"

    log_file="${LOG_DIR}/${SIM_SET}_${BENCH_NAME}.log"

    make \
        FPGA_PRJ="${FPGA_PRJ}" \
        FPGA_BD="${FPGA_BD}" \
        SIM_TARGET="${SIM_TARGET}" \
        SIM_DUT="${CPU_ARCH}:golden" \
        WORKLOAD="simple_test:${SIM_SET}:${BENCH_NAME}" \
        trace_generate \
        > "${log_file}" 2>&1

    if [ $? -eq 0 ]; then
        echo "[PASS] ${SIM_SET}:${BENCH_NAME}"
        pass_cnt=$((pass_cnt + 1))
    else
        echo "[FAIL] ${SIM_SET}:${BENCH_NAME}"
        echo "       log: ${log_file}"
        fail_cnt=$((fail_cnt + 1))
        fail_list+=("${SIM_SET}:${BENCH_NAME}")
    fi
done

echo "============================================================"
echo "Trace generate finished."
echo "PASS: ${pass_cnt}"
echo "FAIL: ${fail_cnt}"

if [ ${fail_cnt} -ne 0 ]; then
    echo "Failed cases:"
    for x in "${fail_list[@]}"; do
        echo "  - ${x}"
    done
fi