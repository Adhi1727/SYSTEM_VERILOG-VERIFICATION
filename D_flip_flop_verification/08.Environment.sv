`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gene;
  driver driv;
  monitor moni;
  scoreboard scor;
  transaction trans;
  
  mailbox g2d;
  mailbox m2s;
  
  virtual inter inf;
  event e1;
  
  function new(virtual inter inf);
    this.inf = inf;
    g2d = new();
    m2s = new();
    gene = new(g2d);
    driv = new(g2d,inf);
    moni = new(m2s,inf);
    scor = new(m2s);
    
    gene.e1 = this.e1;
    scor.e1 = this.e1;
  endfunction
  
  task eni();
    fork
      gene.main();
      driv.dri();
      moni.moni();
      scor.score();
    join
  endtask
endclass
    
