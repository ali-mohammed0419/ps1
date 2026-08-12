#include "test_alu.h"
#include "../../sim/tb.h"

#include <cstdint>
#include <cstdlib>
#include <iostream>

static void expect_result(Valu32& dut, uint32_t expected) {
    tb_eval(dut);

    if (dut.result != expected) {
        std::cerr
            << "FAIL: expected 0x"
            << std::hex << expected
            << ", got 0x"
            << dut.result
            << '\n';

        std::exit(1);
    }
}

void test_alu(Valu32& dut) {
    std::cout << "Testing ALU...\n";

    // ADD
    dut.Xin = 10;
    dut.Yin = 20;
    dut.operation = 0;
    expect_result(dut, 30);

    // SUB
    dut.Xin = 20;
    dut.Yin = 10;
    dut.operation = 1;
    expect_result(dut, 10);

    // AND
    dut.Xin = 0xF0F0F0F0;
    dut.Yin = 0x0F0F0F0F;
    dut.operation = 2;
    expect_result(dut, 0x00000000);

    // OR
    dut.Xin = 0xF0000000;
    dut.Yin = 0x0F000000;
    dut.operation = 3;
    expect_result(dut, 0xFF000000);

    // XOR
    dut.Xin = 0xFF00FF00;
    dut.Yin = 0x0F0F0F0F;
    dut.operation = 4;
    expect_result(dut, 0xF00FF00F);

    // NOR
    dut.Xin = 0xFFFFFFFF;
    dut.Yin = 0;
    dut.operation = 5;
    expect_result(dut, 0);

    // SLT signed: -1 < 1
    dut.Xin = 0xFFFFFFFF;
    dut.Yin = 1;
    dut.operation = 6;
    expect_result(dut, 1);

    // SLTU unsigned: 0xFFFFFFFF < 1 is false
    dut.Xin = 0xFFFFFFFF;
    dut.Yin = 1;
    dut.operation = 7;
    expect_result(dut, 0);

    // SLL: 1 << 4
    dut.Xin = 1;
    dut.Yin = 4;
    dut.operation = 8;
    expect_result(dut, 16);

    // SRL
    dut.Xin = 0x80000000;
    dut.Yin = 1;
    dut.operation = 9;
    expect_result(dut, 0x40000000);

    // SRA
    dut.Xin = 0x80000000;
    dut.Yin = 1;
    dut.operation = 10;
    expect_result(dut, 0xC0000000);

    std::cout << "PASS: ALU\n";
}