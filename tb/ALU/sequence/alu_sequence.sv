class alu_sequence;
   protected alu_driver driver;
   int seq_id;

   function new(alu_driver driver, int id);
      this.driver = driver;
      this.seq_id = id;
   endfunction

   virtual task run(); 
      $display("Override in child class");
   endtask

   task send_transaction(alu_transaction trans);
      driver.drive_transaction(trans);
   endtask

endclass