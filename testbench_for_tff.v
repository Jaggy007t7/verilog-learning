module top_module ();
    reg clk, reset,t;
    wire q;
    
    tff inst1(clk,reset,t,q);
    
    // clock generation: 10 time‑unit period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // stimulus
    initial begin
        // start with reset asserted (synchronous, active‑high)
        reset = 1'b1;
        t     = 1'b0;

        // hold reset for one rising edge so q -> 0
        @(posedge clk);          // first edge with reset=1, q is reset to 0 [web:10]

        // deassert reset, prepare to toggle
        reset = 1'b0;

        // set t=1 so flip‑flop toggles on next clock edge
        t = 1'b1;
        @(posedge clk);          // q toggles from 0 to 1 here [web:3][web:10]

        // optionally stop simulation
        #5 $finish;
    end

endmodule
