// Level triggered J_K FLIP FLOP IMPLEMENATION ;
module jk_ff(j,k,clk,q,qbar);
input j,k,clk;
output reg q;
output qbar;
initial begin 
    q = 1'b0;
end
always @(clk or j or k) begin
    if (clk)
    q <= (j&(~q))|((~k)&q);

    else // Hold the same value when the clock is zero 
    q <= q;
end
assign qbar = ~q;
endmodule 
