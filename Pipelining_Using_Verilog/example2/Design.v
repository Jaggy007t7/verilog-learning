// Non synthesizable version:-
`timescale 1ns/1ps

module alu #(
    parameter size=16  // Bits;
)(
    input wire clk1, clk2,       // -> To avoid race around condition.
    input wire write
    input wire [3:0]rs1,rs2,rd,
    input [2:0]func,             // -> Op-code.
    input wire [7:0]addr,       //  -> Addr. for main memory.
    output wire [size-1:0]Zout
);

// Register bank;
reg [size-1:0]register_bank[0:size-1];

// Memory;
reg [size-1:0]mem[0:255];

// latches;
reg [size-1:0]l1_a,l1_b,l1_rd,l1_func,l1_addr;
reg [size-1:0]l2_z,l2_rd,l2_addr;
reg [size-1:0]l3_z,l3_addr;
reg [size-1:0]l4_z;

always @(posedge clk1)begin 
    #2 l1_a<=register_bank[rs1];
    #2 l1_b<=register_bank[rs2];
    #2 l1_rd<=func;
    #2 l1_adder<=addr;
end

always @(negedge clk2)begin 
    case(func)
        1: l2_z=l1_a+l1_b;
        2: l2_z=l1_a-l1_b;
        3: l2_z=l1_a*l1_b;
        4: l2_z=l1_a;
        5: l2_z=l1_b;
        6: l2_z=l1_a^l1_b;
        7: l2_z=l1_a|l1_b;
        8: l2_z=l1_a&l1_b;
        default: func=1;

    endcase
    #2 l2_rd <= l1_rd;
    #2 l2_addr <= l1_addr;

end

always@(posedge clk1)begin 
    #2 register_bank[l2_rd]<=l2_z;
    #2 l3_z<=l2_z;
    l3_add<=l2_addr;


end

always @(negedge clk2)begin 
    #2 mem[l3_addr]<=l3_z;
end

assign Zout = l3_z;

endmodule
