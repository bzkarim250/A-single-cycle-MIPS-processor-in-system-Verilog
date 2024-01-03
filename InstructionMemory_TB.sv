// InstructionMemory.sv

module InstructionMemory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic [ADDR_WIDTH-1:0] address,
    output logic [DATA_WIDTH-1:0] instruction
);

    // Example: Use a memory array to store instructions
    logic [DATA_WIDTH-1:0] mem[0:(1 << ADDR_WIDTH) - 1];

    // Initialize memory content in an initial block
    initial begin
        mem[0] = 32'h12345678;
        mem[1] = 32'h87654321;
        // Add more initializations as needed
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset on reset signal
            instruction <= 32'h00000000;
        end else begin
            // Simulate memory read
            instruction <= mem[address];
        end
    end

endmodule
