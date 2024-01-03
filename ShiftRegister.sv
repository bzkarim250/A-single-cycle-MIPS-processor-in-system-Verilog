// ShiftRegister.sv

module ShiftRegister #(
    parameter DATA_WIDTH = 4
)(
    input logic clk,
    input logic rst,
    input logic shiftLeft,
    input logic [DATA_WIDTH-1:0] inputData,
    output logic [DATA_WIDTH-1:0] outputData
);

    // Internal register to hold the shift register data
    logic [DATA_WIDTH-1:0] shiftRegister;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the shift register on reset signal
            shiftRegister <= 0;
        end else begin
            // Shift left or right based on the control signal
            if (shiftLeft) begin
                shiftRegister <= {shiftRegister[DATA_WIDTH-2:0], inputData};
            end else begin
                shiftRegister <= {inputData, shiftRegister[DATA_WIDTH-1:1]};
            end
        end
    end

    // Output the current state of the shift register
    assign outputData = shiftRegister;

endmodule

