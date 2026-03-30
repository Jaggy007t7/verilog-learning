module design(clk,light);

// Port and Intermediate wires declaration;
input clk;
output reg [2:0]light;
reg [1:0]state;
parameter s0=0, s1=1, s2=2;
parameter green = 3'b100, yellow=3'b010, red= 3'b001;
initial begin 
    state = 3'b0;
end
always @(posedge clk)begin 
    case(state)
        s0:begin 
            light <= green; state <= s1;
        end

        s1:begin 
            light <= yellow; state <= s2;
        end

        s2:begin 
            light <= red; state <= s0;
        end

        default: begin
            light <= green; state <= s0;
        end 

    endcase

end

endmodule 
