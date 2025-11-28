/*
*----------------------------------------------------------------------
* Module:   Arithmetic Unit
* Function: Arithmetic Unit that implements all 16 mathematical
* functions in the 74181.
* Author:   Bibek Bhattarai
* Date:     Nov 2025
*----------------------------------------------------------------------
*/

module arithmetic_unit (
   input logic    [3:0] s,
   input logic    [3:0] a,
   input logic    [3:0] b,
   input logic          c_in,
   output logic   [3:0] f,
   output logic         c_out
);  
   // adder inputs
   logic [3:0] temp_a, temp_b;
   logic [3:0] temp_a_s;

   // Helpers
   logic [3:0] ab, ab_bar, aOrb, aOrb_bar;

   ripple_adder_4bit add1 (
      .a(temp_a),
      .b(temp_b),
      .c_in(c_in),
      .f(f),
      .c_out(c_out)
   );

   shifter shift (
      .a(a),
      .a_s(temp_a_s)
   );

   assign ab = a & b;
   assign ab_bar = a & ~b;
   assign aOrb = a | b;
   assign aOrb_bar = a | ~b;
  
   always_comb begin
      temp_a = a;
      temp_b = 0;

      case (s)
         4'b0000: begin
            temp_b = 0;
         end
         4'b0001: begin
            temp_a = aOrb;
         end
         4'b0010: begin 
            temp_a = aOrb_bar;
         end
         4'b0011: begin
            temp_a = 4'b1111;
         end
         4'b0100: begin
            temp_b = ab_bar;
         end
         4'b0101: begin
            temp_a = aOrb;
            temp_b = ab_bar;
         end
         4'b0110: begin
            temp_b = ~b;
         end
         4'b0111: begin
            temp_a = ab_bar;
            temp_b = 4'b1111;
         end
         4'b1000: begin
            temp_a = ab;
            temp_b = b;
         end
         4'b1001: begin
            temp_b = b;
         end
         4'b1010: begin
            temp_a = aOrb_bar;
            temp_b = ab;
         end
         4'b1011: begin
            temp_a = ab;
            temp_b = 4'b1111;
         end
         4'b1100: begin
            temp_b = temp_a_s;
         end
         4'b1101: begin
            temp_a = aOrb;
            temp_b = a;
         end
         4'b1110: begin
            temp_a = aOrb_bar;
            temp_b = a;
         end
         4'b1111: begin
            temp_b = 4'b1111;
         end
      endcase
   end
endmodule