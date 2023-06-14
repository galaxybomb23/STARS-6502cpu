// top file

module CPU65c02 (
    inout logic [15:0] AB,   // address bus
    input logic BE,         // bus enable
    inout logic [7:0] DB,    // data bus
    input logic IRQB,       // interrupt request
    output logic MLB,       // memory lock
    input logic NMIB,       // non-maskable interrupt
    input logic PHI2,       // phase 2 in clock
    output logic PHI2O,     // phase 2 out clock
    output logic PHI1O,     // phase 1 out clock
    output logic RWB,       // read/write
    input logic RDY,        // ready   
    input logic RESB,       // reset
    input logic SOB,        // set overflow
    output logic SYNC,      // synchronize with OpCode fetch
    output logic VPB        // vector pull

);
// internal signals
logic [7:0] P = 8'bxx1xxxxx;             // Processor Status Register {N,V,-,B,D,I,Z,C} = { negative, overflow, 1, break, decimal, interrupt, zero, carry }
logic [7:0] A;                           // Accumulator
logic [7:0] Y;                           // Index Register Y
logic [7:0] X;                           // Index Register X
logic [15:0] PC;                         // Program Counter {8'PCH,8'PCL}
logic [15:0] S;                         // Stack Pointer register


endmodule
