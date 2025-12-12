module sr_latch(s,r,q,qbar);

// Port Declarations;
input s,r;
output q,qbar;

// Lower Level module Instantaions;
nand N1(q,s,qbar);
nand N2(qbar,r,q);

endmodule
