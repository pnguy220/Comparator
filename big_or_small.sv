`timescale 1ns / 1ps
////////////////////////////////////////////////////////

module big_or_small(
    input [3:0]A,
    input [3:0]B,
    input GT_sw,
    input LT_sw,
    input EQ_sw,
    output [6:0]Segment,
    output logic [3:0]Led
);

    logic G,L,E;
    comp4bit comparator(.A(A), .B(B), .G(G), .L(L), .E(E));
        
    logic [3:0]num_to_show;
    loose_sev_sec_dec display(.bin_num(num_to_show), .segment(Segment));
    
    logic [1:0]switch_counter;// to track how many switches are on at a time
  
    // this big small module uses loose decoder
    always_comb begin
        
        num_to_show = 4'b0000; //set num on display to 0
        Led = 4'b1111;// set display to intially OFF       
        switch_counter = GT_sw + LT_sw + EQ_sw;
        
        case(switch_counter)
            1 : begin //if only 1 switch on , then 
                
                if (GT_sw) begin
                    Led = 4'b1110;
                    if (G)
                        num_to_show = A;
                    else 
                        num_to_show = B;
                end
                
                else if (LT_sw) begin
                    Led = 4'b1110;
                    if (L)
                        num_to_show = A;
                    else
                        num_to_show = B;
                end
                
                else if (EQ_sw) begin
                    if (E) begin // Display only turns on if A == B
                        Led = 4'b1110;
                        num_to_show = A;
                    end                  
                end
            end// end statement for 1 : begin
            
            default : begin // case if switch counter NOT 1
            end // do nothing, keep intial conditions
        endcase// end for case
    end//end for always_comb        
                
                
endmodule
