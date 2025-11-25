class adder_transcation;
   rand logic [3:0]A;
   rand logic [3:0]B;
   rand logic C_IN;

   logic [3:0]F;
   logic C_OUT;

   function void display();
      $display("A=%b, B=%b, C=%b, F=%b", this.A, this.B, this.C_IN, this.F);
   endfunction

endclass


class scoreboard;
   function void calc(adder_transcation trans);
      logic [4:0]expected_value;
      
      expected_value = trans.A + trans.B + trans.C_IN;

      trans.C_OUT = expected_value[4];
      trans.F = expected_value[3:0];

   endfunction
endclass


module tb_ripple_adder_4bit();
   adder_transcation adder_trans;
   scoreboard sc;
   logic [3:0] a_in, b_in, f_in;
   logic c_out, c_in;

   ripple_adder_4bit DUT(
      .a(a_in),
      .b(b_in),
      .c_in(c_in),
      .f(f_in),
      .c_out(c_out)
   );


   initial begin
      adder_trans = new();
      sc = new();


      repeat(100) begin
         void'(adder_trans.randomize());
         sc.calc(adder_trans);

         adder_trans.display();

         a_in = adder_trans.A;
         b_in = adder_trans.B;
         c_in = adder_trans.C_IN;

         #1

         $display("A=%b, B=%b, C=%b, F=%b",DUT.a,DUT.b,DUT.c_in,DUT.f);
         assert (DUT.c_out == adder_trans.C_OUT && DUT.f == adder_trans.F) 
         else   $error("FAILED");
         $display("--------");

      end
   end
endmodule