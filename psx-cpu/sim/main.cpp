#include "Vcpu32.h"
#include "verilated.h"

#include "../tests/pc/test_pc.h"

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    Vcpu32 dut;

    test_pc(dut);

    dut.final();

    return 0;
}