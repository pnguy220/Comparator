`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////// 
//////////////////////////////////////////////////////////////////////////////////

module comp4bit(
    
    input logic [3:0]A,
    input logic [3:0]B,
    output logic G,
    output logic L,
    output logic E
    );
   
    nbitcomp #(.n(4)) comparator(.A(A), .B(B), .GT(G), .LT(L), .EQ(E));
endmodule
