class alu_monitor; 
   virtual alu_if vif;

   function new(virtual alu_if v);
      this.vif = v;
   endfunction

   task run();
      forever begin
         $display("IN  : S=%b, A=%b, B=%b, CN=%b,  M=%b", 
            vif.s, vif.a, vif.b, vif.cn, vif.m
         );

         @(vif.s or vif.a or vif.b or vif.cn or vif.m);

         $display("OUT : F=%b, P=%b, G=%b, C4=%b, AB=%b",
            vif.f, vif.p, vif.g, vif.cn_4, vif.a_eq_b
         );
      end
   endtask

endclass