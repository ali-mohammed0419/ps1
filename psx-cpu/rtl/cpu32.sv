module r3000a (
    input   logic           clk,
    input   logic           reset,
    output  logic [31:0]    pc
);

    //logic [31:0] pc;
    logic [31:0] next_pc;

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