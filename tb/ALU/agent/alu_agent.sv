class alu_agent 
   virtual alu_if vif;
   alu_driver driver;
   alu_monitor monitor;

   function new(alu_if v);
      vif = v;
      driver = new(vif);
      monitor = new(vif);
   endfunction

   task start();
      fork
         monitor.run();
      join_none
   endtask
   
endclass