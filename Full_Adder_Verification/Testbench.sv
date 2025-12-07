// or browse Examples
`include "Interface.sv"
`include "Test.sv"
module testbench;
  inter vintf();
  test tst(vintf);
  full_adder(.a(vintf.a),.b(vintf.b),.c(vintf.c),.sum(vintf.sum),.carry(vintf.carry));
endmodule

