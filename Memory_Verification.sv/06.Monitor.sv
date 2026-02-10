class monitor;
  transaction trans;
  mailbox m2s;
  virtual inter vinf;
  
  function new(mailbox m2s, virtual inter vinf);
    this.m2s = m2s;
    this.vinf = vinf;
  endfunction
  
  task mon();
    
    repeat (10) begin
      @(posedge vinf.clk);
      #1;
      trans = new();
      trans.r_w = vinf.r_w;
      trans.addr = vinf.addr;
      trans.wr_d = vinf.wr_d;
      trans.rd_d = vinf.rd_d;
      m2s.put(trans);
      trans.display("Monitor Ready");
    end
  endtask 
endclass
