module parity_detector(clk,in,out);
input clk, in;
output reg out;

parameter even=0, odd=1;
reg state, next_state;

always @(posedge clk) begin
    state = next_state;
end

always @(*) begin
    case(state)
        even: begin
            next_state = (in)?odd:even;
        end

        odd: begin
            next_state = (in)?even:odd;
        end
        default: begin
           next_state = even; 
        end
    endcase
end

always @(*) begin
    case(state)
        even: begin
            out = 1'b0;
        end

        odd: begin
            out = 1'b1;
        end

        default: begin
            out = 1'b0;
        end
    endcase
end


endmodule
