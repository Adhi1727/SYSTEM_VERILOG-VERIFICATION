`include "environment.sv"

program test(inter inf);
  environment envi;
  initial begin
    envi = new(inf);
    envi.eni();
  end
endprogram
