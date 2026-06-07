module Sequence_detector(in, clk, reset, out);
input in, clk, reset;
output reg out;

parameter s0=0, s1=1, s2=2, s3=3, s4=4;
reg state, next_state;

always @(posedge clk) begin
    if(reset==1'b1)begin
        state = s0;
    end
    else begin
        state = next_state;
    end
end

always @(*) begin
    case(state)
        s0 : begin
            next_state = (in)?s1:s0;
        end

        s1 : begin
            next_state = (in)?s2:s1;
        end

        s2 : begin
            next_state = (in)?s3:s1;
        end

        s3 : begin
            next_state = (in)?s0:s4;
        end

        s4 : begin
            next_state = (in)?s0:s1;
        end

        default : begin
            next_state = s0;
        end
    endcase
end


always @(*) begin
    case(state)
        s0 : begin
            out<=1'b0;
        end

        s1 : begin
            out<=1'b0;
        end

        s2 : begin
            out<=1'b0;
        end

        s3 : begin
            out<=1'b0;
        end

        s4 : begin
            out<=1'b1;
        end
    endcase

end
endmodule 
