

class alu_agent; 
   virtual alu_if vif;
   alu_driver driver;
   alu_monitor monitor;

   function new(virtual alu_if v);
      this.vif = v;
      this.driver = new(vif);
      this.monitor = new(vif);
   endfunction

   task start();
      fork
         this.monitor.run();
      join_none
   endtask
   
endclass