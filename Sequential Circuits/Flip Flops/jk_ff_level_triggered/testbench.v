`timescale 1ns/1ns
module jk_ff_tb();

// Inputs
reg j, k, clk;

// Outputs
wire q, qbar;

// Instantiate the Unit Under Test (UUT)
jk_ff uut (
    .j(j),
    .k(k),
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
    // Dumpfile for GTKWave
    $dumpfile("jk_ff_tb.vcd");
    $dumpvars(0, jk_ff_tb);

    // Initialize inputs
    j = 0; k = 0;

    // Apply test cases
    #10 j = 0; k = 0;   // Hold
    #20 j = 1; k = 0;   // Set
    #20 j = 0; k = 1;   // Reset
    #20 j = 1; k = 1;   // Toggle
    #20 j = 0; k = 0;   // Hold
    #20 j = 1; k = 0;   // Set again
    #20 j = 1; k = 1;   // Toggle again
    #20 $finish;
end

endmodule
