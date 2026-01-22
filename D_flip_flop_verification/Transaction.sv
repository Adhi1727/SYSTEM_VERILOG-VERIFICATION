class transaction;
  bit rst;
  rand bit d;
  bit q;
  
  function void display(string tag);
    $display("%s",tag);
    $display($time,"rst = %b | d = %d | q = %b",rst,d,q);
  endfunction
endclass
