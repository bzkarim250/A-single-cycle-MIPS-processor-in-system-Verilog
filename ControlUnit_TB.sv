
// ControlUnit_TB.sv

module ControlUnit_TB;

    // Parameters for the module instantiation
    parameter OPCODE_WIDTH = 6;

    // Signals for connecting to the ControlUnit module
    logic [OPCODE_WIDTH-1:0] opcode;
    logic [2:0] aluOp, funct;

    // Instantiate the ControlUnit module
    ControlUnit #(OPCODE_WIDTH) cu (
        .opcode(opcode),
        .aluOp(aluOp),
        .funct(funct)
    );

    // Stimulus generation
    initial begin
        // Test scenario: R-type instruction (opcode = 000000)
        opcode = 6'b000000;
        #10 $display("ALUOp: %0b, Funct: %0b", aluOp, funct);

        // Test scenario: I-type instruction (opcode = 001000)
        opcode = 6'b001000;
        #10 $display("ALUOp: %0b, Funct: %0b", aluOp, funct);

        // Add more test scenarios as needed

        // End simulation after some time
        #100 $finish;
    end

endmodule
