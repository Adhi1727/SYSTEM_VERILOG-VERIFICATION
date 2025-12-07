`include "Environment.sv"
program test(inter vintf);
  environment env;
  
  initial begin
    env = new(vintf);
    env.run();
  end
endprogram
