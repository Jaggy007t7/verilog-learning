module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    reg [3:0]out;
    always @(posedge clk) begin 
        if(a == 1'b1) begin 
           out = 4'b0100; 
        end
        else begin 
            if(out<4'b0110) begin 
                out = out+1;
            end
            else if(out == 4'b0110) begin
               out = 1'b0; 
            end
        end
    end
assign q = out;
endmodule
