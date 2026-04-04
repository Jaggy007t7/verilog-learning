// Generated from chat gpt. Take it refrence to generate testcases;
`timescale 1ns / 1ns

module tb_SISO();

    // Testbench signals
    reg clk;
    reg reset;
    reg d;
    wire [3:0] out;
    wire q;  // Connect to internal q
    
    // Instantiate SISO module
    SISO uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),     // Connect output reg q
        .out(out)
    );
    
    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;
    
    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        d = 0;
        
        // Reset sequence
        #20;
        reset = 0;
        #10;
        
        // Test 1: Shift in pattern 1010
        d = 1; #20;
        d = 0; #20;
        d = 1; #20;
        d = 0; #20;
        d = 0; #20;  // Hold to see full shift
        
        // Test 2: Shift in pattern 1100
        #10;
        d = 1; #20;
        d = 1; #20;
        d = 0; #20;
        d = 0; #20;
        
        // Test 3: Reset during shifting
        d = 1; #10;
        reset = 1; #20;
        reset = 0; #20;
        d = 0; #20;
        
        // Test 4: All 1s pattern
        d = 1; #20;
        d = 1; #20;
        d = 1; #20;
        d = 1; #20;
        
        #50;
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | d=%b | q=%b | out=%b (%b%b%b%b)", 
                 $time, clk, reset, d, q, out, out[3], out[2], out[1], out[0]);
        $dumpfile("SISO.vcd");
        $dumpvars(0, tb_SISO);
    end
    
    // Assertions for verification
    always @(posedge clk) begin
        // Check reset clears all outputs
        if (reset) begin
            if (out !== 4'b0000) 
                $error("Reset failed: out=%b at time %t", out, $time);
        end
    end

endmodule
