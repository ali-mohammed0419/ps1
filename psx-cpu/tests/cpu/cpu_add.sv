`timescale 1ns/1ps

module cpu_add;

logic clk = 1'b0;
logic reset = 1'b0;
string wave_file;

always #1 clk = ~clk;

r3000a dut (
    .clk   (clk),
    .reset (reset)
);

task automatic tick;
    @(posedge clk);
    @(negedge clk);
endtask

initial begin
    if ($value$plusargs("WAVE_FILE=%s", wave_file)) begin
        $dumpfile(wave_file);
        $dumpvars(0, cpu_add);
    end

    // Reset
    reset = 1'b1;
    tick();

    // Preload source register
    dut.register_file.registers[1] = 32'd10;

    // While reset is asserted, no architectural register write should occur.
    assert (dut.register_file.registers[2] !== 32'd20)
        else $fatal(1, "register write occurred while reset was high");

    // Leave some waveform space before execution
    repeat (3) tick();

    assert (dut.register_file.registers[2] !== 32'd20)
        else $fatal(1, "register write occurred during reset hold");

    reset = 1'b0;

    // Instruction 1:
    // add $2, $1, $1
    tick();

    $display(
        "PC=%08h  $1=%0d $2=%0d $3=%0d $4=%0d $5=%0d",
        dut.pc,
        dut.register_file.registers[1],
        dut.register_file.registers[2],
        dut.register_file.registers[3],
        dut.register_file.registers[4],
        dut.register_file.registers[5]
    );

    // assert (dut.register_file.registers[2] === 32'd20)
    //     else $fatal(1, "Instruction 1 failed: expected $2 = 20");

    // Instruction 2:
    // add $3, $1, $1
    tick();

    $display(
        "PC=%08h  $1=%0d $2=%0d $3=%0d $4=%0d $5=%0d",
        dut.pc,
        dut.register_file.registers[1],
        dut.register_file.registers[2],
        dut.register_file.registers[3],
        dut.register_file.registers[4],
        dut.register_file.registers[5]
    );

    // assert (dut.register_file.registers[3] === 32'd20)
    //     else $fatal(1, "Instruction 2 failed: expected $3 = 20");

    // Instruction 3:
    // add $4, $2, $2
    tick();

    $display(
        "PC=%08h  $1=%0d $2=%0d $3=%0d $4=%0d $5=%0d",
        dut.pc,
        dut.register_file.registers[1],
        dut.register_file.registers[2],
        dut.register_file.registers[3],
        dut.register_file.registers[4],
        dut.register_file.registers[5]
    );

    // assert (dut.register_file.registers[4] === 32'd40)
    //     else $fatal(1, "Instruction 3 failed: expected $4 = 40");

    // Instruction 4:
    // add $5, $2, $2
    tick();

    $display(
        "PC=%08h  $1=%0d $2=%0d $3=%0d $4=%0d $5=%0d",
        dut.pc,
        dut.register_file.registers[1],
        dut.register_file.registers[2],
        dut.register_file.registers[3],
        dut.register_file.registers[4],
        dut.register_file.registers[5]
    );

    // assert (dut.register_file.registers[5] === 32'd40)
    //     else $fatal(1, "Instruction 4 failed: expected $5 = 40");

    $display("PASS");

    // Extra waveform space after execution
    repeat (3) tick();

    $finish;
end

endmodule
