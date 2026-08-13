`timescale 1ns/1ps

module test_pc;

    logic clk = 1'b0;
    logic reset = 1'b0;
    string wave_file;

    r3000a dut (
        .clk   (clk),
        .reset (reset)
    );

    task automatic tick;
        #1 clk = 1'b1;
        #1 clk = 1'b0;
    endtask

    task automatic expect_pc(input logic [31:0] expected);
        assert (dut.pc === expected)
            else $fatal(1, "expected PC 0x%08h, got 0x%08h", expected, dut.pc);
    endtask

    initial begin
        if ($value$plusargs("WAVE_FILE=%s", wave_file)) begin
            $dumpfile(wave_file);
            $dumpvars(0, test_pc);
        end

        $display("Testing PC...");

        reset = 1'b1;
        tick();
        expect_pc(32'h00000000);

        reset = 1'b0;
        tick();
        expect_pc(32'h00000004);

        repeat (24) tick();
        expect_pc(32'h00000064);

        reset = 1'b1;
        tick();
        expect_pc(32'h00000000);

        reset = 1'b0;
        tick();
        expect_pc(32'h00000004);

        $display("PASS: PC");
        $finish;
    end

endmodule
