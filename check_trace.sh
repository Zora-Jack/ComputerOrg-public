#!/usr/bin/env bash
set -u

PROJECT_DIR=${PROJECT_DIR:-"$HOME/jizekai24"}

FPGA_PRJ=${FPGA_PRJ:-ucas-cod}
FPGA_BD=${FPGA_BD:-nf}
SIM_TARGET=${SIM_TARGET:-custom_cpu}

# 按图片格式，riscv32 流水线版本默认用 turbo
# 如果你的 DUT 名字不是 turbo，可以运行时改：
# SIM_DUT=riscv32:custom_cpu ./run_trace_check_all.sh
SIM_DUT=${SIM_DUT:-riscv32:turbo}

LOG_DIR=${LOG_DIR:-trace_check_logs}
mkdir -p "$LOG_DIR"

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

cd "$PROJECT_DIR" || {
    echo "Cannot enter project directory: $PROJECT_DIR"
    exit 1
}

for item in "${tests[@]}"; do
    SIM_SET="${item%%:*}"
    BENCH_NAME="${item#*:}"

    echo "============================================================"
    echo "[RUN] simple_test:${SIM_SET}:${BENCH_NAME}"

    log_file="${LOG_DIR}/${SIM_SET}_${BENCH_NAME}.log"

    make \
        FPGA_PRJ="${FPGA_PRJ}" \
        FPGA_BD="${FPGA_BD}" \
        SIM_TARGET="${SIM_TARGET}" \
        SIM_DUT="${SIM_DUT}" \
        WORKLOAD="simple_test:${SIM_SET}:${BENCH_NAME}" \
        bhv_sim_verilator \
        > "${log_file}" 2>&1

    if grep -q "Hit good trap" "${log_file}"; then
        echo "[PASS] ${SIM_SET}:${BENCH_NAME} -- Hit good trap"
        pass_cnt=$((pass_cnt + 1))
    else
        echo "[FAIL] ${SIM_SET}:${BENCH_NAME}"
        echo "       log: ${log_file}"
        fail_cnt=$((fail_cnt + 1))
        fail_list+=("${SIM_SET}:${BENCH_NAME}")

        echo "------- last 20 lines -------"
        tail -n 20 "${log_file}"
        echo "-----------------------------"
    fi
done

echo "============================================================"
echo "Trace check finished."
echo "DUT : ${SIM_DUT}"
echo "PASS: ${pass_cnt}"
echo "FAIL: ${fail_cnt}"

if [ ${fail_cnt} -ne 0 ]; then
    echo "Failed cases:"
    for x in "${fail_list[@]}"; do
        echo "  - ${x}"
    done
fi