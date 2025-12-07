class scoreboard;
  mailbox m2s;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task score();
    transaction tr;
    repeat(2) begin
      m2s.get(tr);
        tr.display("fr_scr_b");
      if ((tr.a^tr.b^tr.c)==tr.sum && ((tr.a & tr.b )|(tr.b & tr.c)|(tr.c & tr.a)) == tr.carry)
      $display("Result:pass");
      else
        $display("Result:fail");
    end
  endtask
endclass
     
  
