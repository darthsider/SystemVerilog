class transaction;
  
  rand bit [3:0] a;
  rand bit [3:0] b;
  rand bit [3:0] c;
  rand bit [3:0] d;
  rand bit [1:0] sel;
       bit [3:0] y;
       
   function void display(string name);
   $display("----------------------------------------");
   $display("\t a = %0h, \t b = %0h, \t c = %0h, \t d = %0h",a,b,c,d);
   $display("\t sel = %0h, \t y = %0h",sel,y);
   $display("----------------------------------------");
   endfunction   
       
endclass
     
