// Here we will use concatenation of vectors.
module reverse8 (
    input  wire [7:0] in,
    output wire [7:0] out
);
    assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
    // out[7]=in[0], out[6]=in[1], ..., out[0]=in[7]
endmodule
