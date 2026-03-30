// Implementation of the 0-1-2-0 counter for the traffic light 

// Firstly we will make a normal edge triggered j,k flip flop here;
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

// Lets define here a dummy module here;
module counter_dumm(clk);
input clk;
wire [1:0]j;
wire [1:0]k;
wire [1:0]q;
wire [1:0]qbar;
// Here I need not to use the initial block.
assign j[0] = (~q[0])&(~q[1]);
assign k[0] = q[0];
// now i can instantiate the module jk_ff;
jk_ff ff1(j[0],k[0],clk,q[0],qbar[0]);

assign j[1] = (q[0])&(~q[1]);
assign k[1] = q[1];
jk_ff ff2(j[1],k[1],clk,q[1],qbar[1]);

endmodule;


// module counter(j,k,clk,q,qbar);
// input [1:0]j;
// input [1:0]k;
// input clk;
// input reg [1:0]q;
// input [1:0]qbar;
// // Here i will initialise the q as 0 jsut for initial conditions;
// initial begin 
//     q[0] = 1'b0;
//     q[1] = 1'b0;
// end 

// // now we will instantiate the normal j,k flip flop here;

// endmodule
