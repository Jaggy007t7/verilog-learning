// A Bit of Practice
// Given four unsigned numbers, find the minimum. Unsigned numbers can be compared with standard comparison operators (a < b). 
// Use the conditional operator to make two-way min circuits, then compose a few of them to create a 4-way min circuit. 
// You'll probably want some wire vectors for the intermediate results.

// Code :-

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    
  assign min = (a>b)?((b>c)?((c>d)?d:c):((b>d)?d:b)):((a>c)?((c>d)?d:c):((a>d)?d:a));  // Extreme use of ternary operator

endmodule

