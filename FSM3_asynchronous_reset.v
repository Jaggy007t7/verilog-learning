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

// Refrence from chat gpt :-
Code :-
module fsm_async_reset (
    input clk,
    input reset,
    output reg out
);

parameter S0=2'b00, S1=2'b01, S2=2'b10;

reg [1:0] state, next_state;

// State register with async reset
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

// Next-state logic
always @(*) begin
    case (state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S0;
        default: next_state = S0;
    endcase
end

// Output logic
always @(*) begin
    case (state)
        S0: out = 1'b0;
        S1: out = 1'b1;
        S2: out = 1'b0;
        default: out = 1'b0;
    endcase
end

endmodule

// My corrected Code:-
// Not getting correct output;
// fix this :-
module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter a=0, b=1, c=2, d=3;
    reg [1:0]next_state,state;
    reg out1;

    always @(posedge clk or posedge areset)begin 
        if(areset==1'b1)begin 
            state = a;
        end
        else begin 
            state = next_state;
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
            a:begin 
                out1 = 1'b0;
            end
            b:begin 
                out1 = 1'b0;
            end
            c:begin 
                out1 = 1'b0;
            end
            d:begin 
                out1 = 1'b1;
            end
            default: begin 
                out1 = 1'b0;
            end
        endcase
    end
    assign out = out1;
endmodule
