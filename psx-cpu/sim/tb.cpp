#include "tb.h"

#include "verilated.h"

#if VM_TRACE
#include "verilated_vcd_c.h"

static VerilatedVcdC* g_trace = nullptr;
#endif

static vluint64_t g_time = 0;

void tb_init_trace(Vcpu32& dut, const char* trace_path) {
#if VM_TRACE
    Verilated::traceEverOn(true);

    if (g_trace != nullptr) {
        g_trace->close();
        delete g_trace;
    }

    g_trace = new VerilatedVcdC;
    dut.trace(g_trace, 99);
    g_trace->open(trace_path);
    g_time = 0;
#else
    (void)dut;
    (void)trace_path;
#endif
}

void tb_close_trace() {
#if VM_TRACE
    if (g_trace != nullptr) {
        g_trace->close();
        delete g_trace;
        g_trace = nullptr;
    }
#endif
}

void tb_eval(Vcpu32& dut) {
    dut.eval();

#if VM_TRACE
    if (g_trace != nullptr) {
        g_trace->dump(g_time++);
    }
#endif
}

void tb_clock(Vcpu32& dut) {
    dut.clk = 0;
    tb_eval(dut);

    dut.clk = 1;
    tb_eval(dut);

    dut.clk = 0;
    tb_eval(dut);
}
