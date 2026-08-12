#include "Vcpu32.h"
#include "verilated.h"

#include "/Users/alimohammed/Projects/FPGA/Verilator/PS1/psx-cpu/sim/tb.h"
#include "/Users/alimohammed/Projects/FPGA/Verilator/PS1/psx-cpu/tests/pc/test_pc.h"

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    Vcpu32 dut;
    tb_init_trace(dut, "/Users/alimohammed/Projects/FPGA/Verilator/PS1/psx-cpu/waves/pc__test_pc.vcd");
    test_pc(dut);
    tb_close_trace();
    dut.final();

    return 0;
}
