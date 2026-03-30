module testbench;
reg clk,in;
wire out;

parity_detector uut(clk,in,out);

initial begin
    clk=1'b1;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
end

initial begin
    #2 in=0; #10 in=1; #10 in=1; #10 in =1;
    #10 in=0; #10 in=1; #10 in=1; #10 in =0;
    #10 in=0; #10 in=1; #10 in=1; #10 in =0;
    #10 $finish;
end

endmodule
