module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

parameter a=0, b =1;
reg state, next_state;

// Output :-
reg walk_left1,walk_right1,aaah1;

always @(posedge clk or posedge areset)begin
    if(areset==1'b1)begin
        state = left;
    end
    else begin
        state = next_state;
    end
end

always @(*) begin
    case(state)
        a: begin
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

        b: begin
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

always @(*)begin
        case(state)
            a: begin
                if(groung==1'b0)begin
                    walk_left1 = 1'b0;
                    walk_right1 = 1'b0;
                    aaah1 = 1'b1;
                end
                else begin
                    walk_left1 = 1'b1;
                    walk_right1 = 1'b0;
                    aaah1 = 1'b0;
                end
            end    

            b: begin
                if(groung==1'b0)begin
                    walk_left1 = 1'b0;
                    walk_right1 = 1'b0;
                    aaah1 = 1'b1;
                end
                else begin
                    walk_left1 = 1'b0;
                    walk_right1 = 1'b1;
                    aaah1 = 1'b0;
                end
            end   

        endcase
    end

assign walk_left = walk_left1;
assign walk_right = walk_right1;
assign aaah = aaah1;



endmodule
