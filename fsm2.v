// My Code :-
module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter on = 1;
    parameter off = 0;
    reg present_state, next_state;
    reg out1;
    always @(posedge clk or posedge areset)begin 
        if(areset==1'b1)begin 
            out1 = off;
        end
        else begin 
            if((out1==off)&&(j==1'b1))begin 
                out1 = ~out1;
                
            end
            else if((out1==on)&&(k==1'b1)) begin 
                out1 = ~out1;
            end
            else if((out1==on)&&(k==1'b0))begin 
               out1 = out1;
            end
            else if((out1== off)&&(j==1'b0)) begin 
                out1 = out1;
                
            end
        end
    end
    assign out = out1;
endmodule 


// Code with proper industry level format :-
module top_module (
	input clk,
	input j,
	input k,
	input areset,
	output out
);
	parameter A=0, B=1;
	reg state;
	reg next;
    
    always_comb begin
		case (state)
			A: next = j ? B : A;
			B: next = k ? A : B;
		endcase
    end
    
    always @(posedge clk, posedge areset) begin
		if (areset) state <= A;
        else state <= next;
	end
		
	assign out = (state==B);

	
endmodule




