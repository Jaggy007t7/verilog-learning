// Ripple up counter using a D-Flip_flop -> T-Filp_flop -> intergrating to get the a Ripple Up counter

module D_ff(d,clk,reset,q);
input d,clk,reset;
output reg q;

always @(posedge reset or negedge clk)
if(reset)
    q<=1'b0;
else
    q<=d;
endmodule

module T_ff(q,clk,reset);
output q;
input clk,reset;
wire d;

D_ff dff0(d,clk,reset,q);
not n1(d,q);
endmodule

module ripple_up_counter(q,clk,reset);
input clk,reset;
output [3:0]q;

T_ff tff0(q[0],clk,reset);
T_ff tff1(q[1],q[0],reset);
T_ff tff2(q[2],q[1],reset);
T_ff tff3(q[3],q[2],reset);
endmodule
