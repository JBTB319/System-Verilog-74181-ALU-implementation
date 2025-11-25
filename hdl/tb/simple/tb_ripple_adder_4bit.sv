class adder_transcation;
   rand bit [3:0]A;
   rand bit [3:0]B;
   rand bit C_IN;

   bit [3:0]F;
   bit C_OUT;

   function display();
      $display("A=%h, B =%h, F=%h", this.A, this.B, this.F);
   endfunction

endclass


class scoreboard;
   function calc(adder_transcation trans);
      logic [4:0]expected_value;
      
      expected_value = trans.A + trans.B + trans.C_IN;

      {trans.C_OUT, trans.F} = expected_value;
   endfunction
endclass


module tb_ripple_adder_4bit();
   adder_transcation adder_trans;

   ripple_adder_4bit DUT(
      .a(adder_trans.A),
      .b(adder_trans.B),
      .c_in(adder_trans.C_IN),
      .f(adder_trans.s),
      .c_out(adder_trans.C_OUT)
   );


   initial begin
      adder_trans = new();


      repeat(100) begin
         adder_trans.randomize();
         adder_trans.display();
      end
   end
endmodule