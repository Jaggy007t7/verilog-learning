module d_ff(clk,reset,d,q);
input clk,d,reset;
output reg q;

always @(posedge clk) begin  // With Synchronous reset;
    if(reset==1'b1)begin 
        q<=1'b0;
    end
    else begin 
        q<=d;
    end
end

endmodule 

module SISO(clk, reset, d, q, out);
input clk, reset, d;
output q;
output [3:0]out;
wire [3:0]w;

// Instantiation of modules;
d_ff m1(clk,reset,d,w[0]);
d_ff m2(clk,reset,w[0],w[1]);
d_ff m3(clk,reset,w[1],w[2]);
d_ff m4(clk,reset,w[2],q);

assign out = {w,q};


endmodule
