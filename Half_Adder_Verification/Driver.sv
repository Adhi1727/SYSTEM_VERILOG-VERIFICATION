class driver;
  transaction tr;
  mailbox g2d;
  virtual inter vir;
  
  function new(virtual inter vir, mailbox g2d);
    this.vir = vir;
    this.g2d = g2d;
  endfunction
  
  task dir();
    repeat (2) begin
      tr = new();
      g2d.get(tr);
      vir.a <= tr.a;
      vir.b <= tr.b;
      tr.display("driver class signals");
      #2;
    end
  endtask
endclass
