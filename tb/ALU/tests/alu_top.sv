module alu_top();
   alu_if               a_if();
   alu_agent            agent;
   alu_sweep_sequence   seq;

   alu DUT (
      .s(a_if.s),
      .a(a_if.a),
      .b(a_if.b),
      .cn(a_if.cn),
      .m(a_if.m),
      .f(a_if.f),
      .p(a_if.p),
      .g(a_if.g),
      .a_eq_b(a_if.a_eq_b),
      .cn_4(a_if.cn_4)
   );

   initial begin
      agent = new(a_if);
      seq = new (agent.driver);
      
      agent.start();

      #1;

      fork
         seq.run();
      join_none
   end
endmodule