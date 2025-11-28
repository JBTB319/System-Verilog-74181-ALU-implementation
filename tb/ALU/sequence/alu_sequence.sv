class alu_sequence;

   protected alu_driver driver;

   function new(alu_driver driver);
      this.driver = driver;
   endfunction

   virtual task run(); 
      $display("Override in child class");
   endtask

   task send_transaction(alu_transaction trans);
      driver.drive_transaction(trans);
   endtask

endclass