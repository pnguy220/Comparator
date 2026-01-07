`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module nbitcomp#(parameter n = 2)(
    input logic[n-1:0]A,
    input logic[n-1:0]B,
    output logic GT,LT,EQ
    );
    
    always_comb begin
        GT = 1'b0;
        LT = 1'b0;
        EQ = 1'b0;
        
        if (A < B) begin
            LT = 1'b1;
        end
        
        else if (A > B) begin
            GT = 1'b1;
        end
        
        else begin
            EQ = 1'b1;
        end       
                    
    end
endmodule

