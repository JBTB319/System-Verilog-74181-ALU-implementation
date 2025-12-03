module alu_top();
   alu_if               a_if();
   alu_agent            agent;
   alu_sweep_sequence   seq1;
   alu_logic_sequence   seq2;
   alu_math_sequence    seq3;
   alu_math_c_sequence  seq4;

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
      seq1 = new (agent.driver);
      seq2 = new (agent.driver);
      seq3 = new (agent.driver);
      seq4 = new (agent.driver);

      agent.start();

      agent.set_id(seq1.seq_id);
      seq1.run();

      #1
      agent.set_id(seq2.seq_id);
      seq2.run();

      #1
      agent.set_id(seq3.seq_id);
      seq3.run();

      #1
      agent.set_id(seq4.seq_id);
      seq4.run();
      
   end
endmodule