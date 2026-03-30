module tb_Binary_to_gray;

reg [3:0] I;
wire [3:0] O;
integer i;  // Loop variable declared here

// Instantiate the module
Binary_to_gray uut (
    .I(I),
    .O(O)
);

initial begin
    $dumpfile("binary_to_gray.vcd"); // GTK Wave dump file
    $dumpvars(0, tb_Binary_to_gray);

    // Apply all input combinations
    for (i = 0; i < 16; i = i + 1) begin
        I = i;
        #10; // wait time for signals to propagate
    end

    #10;
    $finish;
end

endmodule
