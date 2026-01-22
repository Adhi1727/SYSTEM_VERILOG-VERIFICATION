`include "environment.sv"
program test(inter vir);
  environment env;
  
  initial begin
    env = new(vir);
    env.run();
  end
endprogram
