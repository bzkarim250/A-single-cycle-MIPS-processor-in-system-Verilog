
// ShiftRegister_TB.sv

module ShiftRegister_TB;

    // Parameters for the module instantiation
    parameter DATA_WIDTH = 4;

    // Signals for connecting to the ShiftRegister module
    logic clk, rst, shiftLeft;
    logic [DATA_WIDTH-1:0] inputData, outputData;

    // Instantiate the ShiftRegister module
    ShiftRegister #(DATA_WIDTH) sr (
        .clk(clk),
        .rst(rst),
        .shiftLeft(shiftLeft),
        .inputData(inputData),
        .outputData(outputData)
    );

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        shiftLeft = 1; // Start with a left shift
        inputData = 4'b1010;

        // Apply reset
        rst = 1;
        #10 rst = 0;

        // Clock the shift register and observe the output
        repeat (5) begin
            #5 clk = ~clk;
        end

        // Change the shift direction and input data
        shiftLeft = 0; // Right shift
        inputData = 4'b0011;

        // Clock the shift register and observe the updated output
        repeat (5) begin
            #5 clk = ~clk;
        end

        // End simulation after some time
        #100 $finish;
    end

endmodule
