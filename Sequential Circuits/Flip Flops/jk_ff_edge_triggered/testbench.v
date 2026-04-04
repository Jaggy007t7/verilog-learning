// Testbench for JK Flip-Flop
`timescale 1ns/1ns
module tb_jk_ff;

// Testbench signals
reg j, k, clk;
wire q, qbar;

// Instantiate the DUT (Device Under Test)
jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qbar(qbar)
);

// Clock generation: toggle every 5ns -> 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Apply stimulus
initial begin
    // Create VCD file for GTKWave
    $dumpfile("jk_ff_tb.vcd");   // VCD file name
    $dumpvars(0, tb_jk_ff);      // Dump all variables in this testbench

    // Monitor signals on console too
    $monitor("Time=%0t | J=%b K=%b | Q=%b Qbar=%b", $time, j, k, q, qbar);

    // Initialize
    j = 0; k = 0;

    // Apply test cases
    #10 j=0; k=0; // No change
    #10 j=0; k=1; // Reset
    #10 j=1; k=0; // Set
    #10 j=1; k=1; // Toggle
    #10 j=0; k=0; // No change again
    #10 j=1; k=1; // Toggle again
    #20 $finish;  // End simulation
end

endmodule
