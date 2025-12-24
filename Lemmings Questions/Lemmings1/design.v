module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter a=0,b=1;
    reg state;
    reg next_state;
    reg walk_left1, walk_right1;
    always @(posedge clk or posedge areset) begin 
        if(areset==1'b1)begin 
            state = a;
        end
        else begin 
            state = next_state;
        end
    end

    always @(*) begin 
        case(state)
        a:begin 
            if((bump_left==1'b0)&&(bump_right==1'b0))begin 
                next_state = a;
            end
            else if((bump_left==1'b0)&&(bump_right==1'b1))begin 
                next_state = a;
            end
            else if((bump_left==1'b1)&&(bump_right==1'b0))begin 
                next_state = b;
            end
            else begin 
                next_state = b;
            end
        end

        b:begin 
            if((bump_left==1'b0)&&(bump_right==1'b0))begin 
                next_state = b;
            end
            else if((bump_left==1'b0)&&(bump_right==1'b1))begin 
                next_state = a;
            end
            else if((bump_left==1'b1)&&(bump_right==1'b0))begin 
                next_state = b;
            end
            else begin 
                next_state = a;
            end
        end
        endcase
    end

    always @(*) begin 
        case(state)
            a: begin 
                walk_left1 = 1'b1;
                walk_right1 = 1'b0;
            end

            b:begin
                walk_left1 = 1'b0;
                walk_right1 = 1'b1;
            end
        endcase
    end

assign walk_left = walk_left1;
assign walk_right = walk_right1;

endmodule
