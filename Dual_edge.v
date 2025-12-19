// With some errors; 80 percent code is working;
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]prev,out2;
    always @(posedge clk)begin 
        prev <= in;
        if(prev < in)begin 
            out2 = (~prev)&in;
        end
        else begin 
            out2 = (prev)&(~in);
        end
    end
    assign anyedge = out2;
endmodule
