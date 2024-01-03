// DataMemory_TB.sv

module DataMemory_TB;

    // Parameters for the module instantiation
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 8;

    // Signals for connecting to the DataMemory module
    logic clk, rst;
    logic [ADDR_WIDTH-1:0] address;
    logic [DATA_WIDTH-1:0] writeData;
    logic writeEnable;
    logic [DATA_WIDTH-1:0] readData;

    // Instantiate the DataMemory module
    DataMemory #(DATA_WIDTH, ADDR_WIDTH) dm (
        .clk(clk),
        .rst(rst),
        .address(address),
        .writeData(writeData),
        .writeEnable(writeEnable),
        .readData(readData)
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
        address = 0;
        writeData = 32'hAABBCCDD;
        writeEnable = 0;

        // Apply reset for a few clock cycles
        #10 rst = 0;

        // Test scenario: Write data to memory and then read it
        #10 address = 0;
        #10 writeEnable = 1;
        #10 writeData = 32'h11223344;
        #10 writeEnable = 0;

        #10 address = 0;
        #10 writeEnable = 0;
        // At this point, readData should contain 32'h11223344

        // End simulation after some time
        #100 $finish;
    end

endmodule
