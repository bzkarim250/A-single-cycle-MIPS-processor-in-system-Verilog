
// ProgramCounter_TB.sv

module ProgramCounter_TB;

    // Parameters for the module instantiation
    parameter ADDR_WIDTH = 12;

    // Signals for connecting to the ProgramCounter module
    logic clk, rst;
    logic [ADDR_WIDTH-1:0] nextAddress, currentAddress;

    // Instantiate the ProgramCounter module
    ProgramCounter #(ADDR_WIDTH) pc (
        .clk(clk),
        .rst(rst),
        .nextAddress(nextAddress),
        .currentAddress(currentAddress)
    );

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        nextAddress = 12'h000;

        // Apply reset
        rst = 1;
        #10 rst = 0;

        // Clock the program counter and observe the output
        repeat (10) begin
            #5 clk = ~clk;
        end

        // Load a new address into the program counter
        nextAddress = 12'h123;
        #10 $display("Current Address: %h", currentAddress);

        // Clock the program counter and observe the updated output
        repeat (5) begin
            #5 clk = ~clk;
        end

        // End simulation after some time
        #100 $finish;
    end

endmodule
