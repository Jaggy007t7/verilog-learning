// It is a decade counter;
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
reg [3:0]out;
initial begin 
    out = 4'b0;
end
always @(posedge clk)begin 
    if(reset == 1'b0)begin 
        if(out == 4'b1001)begin
            out = 4'b0;
        end 
        else begin 
            out = out+1;
        end
    end 
    else if(slowena == 1'b1)begin   // this is workig properly
        if(reset == 1'b0)begin 
            out = out;
        end
        else begin 
           out = 4'b0; 
        end
    end
    else begin 
        out = 4'b0;
    end
end
assign q = out;
endmodule
