module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    reg [3:1]state, next_state;
    reg [3:1]g1;
    parameter a=0,b=1,c=2,d=3;
    
    always@(posedge clk)begin 
        if(resetn==1'b0)begin 
            state<=a;
        end
        else begin 
            state<=next_state;
        end
    end
    
    always@(*)begin 
        case(state)
            a:begin 
                if(r== 3'b100)begin 
                    next_state = d;
                end
                else if(r==3'b000)begin 
                     next_state = state;
                end
                else if(r==3'b001)begin 
                     next_state = b;
                end
                else if(r==3'b010)begin 
                     next_state = c;
                end
            end
            
            b:begin 
                if(r==3'b001)begin 
                    next_state = c;
                end
                else if(r[1]==1'b0)begin 
                     next_state = a;
                end
             
            end
            
            c:begin 
                if(r==3'b010)begin 
                    next_state = state;
                end
                else if(r[2]==1'b0)begin 
                     next_state = a;
                end
            end
            
            d:begin 
                if(r==3'b100)begin 
                    next_state = state;
                end
                else if(r[3]==1'b0)begin 
                     next_state = a;
                end
            end
            default: next_state=a;
        endcase
    end
            
    always@(*)begin 
          case(state)
            a:begin 
                g1 = 3'b000;
            end
            b:begin 
                g1 = 3'b001;
            end
            c:begin 
                g1 = 3'b010;
            end
            d:begin 
                g1 = 3'b100;
            end
        endcase                     
    end
    
    assign g = g1;
endmodule
