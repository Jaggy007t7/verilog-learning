// Edge triggered J-K flip flop;

module jk_ff(j,k,clk,q,qbar);
input j,k,clk;
output reg q;
output qbar;
initial q = 1'b0;
always @(posedge clk) begin
    q = (j&(~q))|((~k)&q);
end
assign qbar = ~q;

endmodule
