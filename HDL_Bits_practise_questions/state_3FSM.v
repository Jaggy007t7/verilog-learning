// COde from Chat gpt. Mine was deleted by mistake.
module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out);

    // State encoding
    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10,
              D = 2'b11;

    reg [1:0] next_state_r;

    always @(*) begin
        case (state)
            A: next_state_r = (in ? B : A);  // A->A (0), A->B (1)
            B: next_state_r = (in ? B : C);  // B->C (0), B->B (1)
            C: next_state_r = (in ? D : A);  // C->A (0), C->D (1)
            D: next_state_r = (in ? B : C);  // D->C (0), D->B (1)
            default: next_state_r = A;
        endcase
    end

    assign next_state = next_state_r;

    // Moore output depends only on current state: only D has output 1
    assign out = (state == D);

endmodule
