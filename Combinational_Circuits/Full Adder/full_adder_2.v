// Implementation of the full adder using two half adder and one or gate ; 

module half_adder(x,y,sum,carry);
input x,y;
output sum,carry;
assign sum = x^y;
assign carry = x&y;
endmodule

module full_adder(x,y,cin,sum,cout);
input x,y,cin;
output sum,cout;
wire w1,w2,w3;
half_adder hf1(x,y,w1,w2);
half_adder hf2(w1,cin,sum,w3);

assign cout = w2|w3;

endmodule
