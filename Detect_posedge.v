module top_module (
input clk,
input [7:0] in,
output [7:0] pedge
);
reg [7:0]prev;
reg [7:0]out;
always @(posedge clk) begin
prev <= in;
out <= in&(~prev);
end
assign pedge = out;
endmodule
