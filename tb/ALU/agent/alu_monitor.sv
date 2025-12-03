class alu_monitor; 
   virtual alu_if vif;
   integer log_file;
   int seq_id;

   function new(virtual alu_if v);
      this.log_file = $fopen("log.txt", "w");
      $fdisplay(this.log_file, "time,id,selection,a,b,c_in,m,f,p,g,c4,ab");
      this.vif = v;
      this.seq_id = 0;
   endfunction

   function void set_id(int id);
      this.seq_id = id;
   endfunction

   task run();
      forever begin
         @(vif.s or vif.a or vif.b or vif.cn or vif.m);
         #5;
         $fdisplay(
            this.log_file, 
            "%0t,%04d,%04b,%04b,%04b,%0b,%0b,%04b,%0b,%0b,%0b,%0b", 
            $time, this.seq_id,
            vif.s, vif.a, vif.b, vif.cn, vif.m,
            vif.f, vif.p, vif.g, vif.cn_4, vif.a_eq_b
         );
      end
   endtask

endclass