class alu_driver;
   virtual alu_if vif;

   function new(virtual alu_if v);
      this.vif = v;
   endfunction

   task drive_transaction(alu_transaction tr);
      this.vif.s = tr.s;
      this.vif.a = tr.a;
      this.vif.b = tr.b;
      this.vif.cn = tr.cn;
      this.vif.m = tr.m;

      #10;
   endtask
endclass