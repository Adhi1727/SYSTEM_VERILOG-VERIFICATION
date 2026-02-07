class generator;
  transaction trans;
  mailbox g2d;
  
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
    trans = new();
    repeat(10) begin
      assert(trans.randomize());
      g2d.put(trans);
      $display("Generator is Ready");
      #3;
    end
  endtask
endclass
