class generator;
  transaction trans;
  mailbox g2d;
  event e1;
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task main();
    trans = new();
    repeat (5) begin
      void'(trans.randomize());
      g2d.put(trans);
      trans.display("GENERATOR CHECKED");
      @e1;
    end
  endtask
endclass
