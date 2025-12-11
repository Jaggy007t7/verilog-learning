`timescale 1ns/1ns

module tb_traffic_light();
    reg clk;
    wire [2:0] d;

    // Instantiate traffic_light module
    traffic_light uut(
        .clk(clk),
        .d(d)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("traffic_light_tb.vcd");
        $dumpvars(0, tb_traffic_light);
        #100 $finish;  // Run simulation for 100 ns
    end

    // Monitor traffic light states on console
    initial begin
        $display("Time\tGreen\tYellow\tRed");
        $monitor("%0dns\t%b\t%b\t%b", $time, d[0], d[1], d[2]);
    end
endmodule
