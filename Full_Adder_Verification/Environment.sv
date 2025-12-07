`include "Transcation.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  mailbox g2d;
  mailbox m2s;
  
  virtual inter vintf;
  
  function new(virtual inter vintf);
    this.vintf = vintf;
    g2d = new();
    m2s = new();
    
    gen = new(g2d);
    drv = new(vintf,g2d);
    mon = new(vintf,m2s);
    sb = new(m2s);
  endfunction
  
  task run();
    fork
      gen.gene();
      drv.drive();
      mon.monit();
      sb.score();
    join
  endtask
endclass
