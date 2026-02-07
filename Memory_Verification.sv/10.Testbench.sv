`include "interface.sv"
`include "test.sv"

module mem_tb;
  inter vinf();
  
  mem uut(
    .clk(vinf.clk),
    .r_w(vinf.r_w),
    .addr(vinf.addr),
    .wr_d(vinf.wr_d),
    .rd_d(vinf.rd_d)
  );
  
  initial begin
  
  forever #5 vinf.clk = ~vinf.clk;
  end
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    vinf.clk = 0;
    #100;
    $finish;
  end
  test tst(vinf);
endmodule
