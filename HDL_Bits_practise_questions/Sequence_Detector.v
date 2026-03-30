module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
reg [1:0]state, next_state;
parameter a=0, b=1, c=2;

    always @(posedge clk or negedge aresetn) begin
    if(aresetn==1'b0)begin 
        state = a;
    end
    else begin 
        state = next_state;
    end
end

always @(*) begin
    case(state)
        a:begin 
            next_state = (x)?b:a;
            z = (x)?0:0;
        end
        
        b:begin 
            next_state = (x)?b:c;
            z = (x)?0:0;
        end

        c:begin 
            next_state = (x)?b:a;
            z = (x)?1:0;
        end

        default: next_state = a;

    endcase
end


endmodule 
