module testbench;
reg in, clk, reset;
wire out;

Sequence_detector uut(in, clk, reset, out);

initial begin
clk=1'b1;
forever #5 clk = ~clk;
end

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin
    #12 in=0; #10 in=0; #10 in=1; #10 in=1;
    #12 in=0; #10 in=1; #10 in=1; #10 in=0;
    #12 in=0; #10 in=1; #10 in=1; #10 in=0;
    #10 $finish;

end
endmodule 
