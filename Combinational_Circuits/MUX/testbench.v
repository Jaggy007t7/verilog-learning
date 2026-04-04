`timescale 1ns/1ns
`include "mux.v"    // Include your mux module file

module mux_tb;

    // Inputs as reg (to drive values)
    reg I0, I1, I2, I3;
    reg S0, S1;

    // Output as wire (driven by DUT)
    wire Y;

    // Instantiate the DUT (Device Under Test)
    mux uut(I0, I1, I2, I3, S0, S1, Y);

    initial begin
        // Setup VCD for GTKWave
        $dumpfile("mux_wave.vcd");   // VCD file name
        $dumpvars(0, mux_tb);        // Dump all signals in this module

        // Display header for console
        $display("Time\tS1 S0 | I3 I2 I1 I0 | Y");
        $monitor("%0t\t%b  %b  | %b  %b  %b  %b | %b",
                  $time, S1, S0, I3, I2, I1, I0, Y);

        // Loop through all combinations of inputs & select lines
        I0=0; I1=0; I2=0; I3=0; S0=0; S1=0;
        #5;

        // Test all possible select lines with changing inputs
        I0=1; I1=0; I2=0; I3=0; S1=0; S0=0; #5; // Expect I0
        I0=0; I1=1; I2=0; I3=0; S1=0; S0=1; #5; // Expect I1
        I0=0; I1=0; I2=1; I3=0; S1=1; S0=0; #5; // Expect I2
        I0=0; I1=0; I2=0; I3=1; S1=1; S0=1; #5; // Expect I3

        #10 $finish; // End simulation
    end
endmodule
