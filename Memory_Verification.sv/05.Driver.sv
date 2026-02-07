class driver;
  transaction trans;
  mailbox g2d;
  virtual inter vinf;
  
  function new(mailbox g2d, virtual inter vinf);
    this.g2d = g2d;
    this.vinf = vinf;
  endfunction
  
  task drv();
    trans = new();
    repeat (10) begin
      g2d.get(trans);
      @(negedge vinf.clk)
      vinf.r_w <= trans.r_w;
      vinf.addr <= trans.addr;
      vinf.wr_d <= trans.wr_d;
      trans.display("Driver is Here");
    end
  endtask
endclass
