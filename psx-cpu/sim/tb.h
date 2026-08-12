#pragma once

#include "Vcpu32.h"

void tb_init_trace(Vcpu32& dut, const char* trace_path);
void tb_close_trace();
void tb_eval(Vcpu32& dut);
void tb_clock(Vcpu32& dut);
