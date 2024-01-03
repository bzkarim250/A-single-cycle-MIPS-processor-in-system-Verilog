// MUX2to1.sv

module MUX2to1 #(
    parameter DATA_WIDTH = 32
)(
    input logic [DATA_WIDTH-1:0] inputA,
    input logic [DATA_WIDTH-1:0] inputB,
    input logic select,
    output logic [DATA_WIDTH-1:0] outputData
);

    // MUX operation
    assign outputData = (select == 1) ? inputB : inputA;

endmodule

