class scoreboard;
  transaction trans;
  mailbox m2s;
  event e1;
  
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task score();
    trans = new();
    repeat (5) begin
      m2s.get(trans);
      trans.display("SCOREBOARD CHECKED");
      
      if((trans.rst==1)&&(trans.q==0) || (trans.rst==0)&&(trans.q==trans.d))
        $display("Result : pass");
      else
        $display("Result : fail");
      ->e1;
    end
  endtask
endclass 
