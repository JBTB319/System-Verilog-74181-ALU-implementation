module tb_shiter();
   logic [3:0]A;
   logic [3:0]A_S;

   shifter shift (
      .a(A),
      .a_s(A_S)
   );

   initial begin
      int i = 0;
      logic [3:0] expected;

      for (i = 0; i < 16 ; i++ ) begin
         A = 4'(i);

         #1

         if (i >= 7) begin
            expected = 4'((i * 2) - 16);
         end else begin
            expected = 4'(i*2);
         end

         $display("A=%b | A_S=%b | E=%4b", A, A_S, expected);
         assert(A_S == expected)
         else $display("ERROR"); 
      end
   end

endmodule