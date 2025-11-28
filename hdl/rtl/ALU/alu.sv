/*
*----------------------------------------------------------------------
* Module:   alu
* Function: Top level design that connects the LU and AU together to
* form the 74181.
* Author:   Bibek Bhattarai
* Date:     Nov 2025
*----------------------------------------------------------------------
*/


module alu (
   input logic    [3:0] s,
   input logic    [3:0] a,
   input logic    [3:0] b,
   input logic          cn,
   input logic          m,
   output logic   [3:0] f,
   output logic         p,
   output logic         g,
   output logic         a_eq_b,
   output logic         cn_4
);

logic [3:0] log_f;
logic [3:0] art_f;
logic art_cn_4;

logic_unit log_unit (
   .s(s),
   .a(a),
   .b(b),
   .f(log_f)
);

arithmetic_unit art_unit (
   .s(s),
   .a(a),
   .b(b),
   .c_in(cn),
   .f(art_f),
   .c_out(art_cn_4)
);

always_comb begin
   case (m)
      1'b0: begin
         f = art_f;
         p = 0; // for now
         g = 0;
         a_eq_b = 0;
         cn_4 = art_cn_4;
      end
      1'b1: begin
         f = log_f;
         p = 1; // for now
         g = 1;
         a_eq_b = 1;
         cn_4 = 1;
      end
   endcase
end

endmodule