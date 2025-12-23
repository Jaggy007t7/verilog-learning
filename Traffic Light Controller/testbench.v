module testbench;
reg clk;
wire [2:0]light;

design m1(clk,light);

initial begin 
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    #100 $finish;
end

endmodule 
