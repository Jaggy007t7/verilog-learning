`timescale 1ns/1ns

module tb_counter;

// Testbench signals
reg clk;
reg [3:0] j, k;
wire [3:0] q, qbar;

// Instantiate the counter
counter uut(
    .j(j),
    .k(k),
    .clk(clk),
    .q(q),
    .qbar(qbar)
);

// Clock generation: 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk; // toggle every 5ns -> 10ns period
end

// Initialize inputs
initial begin
    j = 4'b1111; // set all JK inputs high to make it a toggle counter
    k = 4'b1111;
    
    // Optional: monitor the outputs in console
    $monitor("Time=%0t | Q=%b | Qbar=%b", $time, q, qbar);
    
    // Dump signals to GTKWave
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, tb_counter);
    
    // Run simulation for 200ns
    #200 $finish;
end

endmodule
