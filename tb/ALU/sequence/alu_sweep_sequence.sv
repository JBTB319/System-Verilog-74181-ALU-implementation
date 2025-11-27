class alu_sweep_sequence extends alu_sequence;

   virtual task run();
      int i;
      int op;
      int a;
      int b;
      int cn;
      
      alu_transaction trans;

      for (int i = 0; i < 32; i++) begin 
         op = i % 16;
         a = $urandom_range(0,15);
         b = $urandom_range(0,15);
         cn = $urandom_range(0,1);
         m = i > 15 ? 1 : 0;

         trans = new(op, a, b, cn, m);
      end
   endtask
endclass //className extends superClass