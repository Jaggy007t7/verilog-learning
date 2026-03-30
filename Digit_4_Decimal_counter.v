// Build a 4-digit BCD (binary-coded decimal) counter. Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, 
//q[7:4] is the tens digit, etc. For digits [3:1], also output an enable signal indicating when each of the upper three digits should be incremented.
// You may want to instantiate or modify some one-digit decade counters.

module Decade_counter(clk,reset,enable,q);
    input clk,reset;
    output reg enable;
    output reg [3:0]q;
    always @(posedge clk) begin 
            if(reset == 1'b1)begin 
                q = 4'b0;
                enable = 1'b0;
            end
            else begin 
                if(q == 4'b1001)begin 
                    q = 4'b0;
                end
                else begin 
                    q = q+1;
                    enable = 1'b1;
                end
            end
    end 
endmodule 
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    reg [3:0]out1,out2,out3,out4;
    reg [3:1]enable;
    
    // Instantiation of modules;
    always @(posedge clk)begin 
        if(out1<4'b1001)begin 
            Decade_counter a1(clk,reset,1'b0,out1);
        end
        else if(out)begin 
            
        end
        else if()begin 
            
        end
        else if()begin 
            
        end
        
    end
        
    Decade_counter a1(clk,reset,1'b0,out1);
    Decade_counter a2(clk,reset,enable[1],out2);
    Decade_counter a3(clk,reset,enable[2],out3);
    Decade_counter a4(clk,reset,enable[3],out4);
    
    assign q = {out4,out3,out2,out1};
    assign ena = enable;
endmodule
