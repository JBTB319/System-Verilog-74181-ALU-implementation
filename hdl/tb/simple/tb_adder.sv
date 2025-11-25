module tb_adder();
   bit clk;
   logic A,B,C_IN;
   logic S,C_OUT;

   parameter T = 5;

   always #T clk = ~clk;

   adder DUT (
      .a(A),
      .b(B),
      .c_in(C_IN),
      .s(s),
      .c_out(C_OUT)
   );

   initial begin
      bit expected_S, expected_C_OUT;
      int i;

      for (i = 0; i < 8;i++ ) begin
         {A, B, C_IN} = i;
         expected_C_OUT = (A & B) | (B & C_IN) | (A & C_IN);
         expected_S = A ^ B ^ C_IN;

         @(posedge clk);


         $monitor("Time=%2t | A=%b, B=%b, Cin=%b | Sum=%b, Cout=%b", 
           $time, DUT.a, DUT.b, DUT.c_in, DUT.s, DUT.c_out);

         assert (DUT.s == expected_S || DUT.c_out == expected_C_OUT) begin
            $display("Assertion: PASSED at %2t", $time);
         end else begin
            $error("Assertion: FAILED at %2t", $time);
         end
      end

      $finish;
   end
endmodule;