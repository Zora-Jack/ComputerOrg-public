#!/usr/bin/env bash

# ================== Config ==================

PROJECT_DIR="$HOME/jizekai24"

FPGA_PRJ="ucas-cod"
FPGA_BD="nf"
SIM_TARGET="custom_cpu"
SIM_DUT="riscv32:multi_cycle"
MAKE_TARGET="bhv_sim_verilator"

LOG_DIR="$PROJECT_DIR/logs"

PASS_MARKER="Benchmark simulation passed!!!"

# ================== Test Lists ==================

basic_tests=(
  memcpy
)

medium_tests=(
  sum
  mov-c
  fib
  add
  if-else
  pascal
  quick-sort
  select-sort
  max
  min3
  switch
  bubble-sort
)

advanced_tests=(
  shuixianhua
  sub-longlong
  bit
  recursion
  fact
  add-longlong
  shift
  wanshu
  goldbach
  leap-year
  prime
  mul-longlong
  load-store
  to-lower-case
  movsx
  matrix-mul
  unalign
)

microbench_tests=(
  fib
  md5
  qsort
  queen
  sieve
  ssort
  15pz
  bf
  dinic
)

# ================== Runtime Data ==================

PASS_LIST=()
FAIL_LIST=()
SUSPECT_LIST=()

mkdir -p "$LOG_DIR"

# ================== Function ==================

run_one() {
  SIM_SET="$1"
  BENCH_NAME="$2"

  LOG_FILE="${LOG_DIR}/${SIM_SET}_${BENCH_NAME}.log"

  printf "Running %-12s %-20s ... " "$SIM_SET" "$BENCH_NAME"

  make -C "$PROJECT_DIR" \
       FPGA_PRJ="$FPGA_PRJ" \
       FPGA_BD="$FPGA_BD" \
       SIM_TARGET="$SIM_TARGET" \
       SIM_DUT="$SIM_DUT" \
       WORKLOAD="simple_test:${SIM_SET}:${BENCH_NAME}" \
       "$MAKE_TARGET" \
       > "$LOG_FILE" 2>&1

  STATUS=$?

  # 最可靠判断：只要出现明确通过标志，就算 PASS
  if grep -q "$PASS_MARKER" "$LOG_FILE"; then
    echo "PASS"
    PASS_LIST+=("${SIM_SET}:${BENCH_NAME}")
    return
  fi

  # 没有通过标志，且 make 返回非 0，判 FAIL
  if [ "$STATUS" -ne 0 ]; then
    echo "FAIL"
    FAIL_LIST+=("${SIM_SET}:${BENCH_NAME}")
    echo "  reason: make returned non-zero status: $STATUS"
    echo "  log: $LOG_FILE"
    echo "  last lines:"
    tail -n 10 "$LOG_FILE" | sed 's/^/    /'
    return
  fi

  # make 返回 0，但是没有 passed 标志，判 SUSPECT
  echo "SUSPECT"
  SUSPECT_LIST+=("${SIM_SET}:${BENCH_NAME}")
  echo "  reason: make returned 0, but no pass marker found"
  echo "  log: $LOG_FILE"
  echo "  last lines:"
  tail -n 12 "$LOG_FILE" | sed 's/^/    /'
}

# ================== Run Tests ==================

echo "Project dir: $PROJECT_DIR"
echo "Log dir:     $LOG_DIR"
echo "DUT:         $SIM_DUT"
echo

for test in "${basic_tests[@]}"; do
  run_one basic "$test"
done

for test in "${medium_tests[@]}"; do
  run_one medium "$test"
done

for test in "${advanced_tests[@]}"; do
  run_one advanced "$test"
done

run_one hello hello

for test in "${microbench_tests[@]}"; do
  run_one microbench "$test"
done

# ================== Summary ==================

echo
echo "================ Summary ================"
echo "PASS:    ${#PASS_LIST[@]}"
echo "FAIL:    ${#FAIL_LIST[@]}"
echo "SUSPECT: ${#SUSPECT_LIST[@]}"

if [ ${#FAIL_LIST[@]} -ne 0 ]; then
  echo
  echo "Failed tests:"
  for item in "${FAIL_LIST[@]}"; do
    echo "  $item"
  done
fi

if [ ${#SUSPECT_LIST[@]} -ne 0 ]; then
  echo
  echo "Suspect tests:"
  for item in "${SUSPECT_LIST[@]}"; do
    echo "  $item"
  done
fi

echo
echo "Logs saved in:"
echo "  $LOG_DIR"
echo "========================================="