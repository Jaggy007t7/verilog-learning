// Implementation of Binary to Gray Code Converter using logic gates;

module Binary_to_gray(I,O);
input [3:0]I; //Defined input pins.
output [3:0]O;  //Defined Output pins.

// Assigned the relation between the input and output values;
assign O[3] = I[3];
assign O[2] = I[3]^I[2];
assign O[1] = I[1]^I[2];
assign O[0] = I[1]^I[0];

endmodule
