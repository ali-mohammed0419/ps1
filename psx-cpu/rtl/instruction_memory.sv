module instruction_memory (
    input   logic [31:0]        address,
    output  logic [31:0]        instruction
);

    logic [31:0] memory [0:1023];

    initial
        $readmemh("sim/program.hex", memory);

    assign instruction = memory[address[11:2]];

endmodule