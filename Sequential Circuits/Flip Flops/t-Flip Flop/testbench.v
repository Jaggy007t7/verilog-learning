module t_flip_flop;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the T flip-flop
    t_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation: 10 time units period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize reset
        reset = 1;
        #12;            // Hold reset high for some time
        reset = 0;

        // Allow T flip-flop to toggle for several clock cycles
        #100;

        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("At time %t : clk = %b, reset = %b, q = %b", $time, clk, reset, q);
    end

endmodule
