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
  
  virtual inter vinf;
  
  function new(virtual inter vinf);
    this.vinf = vinf;
    g2d = new();
    m2s = new();
    gene = new(g2d);
    driv = new(g2d,vinf);
    moni = new(m2s,vinf);
    scor = new(m2s);
    
  endfunction
  
  task eni();
    fork
      gene.main();
      driv.drv();
      moni.mon();
      scor.score();
    join
  endtask
endclass
