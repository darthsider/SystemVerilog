class counter_trans;
  
  rand bit load;
  rand bit updown;
  rand bit [3:0] data;
  bit [3:0] data_out;
  
  function void display();
    $display("--------------------------------------------");
    $display("\t load = %0b, \t updown = %0b, \t data = %0b, \t data_out = %0b",load,updown,data,data_out);
    $display("--------------------------------------------");
  endfunction
  
endclass
