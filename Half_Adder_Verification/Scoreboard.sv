class scoreboard;
  mailbox m2s;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task score();
    transaction tr;
    repeat (2) begin
      m2s.get(tr);
      tr.display("fsr_scr_b");
      if ((tr.a ^ tr.b) == tr.sum && (tr.a & tr.b) == tr.carry)
        $display("Result : pass");
      else 
        $display("Result : fail");
    end
  endtask
endclass
      
