// Level triggerd S-R Flip Flop Implementation:
// This code is invalid for the one condition in which (s=1,r=1) the output is invlaid.
module sr_flip_flop(s,r,clk,q,qbar);
input s,r,clk;
output q,qbar;
reg q;
always @(clk or s or r) begin // It will change when there is change in the input like the s,r,clk.
    if(clk) 
    q <= s|((~r)&q);
    // q holds its value when the clk is low;
    else 
    q <= q;
end
assign qbar = ~q;
endmodule
