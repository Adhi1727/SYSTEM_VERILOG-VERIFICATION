class driver;
  transaction trans;
  mailbox g2d;
  virtual inter inf;
  
  function new(mailbox g2d, virtual inter inf);
    this.g2d = g2d;
    this.inf = inf;
  endfunction
  
  task dri();
    trans = new();
    repeat (5) begin
      g2d.get(trans);
      @(posedge inf.clk);
      inf.d <= trans.d;
      trans.display("DRIVER CHECKED");
      $display("rst = %b",inf.rst);
    end
  endtask 
endclass
      
