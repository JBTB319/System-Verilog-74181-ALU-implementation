class alu_sweep_sequence extends alu_sequence;
   function new (alu_driver v);
      super.new(v, 1);
   endfunction

   virtual task run();
      int i;
      int op;
      int a;
      int b;
      int cn;
      int m;
      
      alu_transaction trans;

      for (int i = 0; i < 32; i++) begin 
         op = i % 16;
         a = $urandom_range(0,15);
         b = $urandom_range(0,15);
         cn = 0;
         m = i > 15 ? 0 : 1;

         trans = new(op, a, b, cn, m);

         this.driver.drive_transaction(trans);
      end
   endtask
endclass //className extends superClass