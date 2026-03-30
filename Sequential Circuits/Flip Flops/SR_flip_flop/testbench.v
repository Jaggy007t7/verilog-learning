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

// Clock generation (toggle every 5 ns → 10 ns period = 100 MHz)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus block
initial begin
    // Dump file setup for GTKWave
    $dumpfile("sr_flip_flop_tb.vcd");
    $dumpvars(0, sr_flip_flop_tb);

    // Initialize inputs
    s = 0; r = 0;

    // Apply test cases
    #10 s = 1; r = 0;   // Set
    #20 s = 0; r = 0;   // Hold
    #20 s = 0; r = 1;   // Reset
    #20 s = 1; r = 1;   // Invalid condition
    #20 s = 0; r = 0;   // Hold again
    #20 s = 1; r = 0;   // Set again
    #20 $finish;
end

endmodule
