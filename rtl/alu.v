module alu (
    input  [7:0] a,
    input  [7:0] b,
    input  [3:0] alu_control,

    output reg [7:0] result,

    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
);

    reg [8:0] temp;

    always @(*) begin

        result   = 8'b0;
        carry    = 1'b0;
        overflow = 1'b0;
        temp     = 9'b0;

        case (alu_control)

            // ADD
            4'b0000: begin

                temp   = {1'b0, a} + {1'b0, b};
                result = temp[7:0];
                carry  = temp[8];

                overflow =
                    (~(a[7] ^ b[7])) &
                    (result[7] ^ a[7]);

            end

            // SUB
            4'b0001: begin

                result = a - b;

                overflow =
                    (a[7] ^ b[7]) &
                    (result[7] ^ a[7]);

            end

            // AND
            4'b0010: begin
                result = a & b;
            end

            // OR
            4'b0011: begin
                result = a | b;
            end

            // XOR
            4'b0100: begin
                result = a ^ b;
            end

            // INC
            4'b0101: begin

                temp   = {1'b0, a} + 9'd1;
                result = temp[7:0];
                carry  = temp[8];

            end

            // DEC
            4'b0110: begin

                result = a - 8'd1;

            end

            default: begin
                result = 8'b0;
            end

        endcase

        zero     = (result == 8'b0);
        negative = result[7];

    end

endmodule
