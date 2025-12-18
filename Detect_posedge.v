// Detect 0->1 transitions on each bit of an 8-bit input.
// pedge goes high for ONE clock after a rising edge.
module top_module (
    input        clk,
    input  [7:0] in,
    output [7:0] pedge
);

    reg [7:0] prev;          // stores input from previous clock

    // Register the current input every clock
    always @(posedge clk) begin
        prev <= in;          // on each clock, remember current 'in'
    end

    // Rising-edge detect, bitwise:
    // current bit is 1 AND previous bit was 0
    assign pedge = in & ~prev;
