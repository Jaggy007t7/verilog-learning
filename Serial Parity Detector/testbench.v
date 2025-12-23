module testbench;
reg clk,in;
wire out;

parity_detector inst(in,clk,out);

initial begin 
clk = 1'b0;
forever #5 clk = ~clk;
end

initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    #100 $finish;
end
initial begin 
    #0 in = 1'b0;
    #4 in = 1'b1;
    #6 in = 1'b1;
    #10 in = 1'b0;
    #11 in = 1'b1;
    #4 in = 1'b1;
    #4 in = 1'b0;
    #4 in = 1'b1;
    #4 in = 1'b1;
end
endmodule 
