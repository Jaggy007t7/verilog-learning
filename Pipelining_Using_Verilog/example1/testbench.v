`timescale 1ns/1ps
module testbench;

parameter n = 10;
reg [n-1:0]a,b,c,d;
reg clk;
wire [n-1:0]f;

pipelining_example mypipe(a,b,c,d,clk,f);

initial begin
    clk = 1'b0;
    forever begin
        #10 clk = ~clk;
    end
end

initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin 
    #5 a=10; b=12; c=6; d=3;
    #20 a=11; b=12; c=6; d=3;
    #20 a=9; b=12; c=6; d=3;
    #20 a=13; b=12; c=6; d=3;
    #20 a=10; b=12; c=6; d=3;
    #20 a=69; b=12; c=6; d=3;
    #20 a=10; b=12; c=6; d=3;
    #20 $finish;

end

endmodule
