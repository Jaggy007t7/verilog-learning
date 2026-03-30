// Testbench for Full Adder using 2 Half Adders
`timescale 1ns/1ns
module tb_full_adder;

    // Testbench signals
    reg x, y, cin;
    wire sum, cout;

    // Instantiate DUT (Device Under Test)
    full_adder uut (
        .x(x),
        .y(y),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // VCD dump for GTKWave
    initial begin
        $dumpfile("full_adder_tb.vcd");   // File to save waveforms
        $dumpvars(0, tb_full_adder);      // Dump everything in this module
    end

    // Apply test cases
    initial begin
        // Monitor outputs in terminal too
        $monitor("Time=%0t | X=%b Y=%b Cin=%b | Sum=%b Cout=%b",
                  $time, x, y, cin, sum, cout);

        // Try all input combinations (8 cases)
        x=0; y=0; cin=0; #10;
        x=0; y=0; cin=1; #10;
        x=0; y=1; cin=0; #10;
        x=0; y=1; cin=1; #10;
        x=1; y=0; cin=0; #10;
        x=1; y=0; cin=1; #10;
        x=1; y=1; cin=0; #10;
        x=1; y=1; cin=1; #10;

        $finish;  // End simulation
    end                 

endmodule
