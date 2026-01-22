class monitor;
  transaction trans;
  mailbox m2s;
  virtual inter inf;
  
  function new(mailbox m2s, virtual inter inf);
    this.m2s = m2s;
    this.inf = inf;
  endfunction
  
  task moni();
    trans = new();
    repeat(5) begin
      @(posedge inf.clk);
      trans.rst = inf.rst;
      trans.d = inf.d;
      trans.q = inf.q;
      m2s.put(trans);
      trans.display("MONITOR CHECKED");
    end
  endtask
endclass
