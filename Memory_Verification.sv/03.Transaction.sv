class transaction;
  bit clk;
  rand bit r_w;
  rand bit [3:0]addr;
  rand bit [7:0]wr_d;
  bit [7:0]rd_d;
  
  constraint cons1 {addr>0; addr<10;}
  constraint cons2 { r_w dist {1:=50,0:=50};}
  constraint cons4 {addr!=0;wr_d!=0;}
  
  function void display(string flag);
    $display("%s",flag);
    $display("Transaction is Ready");
  endfunction
endclass
  
  
