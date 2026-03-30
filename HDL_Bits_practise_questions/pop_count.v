// Question - A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 3-bit input vector.
module top_module( 
    input [2:0] in,
    output [1:0] out );
    reg [1:0]count;
    integer i =0;
    always @(*) begin 
        count = 2'b00;
        for(i=0;i<3;i = i+1) begin 
            if(in[i] == 1'b1)begin
                count = count+1;
            end 
        end 

    end
    assign out = count; 
endmodule
