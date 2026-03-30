// Testbench for Gray to Binary Code Converter
`timescale 1ns/1ns

module tb_gray_to_bin;

reg [3:0] I;
wire [3:0] O;

// Instantiate the module under test
gray_to_bin uut (
    .I(I),
    .O(O)
);

initial begin
    // Create dump file for GTKWave
    $dumpfile("gray_to_bin.vcd");
    $dumpvars(0, tb_gray_to_bin);

    // Apply different Gray code inputs
    I = 4'b0000; #10;
    I = 4'b0001; #10;
    I = 4'b0011; #10;
    I = 4'b0010; #10;
    I = 4'b0110; #10;
    I = 4'b0111; #10;
    I = 4'b0101; #10;
    I = 4'b0100; #10;
    I = 4'b1100; #10;
    I = 4'b1101; #10;
    I = 4'b1111; #10;
    I = 4'b1110; #10;
    I = 4'b1010; #10;
    I = 4'b1011; #10;
    I = 4'b1001; #10;
    I = 4'b1000; #10;

    $finish;
end

endmodule
