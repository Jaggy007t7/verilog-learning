`timescale 1ns/1ns
module sr_flip_flop_tb();

// Inputs
reg s, r, clk;

// Outputs
wire q, qbar;

// Instantiate the Unit Under Test (UUT)
sr_flip_flop uut (
    .s(s),
    .r(r),
    .clk(clk),
    .q(q),
    .qbar(qbar)
);

// Clock generation (toggle every 5 ns → 10 ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    // Setup for GTKWave dump
    $dumpfile("sr_flip_flop_tb.vcd");
    $dumpvars(0, sr_flip_flop_tb);

    // Initialize
    s = 0; r = 0;

    // Apply test cases
    #12 s = 1; r = 0;   // Set
    #10 s = 0; r = 0;   // Hold
    #10 s = 0; r = 1;   // Reset
    #10 s = 0; r = 0;   // Hold
    #10 s = 1; r = 1;   // Invalid
    #10 s = 0; r = 0;   // Hold
    #10 s = 1; r = 0;   // Set again
    #10 s = 0; r = 1;   // Reset again
    #10 $finish;
end

endmodule
