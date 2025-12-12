// Edge triggered SR-Flip_Flop :
// Invalid for the stat in which the input is (s=1,r=1) and output is invalid for this;
module sr_flip_flop(s,r,clk,q,qbar);
input wire s,r,clk;
output reg q;
output qbar;
initial begin
    q = 1'b0;
end
always @(posedge clk) begin
    q <= s|((~r)&q);
    // No need to do like this because it will work only for the positive edge 
    // if(clk)
    // q <= s|((~r)&q);
    // else
    // q <= q;
end

assign qbar = ~q;
endmodule
