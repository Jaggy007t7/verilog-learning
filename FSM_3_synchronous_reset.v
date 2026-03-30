// This format is very important in solving FSM questions;
module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    parameter a=0, b=1, c=2, d=3;
    reg out1;
    reg [1:0]state,next_state;

    always @(posedge clk) begin 
        if(reset==1'b1)begin 
            state <= a;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*)begin 
        case(state)
        a: begin 
            next_state = (in)?b:a;
        end

        b: begin 
            next_state = (in)?b:c;
        end

        c: begin 
            next_state = (in)?d:a;
        end

        d: begin 
            next_state = (in)?b:c;
        end

        default: begin 
            next_state = a;
        end
        endcase
    end

    always @(*)begin 
        case(state)
            a: begin 
            out1 = 1'b0;
        end

        b: begin 
            out1 = 1'b0;
        end

        c: begin 
            out1 = 1'b0;
        end

        d: begin 
            out1 = 1'b1;
        end

        default: begin 
            out1 = 1'b0;
        end
        endcase
    end
assign out = out1;
endmodule
