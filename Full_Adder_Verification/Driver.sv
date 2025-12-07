class driver;
  transaction tr;
  mailbox g2d;
  virtual inter vintf;
  
  function new(virtual inter vintf, mailbox g2d);
    this.vintf = vintf;
    this .g2d = g2d;
  endfunction
  
  task drive();
    repeat(2) begin
      #1;
      tr = new();
      g2d.get(tr);
      vintf.a <= tr.a;
      vintf.b <= tr.b;
      vintf.c <= tr.c;
      tr.display("driver class signals");
      #2;
    end
  endtask
endclass
