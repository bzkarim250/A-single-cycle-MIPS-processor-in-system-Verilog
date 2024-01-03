
// RegisterFile_TB.sv

module RegisterFile_TB;

    // Parameters for the module instantiation
    parameter DATA_WIDTH = 32;
    parameter NUM_REGISTERS = 32;

    // Signals for connecting to the RegisterFile module
    logic clk, rst;
    logic [4:0] readRegister1, readRegister2, writeRegister;
    logic [DATA_WIDTH-1:0] writeData;
    logic writeEnable;
    logic [DATA_WIDTH-1:0] readData1, readData2;

    // Instantiate the RegisterFile module
    RegisterFile #(DATA_WIDTH, NUM_REGISTERS) rf (
        .clk(clk),
        .rst(rst),
        .readRegister1(readRegister1),
        .readRegister2(readRegister2),
        .writeRegister(writeRegister),
        .writeData(writeData),
        .writeEnable(writeEnable),
        .readData1(readData1),
        .readData2(readData2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus generation and monitoring
    initial begin
        // Initialize signals
        rst = 1;
        readRegister1 = 5'b00000;
        readRegister2 = 5'b00001;
        writeRegister = 5'b00010;
        writeData = 32'hAABBCCDD;
        writeEnable = 0;

        // Apply reset for a few clock cycles
        #10 rst = 0;

        // Test scenario: Write data to register 2, then read it
        #10 writeEnable = 1;
        #10 writeData = 32'h11223344;
        #10 writeEnable = 0;

        #10 readRegister1 = 5'b00000;
        #10 readRegister2 = 5'b00010;
        #10 writeEnable = 0;
        // At this point, readData1 should contain 32'h00000000 (from register 0)
        // and readData2 should contain 32'h11223344 (from register 2)

        // End simulation after some time
        #100 $finish;
    end

endmodule
