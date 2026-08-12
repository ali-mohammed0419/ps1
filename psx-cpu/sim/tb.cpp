#include "tb.h"


vluint64_t g_time = 0;

#if VM_TRACE
VerilatedVcdC* g_trace = nullptr;
#endif


void tb_close_trace() {
#if VM_TRACE
    if (g_trace != nullptr) {
        g_trace->close();
        delete g_trace;
        g_trace = nullptr;
    }
#endif
}