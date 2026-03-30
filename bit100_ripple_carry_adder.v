// New syntax feature  genvar.

module full_adder(a,b,cin,sum,cout);
    input a,b,cin;
    output sum,cout;
    
    assign{cout,sum} = a+b+cin;
    
endmodule 

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    full_adder inst1(a[0],b[0],cin,sum[0],cout[0]);
    generate 
        for(i=1;i<100;i = i+1)begin : fa_chain
            full_adder inst2(a[i],b[i],cout[i-1],sum[i],cout[i]); 
        end
    endgenerate

endmodule
