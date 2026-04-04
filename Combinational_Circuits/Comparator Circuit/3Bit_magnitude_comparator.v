module comparator(a1,a0,a2,b2,b1,b0,g,v,c);
/* g is for A>B
   v is for A<B
   c is for A=B */

   input a1,a0,a2,b2,b1,b0;
   output g,v,c;

    // For A > B
    assign g = (a2 & ~b2) | 
               ((a2 ~^ b2) & a1 & ~b1) | 
               ((a2 ~^ b2) & (a1 ~^ b1) & a0 & ~b0);

    // For A < B
    assign v = (b2 & ~a2) | 
               ((a2 ~^ b2) & b1 & ~a1) | 
               ((a2 ~^ b2) & (a1 ~^ b1) & b0 & ~a0);

    // For A == B
    assign c = (a2 ~^ b2) & (a1 ~^ b1) & (a0 ~^ b0);

endmodule


/*  

^~ is XOR followed by NOT → not correct for equality.

For equality, use ~^ or equivalently ^~ correctly:

a ~^ b = equality check (XNOR)

a ^ b = inequality (XOR)

But you mixed them in a way that doesn’t evaluate the intended logic.

*/
