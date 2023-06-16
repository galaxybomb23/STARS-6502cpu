


module programCounter (
    input  logic  clk, rdy, advance, load,
    input  logic [15:0] A_in,
    output logic [15:0] A_out
    );

    logic [15:0] A_internal;

    always_ff @(posedge clk) begin
        if (load) begin
            A_internal <= A_in;
        end else if (advance) begin
            A_internal <= A_internal + 1;
        end
    end