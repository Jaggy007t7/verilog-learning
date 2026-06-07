`timescale 1ns/1ns
module testbench_fourbit_alu();

    reg [3:0] a, b;
    reg [2:0] sel;
    wire [4:0] out;

    // Instantiate the ALU
    fourbit_alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Dump waveform data for GTKWave
        $dumpfile("fourbit_alu.vcd");
        $dumpvars(0, testbench_fourbit_alu);

        // Test all ALU operations with example inputs
        a = 4'b0101; b = 4'b0011; sel = 3'b000; #10; // No operation (zero output)
        sel = 3'b001; #10;  // Addition: 5 + 3 = 8
        sel = 3'b010; #10;  // Subtraction: 5 - 3 = 2
        sel = 3'b011; #10;  // AND: 5 & 3 = 1
        sel = 3'b100; #10;  // OR: 5 | 3 = 7
        sel = 3'b101; #10;  // NOT a: ~5 = 1010 (inverted bits)
        sel = 3'b110; #10;  // NOT b: ~3 = 1100
        sel = 3'b111; #10;  // XOR: 5 ^ 3 = 6

        // Additional values to verify operations with different inputs
        a = 4'b1111; b = 4'b0000; sel = 3'b001; #10;
        a = 4'b1001; b = 4'b0101; sel = 3'b010; #10;

        $finish;
    end

endmodule
