// MUX2to1_TB.sv

module MUX2to1_TB;

    // Parameters for the module instantiation
    parameter DATA_WIDTH = 32;

    // Signals for connecting to the MUX2to1 module
    logic [DATA_WIDTH-1:0] inputA, inputB;
    logic select;
    logic [DATA_WIDTH-1:0] outputData; // Use a different name for the output

    // Instantiate the MUX2to1 module
    MUX2to1 #(DATA_WIDTH) mux (
        .inputA(inputA),
        .inputB(inputB),
        .select(select),
        .outputData(outputData) // Use a different name for the output
    );

    // Stimulus generation
    initial begin
        // Test scenario: select = 0 (inputA selected)
        inputA = 32'hAABBCCDD;
        inputB = 32'h00112233;
        select = 0;
        #10 $display("Output: %h", outputData);

        // Test scenario: select = 1 (inputB selected)
        inputA = 32'hAABBCCDD;
        inputB = 32'h00112233;
        select = 1;
        #10 $display("Output: %h", outputData);

        // End simulation after some time
        #100 $finish;
    end

endmodule

