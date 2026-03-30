module testbench;
  reg clk;
  clock inst1(clk);
  initial begin 
    $dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
    $monitor($time,"nanoseconds"," clk = %b",clk);
    #100 $finish;
  end 

  initial begin 
    #0 clk = 1'b0;
    forever clk = ~clk;
  end
endmodule
