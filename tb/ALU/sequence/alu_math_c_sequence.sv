class alu_math_c_sequence extends alu_sequence;
   function new (alu_driver v);
      super.new(v, 4);
   endfunction

   virtual task run();
      int i, j, k;
      int op;
      int a;
      int b;
      int cn;
      int m;
      
      alu_transaction trans;

      for (i = 0; i < 16; i++) begin 
         op = i;
         m = 1;
         cn = 1;

         for (j = 0; j < 16; j++) begin
            a = j;

            for (k = 0; k < 16; k++) begin
               b = k;
               trans = new(op, a, b, cn, m);
               this.driver.drive_transaction(trans);
            end
         end
      end
   endtask
endclass //className extends superClass