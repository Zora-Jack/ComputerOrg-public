#include <verilated.h>
#include "Vcustom_cpu_test.h"

#define TIME_SCALE (5)
#define TIME_LIMIT (20000000000)

// Legacy function required only so linking works
double sc_time_stamp() { return 0; }

uint64_t main_time = 0;

int main(int argc, char** argv, char** env) {
	const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
  
  Verilated::traceEverOn(true);
  
	contextp->debug(0);
	contextp->randReset(2);
	contextp->traceEverOn(true);
	contextp->commandArgs(argc, argv);

	const std::unique_ptr<Vcustom_cpu_test> custom_cpu_test(new Vcustom_cpu_test{"TOP"});

	custom_cpu_test->sys_clk = 1;
	custom_cpu_test->sys_reset_n = 0;
	custom_cpu_test->eval();

	while (!contextp->gotFinish()) {
		custom_cpu_test->sys_clk = !custom_cpu_test->sys_clk;
		if (main_time == 20) custom_cpu_test->sys_reset_n = 1;
		
		custom_cpu_test->eval();
		if (++main_time >= TIME_LIMIT) goto finish;
		contextp->timeInc(TIME_SCALE);
	}
finish: custom_cpu_test->final();
	if (main_time >= TIME_LIMIT) {
		fprintf(stderr, "ERROR: Timeout\n");
		return -1;
	}
	return 0;
}
