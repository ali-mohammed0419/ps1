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
    output  logic [3:0]     alu_op
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
                    FUNCT_ADD: begin
                        alu_op = ALU_ADD;
                    end
                    default: begin end
                endcase
            end
            default: begin end
        endcase
    end

endmodule