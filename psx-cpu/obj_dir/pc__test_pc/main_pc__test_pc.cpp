#include "Vcpu32.h"
#include "verilated.h"

#include "/Users/alimohammed/Projects/FPGA/Verilator/PS1/psx-cpu/tests/pc/test_pc.h"

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    Vcpu32 dut;
    test_pc(dut);
    dut.final();

    return 0;
}
