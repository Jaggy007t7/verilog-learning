`timescale 1ns/1ns
`include "sr_latch.v"   // Include your main module

module sr_latch_tb;

  // Testbench signals
  reg s, r;
  wire q, qbar;

  // Instantiate the SR Latch
  sr_latch uut (
    .s(s),
    .r(r),
    .q(q),
    .qbar(qbar)
  );

  // Generate waveform file
  initial begin
    $dumpfile("sr_latch.vcd"); // Name of the waveform file
    $dumpvars(0, sr_latch_tb); // Dump all variables in the testbench
  end

  // Apply test vectors
  initial begin
    $display("Time\tS R | Q Qbar");
    $monitor("%0t\t%b %b | %b %b", $time, s, r, q, qbar);

    // Initial state
    s = 0; r = 0; #10;   // Both low - Hold state
    s = 1; r = 0; #10;   // Set Q
    s = 0; r = 0; #10;   // Hold
    s = 0; r = 1; #10;   // Reset Q
    s = 0; r = 0; #10;   // Hold
    s = 1; r = 1; #10;   // Invalid state (Both 1)
    s = 0; r = 0; #10;   // Back to Hold

    $finish;
  end

endmodule
