class alu_monitor 
   virtual alu_if vif

   function new(virtual alu_if v);
      this.vif = v;
   endfunction

   task run();
      forever begin
         @(vif.s or vif.a or vif.b or vif.cn or vif.m);

         $display("IN  : S=%b, A=%b, B=%b, CN=%b,  M=%b");
         $display("OUT : F=%b, P=%b, G=%b, C4=%b, AB=%b");
      end
   endtask

endclass