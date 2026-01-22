`include "interface.sv"
`include "test.sv"

module dff_tb;
  inter inf();
  test tst(inf);
  dff dut(.clk(inf.clk),.rst(inf.rst),.d(inf.d),.q(inf.q));
  
  initial begin
    inf.clk = 0;
  end
  
  always #5 inf.clk = ~inf.clk;
  initial begin
    inf.rst = 1;
    #20 inf.rst = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #200;
    $finish;
  end
endmodule
