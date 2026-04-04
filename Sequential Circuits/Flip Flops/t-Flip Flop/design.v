// This is a positive edge triggerd d flip flop;
module d_flip_flop (
    input wire clk,
    input wire d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;
    end
endmodule


// This is a positive edge triggered t flip flop implement using a d_flip_flop;
module t_flip_flop(q,clk, reset);
output q;
input clk, reset;
wire d;
d_flip_flop dff1(q,d,clk);
not n1 (d,q);
endmodule 
