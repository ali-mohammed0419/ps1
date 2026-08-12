typedef enum logic [3:0] {
    ALU_ADD,
    ALU_SUB,
    ALU_AND,
    ALU_OR,
    ALU_XOR,
    ALU_NOR,
    ALU_SLT,
    ALU_SLTU,
    ALU_SLL,
    ALU_SRL,
    ALU_SRA
} alu_func_t;

module alu (
    input   logic [31:0]    Xin,
    input   logic [31:0]    Yin,
    input   alu_func_t      operation,
    output  logic [31:0]    result
);

    always_comb begin
        case (operation)
            ALU_ADD:  result = Xin + Yin;
            ALU_SUB:  result = Xin - Yin;
            ALU_AND:  result = Xin & Yin;
            ALU_OR:   result = Xin | Yin;
            ALU_XOR:  result = Xin ^ Yin;
            ALU_NOR:  result = ~(Xin | Yin);
            ALU_SLT:  result = ($signed(Xin) < $signed(Yin)) ? 32'd1 : 32'd0;
            ALU_SLTU: result = (Xin < Yin) ? 32'd1 : 32'd0;
            ALU_SLL:  result = Xin << Yin[4:0];
            ALU_SRL:  result = Xin >> Yin[4:0];
            ALU_SRA:  result = $signed(Xin) >>> Yin[4:0];
            default:  result = 32'hDEADBEEF;
        endcase
    end
endmodule