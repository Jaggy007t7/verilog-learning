// Questions - Build a 4-digit BCD (binary-coded decimal) counter. 
// Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc. 
//For digits [3:1], also output an enable signal indicating when each of the upper three digits should be incremented.
//You may want to instantiate or modify some one-digit decade counters.


module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    reg [15:0]q1;
    assign ena[1] = (q[3:0]==4'd9);
    assign ena[2] = (q[7:4]==4'd9) && (ena[1]);
    assign ena[3] = (q[11:8]==4'd9) && (ena[2]);
    
    always @(posedge clk) begin 
        if(reset == 1'b1)begin 
            q1 = 16'b0;
        end
        else begin
            
            // ones digit :-
            if(q1[3:0]==4'd9) begin 
                q1[3:0]=4'd0;
            end
            else begin 
                q1[3:0]=q1[3:0]+1;   
            end
            
            // Tens Digit;
            if(ena[1] == 1'b1)begin 
                if(q1[7:4] == 4'd9)begin 
                    q1[7:4] = 4'd0;
                end
                else begin 
                    q1[7:4]=q1[7:4]+1; 
                end
            end
            
            // Hunderedth digit;
            if(ena[2] == 1'b1)begin 
                if(q1[11:8] == 4'd9)begin 
                    q1[11:8] = 4'd0;
                end
                else begin 
                    q1[11:8]=q1[11:8]+1; 
                end
            end
            
            
            
            // Thousand digit;
            if(ena[3] == 1'b1)begin 
                if(q1[15:12] == 4'd9)begin 
                    q1[15:12] = 4'd0;
                end
                else begin 
                    q1[15:12]=q1[15:12]+1; 
                end
            end
          
        end
    end
    assign q = q1;
endmodule
