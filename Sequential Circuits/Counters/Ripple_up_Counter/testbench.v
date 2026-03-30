// Testbench for ripple_up_counter.v
`timescale 1ns/1ns

module ripple_up_counter_tb;

// Testbench signals
reg clk;
reg reset;
wire [3:0] q;

// Instantiate the ripple up counter module
ripple_up_counter uut (
    .q(q),
    .clk(clk),
    .reset(reset)
);

// Clock generation: 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset and simulation stimulus
initial begin
    reset = 1;
    #12;
    reset = 0;
    #100;

    reset = 1;
    #10;
    reset = 0;
    #60;

    $finish;
end

// Monitor outputs to the console
initial begin
    $display("Time\treset\tq");
    $monitor("%0dns\t%b\t%b", $time, reset, q);
end

// Generate waveform dump for GTKWave
initial begin
    $dumpfile("ripple_up_counter.vcd");
    $dumpvars(0, ripple_up_counter_tb);
end

endmodule
