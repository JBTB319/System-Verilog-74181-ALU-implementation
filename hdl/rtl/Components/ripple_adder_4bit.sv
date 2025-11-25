module ripple_adder_4bit (
   input logic [3:0]a,
   input logic [3:0]b,
   input logic c_in,
   output logic [3:0]f,
   output logic c_out
);
   logic [3:0]c_temp;

   genvar i;

   adder fa1 (
      .a(a[0]),
      .b(b[0]),
      .c_in(c_in),
      .s(f[0]),
      .c_out(c_temp[0])
   );

   generate
      for (i = 1; i < 4 ; i++ ) begin
         adder fa_i(
               .a(a[i]),
               .b(b[i]),
               .c_in(c_temp[i]),
               .s(f[i]),
               .c_out(c_temp[i])
         );
      end
   endgenerate

   assign c_out = c_temp[3];
endmodule