class generator;
  transaction trans;
  mailbox g2d;
  
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
    
    repeat(100) begin
      trans = new();
     
      assert(trans.randomize());
      g2d.put(trans);
      $display("Generator is Ready");
      #3;
    end
  endtask
endclass
