// 3-stage [pipelined system]
`timescale 1ns/1ps
module pipelining_example #(
    parameter n=10 // No.of bits.
)(
    input [n-1:0]a,b,c,d,
    input clk,
    output [n-1:0]f
);

// latches:-
reg [n-1:0]l0,l1,l2,l3,l4,l5;
always @(posedge clk)begin 
    // Stage1:-
    #4 l0 = a+b;
    #4 l1 = c-d;
    l2 = d;

    // Stage2:-
    #4 l3 = l0+l1;
    l4 = d;

    // stage3:-
    #6 l5 = l3*l4;
end

assign f = l5;

endmodule
