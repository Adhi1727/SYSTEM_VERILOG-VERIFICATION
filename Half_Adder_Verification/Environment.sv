`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver divs;
  monitor mon;
  scoreboard sb;
  
  mailbox g2d;
  mailbox m2s;
  virtual inter vir;
  
  function new(virtual inter vir);
    this.vir = vir;
    g2d = new();
    m2s = new();
    
    gen = new(g2d);
    divs = new(vir,g2d);
    mon = new(vir,m2s);
    sb = new(m2s);
  endfunction
  
  task run();
    fork
      gen.gens();
      divs.dir();
      mon.mons();
      sb.score();
    join
  endtask
endclass
