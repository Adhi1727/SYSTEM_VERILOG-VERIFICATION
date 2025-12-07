class generator;
  transaction tr;
  mailbox g2d;
  
  function new(mailbox g2d);
    this.g2d = g2d;
  endfunction
  
  task gene();
    repeat (4) begin
      tr = new();
      tr.randomize();
      $display("generator is ready");
      g2d.put(tr);
      #3;
    end
  endtask
endclass
