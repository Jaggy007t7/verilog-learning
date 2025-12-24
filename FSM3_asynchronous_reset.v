// Not getting correct output;
// fix this :-
module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter a=0, b=1, c=2, d=3;
    reg [1:0]state;
    reg out1;
    reg next_state;
    
	always @(posedge clk or posedge areset) begin 
        if(areset==1'b1)begin 
            state = a;
            out1 = 1'b0;
            
        end
        else begin
            case(state)
                a:begin 
                    state = (in)?b:a;
                    out1 = 1'b0;
                end
                b:begin 
                    state = (in)?b:c;
                    out1 = 1'b0;
                end
                c:begin 
                    state = (in)?d:a;
                    out1 = 1'b0;
                end
                d:begin 
                    state = (in)?b:c;
                    out1 = 1'b1;
                end
				default: begin 
                    state = (in)?b:a;
                    out1 = 1'b0;
                end
            endcase
        end
    end
    assign out = out1;
endmodule
