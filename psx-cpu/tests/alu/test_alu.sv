`timescale 1ns/1ps

module test_alu;

    logic [31:0] Xin;
    logic [31:0] Yin;
    logic [3:0]  operation;
    logic [31:0] result;
    string wave_file;

    alu dut (
        .Xin       (Xin),
        .Yin       (Yin),
        .operation (operation),
        .result    (result)
    );

    task automatic expect_result(input logic [31:0] expected);
        #1;
        assert (result === expected)
            else $fatal(1, "expected result 0x%08h, got 0x%08h", expected, result);
    endtask

    initial begin
        if ($value$plusargs("WAVE_FILE=%s", wave_file)) begin
            $dumpfile(wave_file);
            $dumpvars(0, test_alu);
        end

        $display("Testing ALU...");

        Xin = 10; Yin = 20; operation = 0; expect_result(30);
        Xin = 20; Yin = 10; operation = 1; expect_result(10);
        Xin = 32'hF0F0F0F0; Yin = 32'h0F0F0F0F; operation = 2; expect_result(0);
        Xin = 32'hF0000000; Yin = 32'h0F000000; operation = 3; expect_result(32'hFF000000);
        Xin = 32'hFF00FF00; Yin = 32'h0F0F0F0F; operation = 4; expect_result(32'hF00FF00F);
        Xin = 32'hFFFFFFFF; Yin = 0; operation = 5; expect_result(0);
        Xin = 32'hFFFFFFFF; Yin = 1; operation = 6; expect_result(1);
        Xin = 32'hFFFFFFFF; Yin = 1; operation = 7; expect_result(0);
        Xin = 1; Yin = 4; operation = 8; expect_result(16);
        Xin = 32'h80000000; Yin = 1; operation = 9; expect_result(32'h40000000);
        Xin = 32'h80000000; Yin = 1; operation = 10; expect_result(32'hC0000000);

        $display("PASS: ALU");
        $finish;
    end

endmodule
