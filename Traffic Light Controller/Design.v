// Traffic light controller implementaion using decoder and the j,k flip flop;

module jk_ff(j,k,clk,q,qbar);
input j,k,clk;
output reg q;
output qbar;
initial begin 
    q = 1'b0;
end

always @(posedge clk) begin
    q <= (j&(~q))|((~k)&q);
end
assign qbar = ~q;
endmodule

module decoder(b,d);
input [1:0]b;
output [2:0]d;

assign d[0] = ~b[0] & ~b[1]; // Green Light. 
assign d[1] = b[0] & ~b[1]; // Yellow light.
assign d[2] = ~b[0] & b[1]; // Red Light.

endmodule

module traffic_light(clk,d);// Here port declaration must be done properly to get correct output 
input clk;
output [2:0]d;
wire [1:0]j;
wire [1:0]k;
wire [1:0]q;
wire [1:0]qbar;
wire [1:0]b;

// now i can instantiate the module jk_ff;
assign j[0] = (~q[0])&(~q[1]);
assign k[0] = q[0];
jk_ff ff1(j[0],k[0],clk,q[0],qbar[0]);

assign j[1] = (q[0])&(~q[1]);
assign k[1] = q[1];
jk_ff ff2(j[1],k[1],clk,q[1],qbar[1]);

// Now connecting the counter with the decoder to operate the green,yellow,red leds;
assign b[1] = q[1];
assign b[0] = q[0];
//Now i will instantiate the decoder here;
decoder dec1(b,d);
endmodule
