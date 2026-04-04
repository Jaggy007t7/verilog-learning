// Design of a 4:1 Mux
module mux(I0,I1,I2,I3,S0,S1,Y);

input I0,I1,I2,I3,S0,S1;
output Y;

assign Y = (~S1 & ~S0 & I0)|(~S1 & S0 & I1)|(S1 & ~S0 & I2)|(S1 & S0 & I3);

endmodule
