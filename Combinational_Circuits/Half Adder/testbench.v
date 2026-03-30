`timescale 1ns/1ns
`include "adders_example.v"

module adders_example_tb;
  reg A, B;
  wire S, C;

  // Instantiate the design under test (DUT)
  half_adder_dataflow uut(S, C, A, B);  // <-- Must match your module name in adders_example.v

  initial begin
    $dumpfile("adders_example.vcd");   // Generate VCD for GTKWave
    $dumpvars(0, adders_example_tb);   // Dump all signals

    $display("time\tA B | S C");
    $monitor("%g\t%b %b | %b %b", $time, A, B, S, C);

    // Test cases
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $finish;  // <-- Semicolon was missing
  end
endmodule
