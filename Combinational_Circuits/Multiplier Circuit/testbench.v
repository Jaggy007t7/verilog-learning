`timescale 1ns/1ns

module tb_multiplier();
    reg [1:0] a, b;
    wire [3:0] p;

    // Instantiate multiplier
    multiplier uut (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        $dumpfile("multiplier_tb.vcd");
        $dumpvars(0, tb_multiplier);
        
        $display("Time\t a  b  Product");
        $monitor("%0dns\t%b %b %b", $time, a, b, p);

        // Test vectors
        a = 0; b = 0; #10;
        a = 1; b = 1; #10;
        a = 2; b = 2; #10;
        a = 3; b = 3; #10;
        a = 3; b = 1; #10;
        a = 2; b = 3; #10;

        $finish;
    end
endmodule
