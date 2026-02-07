class scoreboard;
  transaction trans;
  mailbox m2s;
  
  bit [7:0] exp_mem[15:0];
  bit [7:0] exp_rd_d;
  function new(mailbox m2s);
    this.m2s = m2s;
  endfunction
  
  task score();
    trans = new();
    repeat(10) begin
      m2s.get(trans);
      trans.display("Scoreboard");
      
      if(trans.r_w)begin
        exp_mem[trans.addr] = trans.wr_d;
        $display("r_w = %0d | addr = %0d | wr_d = %0d",trans.r_w,trans.addr,trans.wr_d);
      end
      
      else begin
        exp_rd_d = exp_mem[trans.addr];
        $display("mem[addr] = %0d | rd_d = %0d",trans.addr,trans.rd_d);
        if(exp_rd_d===trans.rd_d)
          $display("Result:PASS!=> w_r = %0d | addr = %0d | exp_rd_d = %0d | rd_d = %0d",trans.r_w,trans.addr,exp_rd_d,trans.rd_d);
        else
          $display("Result:FAIL!=> w_r = %0d | addr = %0d | exp_rd_d = %0d | rd_d = %0d",trans.r_w,trans.addr,exp_rd_d,trans.rd_d);
      end
    end
  endtask
endclass
