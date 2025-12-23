module parity_detector(in,clk,out);
input in, clk;
output reg out;

reg state, next_state;

parameter even=0, odd=1;
parameter s0=0, s1=1;

always @(posedge clk) begin 
    case(state)
        s0 : begin 
            out <= (1'b0)^in;
            state <= out;
        end
        s1 : begin
            out <= (1'b0)^in;
            state <= out;
        end

        default : begin 
                out <= in;
                state <= out;
        end
    endcase
end
endmodule
