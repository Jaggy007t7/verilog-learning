// Implementation of the gray to binary code converter:

module gray_to_bin(I,O);
input [3:0]I;
output [3:0]O;

assign O[3] = I[3];
assign O[2] = I[3]^I[2];
assign O[1] = I[3]^I[2]^I[1];
assign O[0] = I[3]^I[2]^I[1]^I[0];

endmodule
