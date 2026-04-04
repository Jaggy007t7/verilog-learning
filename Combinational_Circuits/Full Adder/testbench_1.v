// Testbench for Full Adder (using only Half Adders)
`timescale 1ns/1ns
module tb_full_adder;

    // Testbench signals
    reg x, y, cin;
    wire sum, cout;

    // Instantiate the full adder
    full_adder uut (
        .x(x),
        .y(y),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("full_adder_tb.vcd");   // Output waveform file
        $dumpvars(0, tb_full_adder);      // Dump all signals in this module
    end

    // Apply all possible input combinations
    initial begin
        $monitor("Time=%0t | X=%b Y=%b Cin=%b | Sum=%b Cout=%b",
                  $time, x, y, cin, sum, cout);

        // 8 input combinations (0 or 1 for x, y, cin)
        x=0; y=0; cin=0; #10;
        x=0; y=0; cin=1; #10;
        x=0; y=1; cin=0; #10;
        x=0; y=1; cin=1; #10;
        x=1; y=0; cin=0; #10;
        x=1; y=0; cin=1; #10;
        x=1; y=1; cin=0; #10;
        x=1; y=1; cin=1; #10;

        $finish; // End simulation
    end

endmodule
