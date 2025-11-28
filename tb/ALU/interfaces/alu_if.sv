interface alu_if;
   //inputs
   logic    [3:0] s;
   logic    [3:0] a;
   logic    [3:0] b;
   logic          cn;
   logic          m;

   // Outputs
   logic   [3:0] f;
   logic         p;
   logic         g;
   logic         a_eq_b;
   logic         cn_4;
endinterface //interfacename