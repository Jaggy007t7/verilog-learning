module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    reg [3:0]out;
    always @(posedge clk) begin 
        if(reset==1'b1)begin 
            out = 4'b0;
        end
        else begin 
            if(out == 4'b1001)begin 
                if(slowena == 1'b0)begin 
                    out = out;
                end
                else begin
                    out = 4'b0;
                end
            end
            else begin 
                if(slowena == 1'b0) begin 
                    out = out;
                end
                else begin 
                    out = out+1;
                end
            end
        end
    end
    
    assign q = out;
endmodule
