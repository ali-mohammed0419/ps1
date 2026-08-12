#pragma once

#include "verilated.h"

#if VM_TRACE
#include "verilated_vcd_c.h"
extern VerilatedVcdC* g_trace;
#endif

extern vluint64_t g_time;


template <typename DUT>
void tb_init_trace(DUT& dut, const char* trace_path) {
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


template <typename DUT>
void tb_eval(DUT& dut) {
    dut.eval();

#if VM_TRACE
    if (g_trace != nullptr) {
        g_trace->dump(g_time++);
    }
#endif
}


template <typename DUT>
void tb_clock(DUT& dut) {
    dut.clk = 0;
    tb_eval(dut);

    dut.clk = 1;
    tb_eval(dut);

    dut.clk = 0;
    tb_eval(dut);
}


void tb_close_trace();