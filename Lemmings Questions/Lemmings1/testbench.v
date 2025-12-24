module testbench;
reg clk,areset,bump_left,bump_right;
wire walk_left, walk_right;

top_module inst(clk,areset,bump_left,bump_right,walk_left, walk_right);

initial begin 
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    #150 $finish;
end

initial begin 
    #0 areset = 1'b1;bump_left=1'b1; bump_right=1'b1;
    #15 areset=1'b0;
    #35 areset=1'b1; 
    #15 areset=1'b0;
    #30 bump_left=1'b0;
    #20 bump_left=1'b1; bump_right=1'b0;

end
endmodule
