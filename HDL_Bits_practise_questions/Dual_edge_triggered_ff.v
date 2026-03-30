module d_ff1(clk,d,q);
    input clk,d;
    output q;
    reg out;
    always @(posedge clk) begin 
        out<=d;
    end
    assign q = out;
endmodule

module d_ff2(clk,d,q);
    input clk,d;
    output q;
    reg out;
    always @(negedge clk) begin 
        out<=d;
    end
    assign q = out;
endmodule
module top_module (
    input clk,
    input d,
    output q
);
reg q1,q2;
    d_ff1 inst1(clk,d,q1);
    d_ff2 inst2(clk,d,q2);
    
    assign q = (clk == 1'b0)?q2:q1;
endmodule
