
// DataMemory.sv

module DataMemory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8
)(
    input logic clk,
    input logic rst,
    input logic [ADDR_WIDTH-1:0] address,
    input logic [DATA_WIDTH-1:0] writeData,
    input logic writeEnable,
    output logic [DATA_WIDTH-1:0] readData
);

    // Example: Use a memory array to store data
    logic [DATA_WIDTH-1:0] mem[0:(1 << ADDR_WIDTH) - 1];

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset on reset signal
            readData <= 32'h00000000;
        end else begin
            // Simulate memory read
            readData <= mem[address];

            // Simulate memory write if writeEnable is asserted
            if (writeEnable) begin
                mem[address] <= writeData;
            end
        end
    end

endmodule
