`include "interface.sv"
`include "test.sv"
module testbench;
  inter vir();
  test tst(vir);
  
  half_adder(.a(vir.a),.b(vir.b),.sum(vir.sum),.carry(vir.carry));
endmodule
