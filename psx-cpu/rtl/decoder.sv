import mips_defs::opcode_t;
import mips_defs::funct_t;
import mips_defs::regimm_t;

module decoder (
    input   logic [31:0]    instruction,
    output  logic [5:0]     opcode,
    output  logic [4:0]     rs,
    output  logic [4:0]     rt,
    output  logic [4:0]     rd,
    output  logic [4:0]     shamt,
    output  logic [15:0]    immediate,
    output  logic [25:0]    address,
    output  logic [5:0]     funct,
    output  logic [3:0]     alu_op,
    output  logic           reg_wr
);

    assign opcode       = instruction[31:26];
    assign rs           = instruction[25:21];
    assign rt           = instruction[20:16];
    assign rd           = instruction[15:11];
    assign shamt        = instruction[10:6];
    assign funct        = instruction[5:0];
    assign immediate    = instruction[15:0];
    assign address      = instruction[25:0];

    always_comb begin
        case (opcode)
            OP_SPECIAL: begin
                case (funct)
                    FUNCT_ADDU,
                    FUNCT_ADD: begin
                        alu_op = ALU_ADD;
                        reg_wr = 1'b1;
                    end
                    FUNCT_SUBU,
                    FUNCT_SUB: begin
                        alu_op = ALU_SUB;
                        reg_wr = 1'b1;
                    end
                    FUNCT_OR: begin
                        alu_op = ALU_OR;
                        reg_wr = 1'b1;
                    end
                    FUNCT_XOR: begin
                        alu_op = ALU_XOR;
                        reg_wr = 1'b1;
                    end
                    FUNCT_NOR: begin
                        alu_op = ALU_NOR;
                        reg_wr = 1'b1;
                    end
                    FUNCT_AND: begin
                        alu_op = ALU_AND;
                        reg_wr = 1'b1;
                    end
                    FUNCT_SLTU: begin
                        alu_op = ALU_SLTU;
                        reg_wr = 1'b1;
                    end
                    FUNCT_SLT: begin
                        alu_op = ALU_SLT;
                        reg_wr = 1'b1;
                    end
                    FUNCT_SLL: begin
                        alu_op = ALU_SLL;
                        reg_wr = 1'b1;
                    end
                    FUNCT_SRL: begin
                        alu_op = ALU_SRL;
                        reg_wr = 1'b1;
                    end
                    FUNCT_SRA: begin
                        alu_op = ALU_SRA;
                        reg_wr = 1'b1;
                    end
                    default: begin end
                endcase
            end
            default: begin end
        endcase
    end

endmodule