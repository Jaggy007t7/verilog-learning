
module SISO(clk, reset, d, q, out);
input clk, reset, d;
output q;
output [3:0]out;
reg a,b,c,d1;

always @(posedge clk)begin 
    if(reset==1'b1)begin 
        a=0; b=0; c=0; d1=0;
    end 
    else begin 
        d1<=d;
        c<=d1;
        b<=c;
        a<=b;
    end
end

assign q = a;
assign out = {d1,c,b,a};
endmodule
