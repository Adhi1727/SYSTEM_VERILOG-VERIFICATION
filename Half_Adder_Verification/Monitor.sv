class monitor;
  transaction tr;
  mailbox m2s;
  virtual inter vir;
  
  function new(virtual inter vir, mailbox m2s);
    this.m2s = m2s;
    this.vir = vir;
  endfunction
  
  task mons();
    repeat (2) begin
      tr = new();
      tr.a = vir.a;
      tr.b = vir.b;
      tr.sum = vir.sum;
      tr.carry = vir.carry;
      m2s.put(tr);
      tr.display("monitor class signals");
      #1;
    end
  endtask
endclass
