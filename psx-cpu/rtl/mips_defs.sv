package mips_defs;

    typedef enum logic [5:0] {
        OP_SPECIAL = 6'h00,  // R-type; decode funct field
        OP_REGIMM  = 6'h01,  // BLTZ/BGEZ/etc.; decode rt field

        OP_J       = 6'h02,
        OP_JAL     = 6'h03,
        OP_BEQ     = 6'h04,
        OP_BNE     = 6'h05,
        OP_BLEZ    = 6'h06,
        OP_BGTZ    = 6'h07,

        OP_ADDI    = 6'h08,
        OP_ADDIU   = 6'h09,
        OP_SLTI    = 6'h0A,
        OP_SLTIU   = 6'h0B,
        OP_ANDI    = 6'h0C,
        OP_ORI     = 6'h0D,
        OP_XORI    = 6'h0E,
        OP_LUI     = 6'h0F,

        OP_COP0    = 6'h10,
        OP_COP1    = 6'h11,
        OP_COP2    = 6'h12,
        OP_COP3    = 6'h13,

        OP_LB      = 6'h20,
        OP_LH      = 6'h21,
        OP_LWL     = 6'h22,
        OP_LW      = 6'h23,
        OP_LBU     = 6'h24,
        OP_LHU     = 6'h25,
        OP_LWR     = 6'h26,

        OP_SB      = 6'h28,
        OP_SH      = 6'h29,
        OP_SWL     = 6'h2A,
        OP_SW      = 6'h2B,
        OP_SWR     = 6'h2E,

        OP_LWC0    = 6'h30,
        OP_LWC1    = 6'h31,
        OP_LWC2    = 6'h32,
        OP_LWC3    = 6'h33,

        OP_SWC0    = 6'h38,
        OP_SWC1    = 6'h39,
        OP_SWC2    = 6'h3A,
        OP_SWC3    = 6'h3B
    } opcode_t;


    typedef enum logic [5:0] {
        FUNCT_SLL     = 6'h00,
        FUNCT_SRL     = 6'h02,
        FUNCT_SRA     = 6'h03,
        FUNCT_SLLV    = 6'h04,
        FUNCT_SRLV    = 6'h06,
        FUNCT_SRAV    = 6'h07,

        FUNCT_JR      = 6'h08,
        FUNCT_JALR    = 6'h09,

        FUNCT_SYSCALL = 6'h0C,
        FUNCT_BREAK   = 6'h0D,

        FUNCT_MFHI    = 6'h10,
        FUNCT_MTHI    = 6'h11,
        FUNCT_MFLO    = 6'h12,
        FUNCT_MTLO    = 6'h13,

        FUNCT_MULT    = 6'h18,
        FUNCT_MULTU   = 6'h19,
        FUNCT_DIV     = 6'h1A,
        FUNCT_DIVU    = 6'h1B,

        FUNCT_ADD     = 6'h20,
        FUNCT_ADDU    = 6'h21,
        FUNCT_SUB     = 6'h22,
        FUNCT_SUBU    = 6'h23,
        FUNCT_AND     = 6'h24,
        FUNCT_OR      = 6'h25,
        FUNCT_XOR     = 6'h26,
        FUNCT_NOR     = 6'h27,

        FUNCT_SLT     = 6'h2A,
        FUNCT_SLTU    = 6'h2B
    } funct_t;


    typedef enum logic [4:0] {
        RT_BLTZ   = 5'h00,
        RT_BGEZ   = 5'h01,
        RT_BLTZAL = 5'h10,
        RT_BGEZAL = 5'h11
    } regimm_t;

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

endpackage