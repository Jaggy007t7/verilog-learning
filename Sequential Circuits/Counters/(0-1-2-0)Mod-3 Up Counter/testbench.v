`timescale 1ns/1ns

module tb_counter_dumm();
    reg clk;

    // Clock generator: 10ns period, toggles every 5ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Instantiate your counter module
    counter_dumm uut (
        .clk(clk)
    );

    // VCD dump for GTKWave
    initial begin
        $dumpfile("counter_dumm_tb.vcd");
        $dumpvars(0, tb_counter_dumm);        // Dumps everything in the testbench
        $dumpvars(1, uut.q);                  // Dumps signal q[1:0] from counter_dumm
        $dumpvars(1, uut.qbar);               // Dumps signal qbar[1:0] from counter_dumm
        #100 $finish;
    end

    // Monitor outputs directly by hierarchical reference
    initial begin
        $display("Time\tq[1]\tq[0]\tqbar[1]\tqbar[0]");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, uut.q[1], uut.q[0], uut.qbar[1], uut.qbar[0]);
    end

endmodule
