class transaction;
  bit clk;
  rand bit r_w;
  rand bit [3:0]addr;
  rand bit [7:0]wr_d;
  bit [7:0]rd_d;
  
  function void display(string flag);
    $display("%s",flag);
    $display("Transaction is Ready");
  endfunction
endclass
  
