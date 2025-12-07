class monitor;
  transaction tr;
  mailbox m2s;
  virtual inter vintf;
  
  function new(virtual inter vintf, mailbox m2s);
    this.vintf = vintf;
    this.m2s = m2s;
  endfunction
  
  task monit();
    repeat(2) begin
      #2;
      tr = new();
      tr.a = vintf.a;
      tr.b = vintf.b;
      tr.c = vintf.c;
      tr.sum = vintf.sum;
      tr.carry = vintf.carry;
      m2s.put(tr);
      tr.display("monitor class signals");
      #1;
    end
  endtask
endclass
      
