// Implementation of a 2-bit magnitude multiplier;
module half_adder(x,y,sum,cout);
input x,y;
output sum,cout;
// Relating the inputs with the outputs;
assign sum = x^y;
assign cout = x&y;
endmodule;


module multiplier(
    input [1:0]a,
    input [1:0]b,
    output [3:0]p
);
wire w1,w2,w3;
wire c1,c2;
assign p[0] = a[0]&b[0];
assign w1 = a[1]&b[0];
assign w2 = a[0]&b[1];
//instantiation of the half adder;
half_adder hf_adder1(w1,w2,p[1],c1);
assign w3 = a[1]&b[1];
half_adder hf_adder2(w3,c1,p[2],p[3]);
endmodule
