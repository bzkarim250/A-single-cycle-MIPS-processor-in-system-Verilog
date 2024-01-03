
// ProgramCounter.sv

module ProgramCounter #(
    parameter ADDR_WIDTH = 12
)(
    input logic clk,
    input logic rst,
    input logic [ADDR_WIDTH-1:0] nextAddress,
    output logic [ADDR_WIDTH-1:0] currentAddress
);

    // Internal register to hold the current address
    logic [ADDR_WIDTH-1:0] pcRegister;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the program counter on reset signal
            pcRegister <= 0;
        end else begin
            // Update the program counter with the next address
            pcRegister <= nextAddress;
        end
    end

    // Output the current address
    assign currentAddress = pcRegister;

endmodule
