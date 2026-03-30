module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg [1:0]state, next_state;
    

    parameter a=0, b=1, c=2, d=3;


    always @(posedge clk)begin 
        if(reset == 1'b1)begin 
            state <= a;
        end
        else begin 
            state <= next_state;
        end
    end

    always@(*)begin 
        case(state)
        a:begin 
            if(in[3]== 1'b1)begin 
                next_state = b;
            end
            else begin 
                next_state = a;
            end
        end

        b: begin 

            next_state = c;
        end

        c: begin 
            next_state = d;

        end
        
        d:begin 
            next_state = a;

        end

        default: begin 
            next_state = a;
        end
        endcase
    end

    always@(*)begin 

        case(state)
            a:begin 
                done = 1'b0;
            end

            b:begin 
                done = 1'b0;
            end

            c:begin 
                done = 1'b0;
            end

            d:begin 
                done = 1'b1;

            end
        endcase
    end

endmodule
