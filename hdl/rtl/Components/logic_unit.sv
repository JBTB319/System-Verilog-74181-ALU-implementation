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
   logic s[3:0],
   logic a[3:0],
   logic b[3:0],
   logic f[3:0]
);

   always_comb begin
      case (s)
         4'b0000: result = ~a;
         4'b0001: result = ~(a | b); 
         4'b0010: result = (~a) & b; 
         4'b0011: result = 4'b0;
         4'b0100: result = ~(a&b);
         4'b0101: result = ~b; 
         4'b0110: result = a ^ b; 
         4'b0111: result = a & (~b);
         4'b1000: result = ~(a) | b; 
         4'b1001: result = ~(a ^ b);
         4'b1010: result = b;
         4'b1011: result = a & b;
         4'b1100: result = 4'b1111 ;
         4'b1101: result = a | ~(b) ;
         4'b1110: result = a | b; 
         4'b1111: result = a;
         default: result = 4'0000;
      endcase
   end
endmodule

