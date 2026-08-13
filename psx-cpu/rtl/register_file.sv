module register_file (
    input   logic           clk,
    input   logic [4:0]     rs,
    input   logic [4:0]     rt,
    input   logic           wr_en,
    input   logic [4:0]     wr_addr,
    input   logic [31:0]    wr_data,
    output  logic [31:0]    Rrs,
    output  logic [31:0]    Rrt
);

    logic [31:0]            registers [31:0];

    always_comb begin
        Rrs = registers[rs];
        Rrt = registers[rt];
    end

    always_ff @(posedge clk) begin
        if(wr_en && wr_addr != 5'b0)
            registers[wr_addr] <= wr_data;
    end

endmodule
