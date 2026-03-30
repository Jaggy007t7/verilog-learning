// Code from the output;
module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    reg [3:0]base;
    always @(*) begin 
        if((c>=2'b00) && (c<=2'b11)) begin
            case(c)
                2'b00 : base = b;
                2'b01 : base = e;
                2'b10 : base = a;
                2'b11 : base = d;
                endcase
        end
        else begin 
            base = 4'b1111;
        end 
    end
    assign q = base;
endmodule
