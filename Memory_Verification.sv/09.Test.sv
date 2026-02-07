`include "environmnet.sv"
program test(inter vinf);
  environment en;
  initial begin
    en = new(vinf);
    en.eni();
  end
endprogram
