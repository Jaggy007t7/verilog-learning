// Implementation of a 4bit asynchronous counter (using jk flip flop) : 

module jk_ff(j,k,clk,q,qbar);
input j,k,clk;
output reg q;
output qbar;
initial begin
    q = 1'b0;
end 

always @(posedge clk) begin
    q <= (j&(~q))|((~k)&q);    // DONT FORGET TO USE <= . USING = IN PLACE OF <= IS COMMON MISTAKE IN PLACE OF 
end
assign qbar = ~q;
endmodule

module counter(j,k,clk,q,qbar);
input [3:0]j,k;
input clk;
output [3:0]q;  // here q cant be a reg data type and it should be a wire because we cannot use reg while instantiation.
output [3:0]qbar;
// now we have to instantiate the individual flip flops;
jk_ff f1(j[0], k[0], clk, q[0],qbar[0]);
jk_ff f2(j[1], k[1],qbar[0] , q[1],qbar[1]);
jk_ff f3(j[2], k[2],qbar[1], q[2],qbar[2]);
jk_ff f4(j[3], k[3],qbar[2], q[3],qbar[3]);

endmodule 

