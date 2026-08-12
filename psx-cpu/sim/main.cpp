#include "verilated.h"
#include "test_config.h"

#include DUT_HEADER
#include TEST_HEADER

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    DUT_CLASS dut;

    TEST_FUNCTION(dut);

    dut.final();

    return 0;
}