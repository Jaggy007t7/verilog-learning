module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
reg state, next_state;
reg out1, out2, out3;
reg dfr1;

parameter a=0, b=1, c=2,d=3;

always@(posedge clk)begin 
    if(reset == 1'b1)begin 
        state <= a;
    end
    else begin 
        state <= next_state;
    end
end

always @(*)begin 
    case(state)
        a: begin 
            if(s == 3'b000)begin 
                next_state = a;
            end
            else if(s == 3'b001) begin 
                next_state = b;
            end
            
        end

        b: begin 
            if(s == 3'b011)begin 
                next_state = c;
            end
        end

        c: begin 
            if(s == 3'b110)begin 
                next_state = d;
            end
        end

        // d: begin 
        //     if(s == 3'b000)begin 
        //         next_state = a;
        //     end
        //     else if(s == 3'b001) begin 
        //         next_state = b;
        //     end
        // end

        default: begin 
            next_state = a;
        end
    endcase

end 

always @(*)begin 
    case(state)
        a: begin 
            out1 = 1'b1;
            out2 = 1'b1;
            out3 = 1'b1;
            dfr1 = 1'b1;
        end

        b: begin 
            out1 = 1'b1;
            out2 = 1'b1;
            out3 = 1'b1;
            dfr1 = 1'b0;
        end

        c: begin 
            out1 = 1'b1;
            out2 = 1'b1;
            out3 = 1'b0;
            dfr1 = 1'b0;
        end

        d: begin 
            out1 = 1'b1;
            out2 = 1'b0;
            out3 = 1'b0;
            dfr1 = 1'b0;
        end
endcase
end
assign fr1 = out1;
assign fr2 = out2;
assign fr3 = out3;
assign dfr = dfr1;


endmodule
