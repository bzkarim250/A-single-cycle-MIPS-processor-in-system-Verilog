// RegisterFile.sv

module RegisterFile #(
    parameter DATA_WIDTH = 32,
    parameter NUM_REGISTERS = 32
)(
    input logic clk,
    input logic rst,
    input logic [4:0] readRegister1,
    input logic [4:0] readRegister2,
    input logic [4:0] writeRegister,
    input logic [DATA_WIDTH-1:0] writeData,
    input logic writeEnable,
    output logic [DATA_WIDTH-1:0] readData1,
    output logic [DATA_WIDTH-1:0] readData2
);

    // Example: Use an array to represent registers
    logic [DATA_WIDTH-1:0] registers [0:NUM_REGISTERS-1];

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset on reset signal
            for (int i = 0; i < NUM_REGISTERS; i++) begin
                registers[i] <= '0;
            end
            readData1 <= 32'h00000000;
            readData2 <= 32'h00000000;
        end else begin
            // Simulate register read
            readData1 <= registers[readRegister1];
            readData2 <= registers[readRegister2];

            // Simulate register write if writeEnable is asserted
            if (writeEnable) begin
                registers[writeRegister] <= writeData;
            end
        end
    end

endmodule

