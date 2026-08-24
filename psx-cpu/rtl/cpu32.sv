import mips_defs::*;
module r3000a (
    input   logic           clk,
    input   logic           reset
);
    // Instruction memory and PC Counter
    logic [31:0]    instruction;
    logic [31:0]    pc;
    logic [31:0]    next_pc;

    // Instruction field decode
    logic [5:0]     opcode;
    logic [4:0]     rs;
    logic [4:0]     rt;
    logic [4:0]     rd;
    logic [4:0]     shamt;
    logic [15:0]    immediate;
    logic [25:0]    address;
    logic [5:0]     funct;

    //Register file ctrl
    logic           decode_wr_en;
    logic           rf_wr_en;
    logic [4:0]     wr_addr;
    logic [31:0]    wr_data;
    logic [31:0]    Rrs;
    logic [31:0]    Rrt;
    logic [3:0]     alu_op;

    //ALU out
    logic [31:0]    alu_out;


    instruction_memory instruction_memory (
        .address        (pc),
        .instruction    (instruction)
    );

    decoder decoder (
        .instruction    (instruction),
        .opcode         (opcode),
        .rs             (rs),
        .rt             (rt),
        .rd             (rd),
        .shamt          (shamt),
        .immediate      (immediate),
        .address        (address),
        .funct          (funct),
        .alu_op         (alu_op),
        .reg_wr         (decode_wr_en)
    );

    assign rf_wr_en = decode_wr_en && !reset;

    register_file register_file (
        .clk            (clk),
        .rs             (rs),
        .rt             (rt),
        .wr_en          (rf_wr_en),
        .wr_addr        (wr_addr),
        .wr_data        (wr_data),
        .Rrs            (Rrs),
        .Rrt            (Rrt)
    );

    alu alu (
        .Xin            (Rrs),
        .Yin            (Rrt),
        .operation      (alu_op),
        .result         (alu_out)
    );

    always_comb begin
        //decode_wr_en = 1'b0;
        wr_addr = 5'b0;
        wr_data = alu_out;
        if(opcode == OP_SPECIAL)
            wr_addr = rd;
    end

    always_comb begin
        next_pc = pc + 4;
    end

    always_ff @(posedge clk) begin
        if(reset)
            pc <= 32'b0;
        else begin
            pc <= next_pc;
        end
    end

endmodule
