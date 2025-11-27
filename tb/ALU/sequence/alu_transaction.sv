class alu_transaction;
   rand logic  [3:0] s,
   rand logic  [3:0] a,
   rand logic  [3:0] b.
   rand logic        cn,
   rand logic        m,

   logic       [3:0] f,
   logic             p,
   logic             g,
   logic             a_eq_b,
   logic             cn_4

   function void display();
      $display("IN  : S=%b, A=%b, B=%b, Cn=%b, M=%b", s, a, b, cn, m);
      $display("OUT : F=%b, P=%b, G=%b, AB=%b, C4=%b", f, p, g, a_eq_b, cn_4);
   endfunction

   function new (logic[3:0] s, logic[3:0] a, logic[3:0] b, logic Cn, logic m);
      this.s = s;
      this.a = a;
      this.b = b;
      this.cn = cn;
      this.m = m;
   endfunction

endclass
