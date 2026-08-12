#include "test_pc.h"

#include <cstdlib>
#include <cstdint>
#include <iostream>

#include "../../sim/tb.h"

static void expect_pc(Vcpu32& dut, uint32_t expected) {
    if (dut.pc != expected) {
        std::cerr
            << "FAIL: expected PC = 0x"
            << std::hex << expected
            << ", got 0x"
            << dut.pc
            << '\n';

        std::exit(1);
    }
}

void test_pc(Vcpu32& dut) {
    std::cout << "Testing PC...\n";

    dut.reset = 1;
    tb_clock(dut);
    dut.reset = 0;
    for(int i = 0; i < 25; i++)
        tb_clock(dut);

    dut.reset = 1;
    tb_clock(dut);
    tb_clock(dut);
    dut.reset = 0;
    for(int i = 0; i < 25; i++)
        tb_clock(dut);
}
