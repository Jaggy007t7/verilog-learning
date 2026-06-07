// Implementation of a 4-bit Arithmetic Logic Unit;

module adder(x,y,cin,cout,sum);
input x,y,cin;
output cout,sum;
assign sum = x^y^cin;
assign cout = (x&y)|(y&cin)|(x&cin);
endmodule

module subtractor(x,y,Bin,Bout,diff);
input x,y,Bin;
output Bout,diff;
assign diff = x^y^Bin;
assign Bout = ((y&(~x))|((x~^y)&Bin));
endmodule

module four_bit_adder(
    input [3:0]x,
    input [3:0]y,
    output [3:0]cout,
    output [3:0]sum
);

wire [3:0]cin;
assign cin[0] = 1'b0;
adder add1(x[0],y[0],cin[0],cout[0],sum[0]);
assign cin[1] = cout[0];
adder add2(x[1],y[1],cin[1],cout[1],sum[1]);
assign cin[2] = cout[1];
adder add3(x[2],y[2],cin[2],cout[2],sum[2]);
assign cin[3] = cout[2];
adder add4(x[3],y[3],cin[3],cout[3],sum[3]);
endmodule

module four_bit_subtractor(
    input [3:0]x,
    input [3:0]y,
    output [3:0]Bout,
    output [3:0]diff
);
wire [3:0]Bin;
assign Bin[0] = 1'b0;
subtractor sub1(x[0],y[0],Bin[0],Bout[0],diff[0]);
assign Bin[1] = Bout[0];
subtractor sub2(x[1],y[1],Bin[1],Bout[1],diff[1]);
assign Bin[2] = Bout[1];
subtractor sub3(x[2],y[2],Bin[2],Bout[2],diff[2]);
assign Bin[3] = Bout[2];
subtractor sub4(x[3],y[3],Bin[3],Bout[3],diff[3]);
endmodule

// module basic_operations(
//     input [3:0]a,
//     input [3:0]b,
//     output [3:0]result
// )
// assign result[0] = a&b;
// assign result[1] = a|b;
// assign result[2] = ~b;
// assign result[3] = ~b;
// endmodule

module fourbit_alu(
    input [3:0]a,
    input [3:0]b,
    input [2:0]sel,   // This is the select input which will determine the function that need to be performed based on the input
    output reg [4:0]out
);
// Here define all the wires that are required;
wire [3:0]cin;
wire [3:0]cout;
wire [3:0]sum;
wire [3:0]Bin;
wire [3:0]Bout;
wire [3:0]diff;
// wire [3:0]result;


// Now perform all the operations that need to be done;
// ADDITION:
four_bit_adder adder1(a,b,cout,sum);
//Subtraction;
four_bit_subtractor subtractor1(a,b,Bout,diff);
// Instantiate the basic operations;
// basic_operations op1(a,b,result);

always @(*) begin 
    case(sel)
    3'b000 : out = 5'b00000;
    3'b001 : out = {cout[3],sum};
    3'b010 : out = {Bout[3],diff};
    3'b011 : out = {1'b0,a&b};
    3'b100 : out = {1'b0,a|b};
    3'b101 : out = {1'b0,~a};
    3'b110 : out = {1'b0,~b};
    3'b111 : out = {1'b0,a^b};   // This is a bitwise xor;
    endcase
end
endmodule



