/*
*----------------------------------------------------------------------
* Module:   Logic Unit
* Function: Logic Unit Module that implements all 16 logic functions 
* in the 74181
* Author:   Bibek Bhattarai
* Date:     Nov 2025
*----------------------------------------------------------------------
*/

module logic_unit (
   input logic    [3:0] s,
   input logic    [3:0] a,
   input logic    [3:0] b,
   output logic   [3:0] f
);

   always_comb begin
      case (s)
         4'b0000: f = ~a;
         4'b0001: f = ~(a | b); 
         4'b0010: f = (~a) & b; 
         4'b0011: f = 4'b0000;
         4'b0100: f = ~(a&b);
         4'b0101: f = ~b; 
         4'b0110: f = a ^ b; 
         4'b0111: f = a & (~b);
         4'b1000: f = ~(a) | b; 
         4'b1001: f = ~(a ^ b);
         4'b1010: f = b;
         4'b1011: f = a & b;
         4'b1100: f = 4'b1111 ;
         4'b1101: f = a | ~(b) ;
         4'b1110: f = a | b; 
         4'b1111: f = a;
         default: f = 4'b0000;
      endcase
   end
endmodule

