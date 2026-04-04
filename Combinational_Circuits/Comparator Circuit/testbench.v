`timescale 1ns/1ns
module comparator_tb;

    reg a2, a1, a0, b2, b1, b0;
    wire g, v, c;

    // Instantiate comparator
    comparator uut(a2, a1, a0, b2, b1, b0, g, v, c);

    initial begin
        $display("A  B  | A>B A<B A=B");
        $display("------------------");

        // Apply test values
        a2=0; a1=0; a0=0;  b2=0; b1=0; b0=0; #10;
        $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

        a2=1; a1=0; a0=1;  b2=0; b1=1; b0=1; #10;
        $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

        a2=0; a1=1; a0=1;  b2=0; b1=1; b0=1; #10;
        $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

        a2=1; a1=1; a0=1;  b2=1; b1=0; b0=0; #10;
        $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

        $stop;
    end
    initial begin
    $dumpfile("dump.vcd");   // VCD output file
    $dumpvars(0, comparator_tb); // dump all variables in testbench

    $display("A  B  | A>B A<B A=B");
    $display("------------------");

    // Apply test values
    a2=0; a1=0; a0=0;  b2=0; b1=0; b0=0; #10;
    $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

    a2=1; a1=0; a0=1;  b2=0; b1=1; b0=1; #10;
    $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

    a2=0; a1=1; a0=1;  b2=0; b1=1; b0=1; #10;
    $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

    a2=1; a1=1; a0=1;  b2=1; b1=0; b0=0; #10;
    $display("%b%b%b %b%b%b |  %b   %b   %b", a2,a1,a0, b2,b1,b0, g,v,c);

    $stop;
end

endmodule
