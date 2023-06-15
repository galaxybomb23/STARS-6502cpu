
module ALU_6502(
    input  logic [7:0] A,      // Input A
    input  logic [7:0] B,      // Input B
    input  logic [2:0] OP,    // Operation {ADD, SUB, AND, OR, XOR, SHL, SHR}
    output logic  [7:0] Y,      // Output Y
    output logic  C,            // Carry
    output logic  Z,            // Zero
    output logic  N,            // Negative
    output logic  V             // Overflow

);

// OP codes
parameter  ADD =  0;
parameter SUB =  1;
parameter AND =  2;
parameter OR  =  3;
parameter XOR =  4;
parameter SHL =  5;
parameter SHR =  6;

//inter vars
logic [7:0] y;


// Output
always_comb begin : ALU_6502
    C = 0; // Carry false
    Z = 0; // Zero false
    N = 0; // Negative false
    V = 0; // Overflow false

    case(OP)
        ADD:begin 
            y = A + B ; 
            C = Y < A | Y < B;
            V = (A[7] == B[7]) && (A[7] != y[7]); // 1 if MSB of A and B are equal and MSB of Y is different
        end
        SUB: begin
            y = A - B;
            C = A < B;
            V = (A[7] != B[7]) && (A[7] != y[7]); // 1 if MSB of A and B are different and MSB of Y is different
        end
        AND: y = A & B;
        OR:  y = A | B;
        XOR: y = A ^ B;
        SHL: {C,Y} = {1'b0,A} << 1;
        SHR: {Y,C} = {A,1'b0} >> 1;
        default: y = 0;
        endcase
    
    // Set flags
    Z = ~(|Y);  // 1 if all bits are 0
    N = Y[7];   // 1 if MSB is 1
    V = (A[7] == B[7]) && (A[7] != y[7]); // 1 if MSB of A and B are equal and MSB of Y is different
    Y = y;      // Output
end



endmodule



