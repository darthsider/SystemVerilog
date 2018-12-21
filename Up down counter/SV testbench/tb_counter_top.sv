module tb_counter_top;
  
  bit clk;
  bit rst;
  
  counter_intf intf(clk,rst);
  counter_test test(intf);
  
  counter dut(.clk(intf.clk),
              .rst(intf.rst),
              .load(intf.load),
              .updown(intf.updown),
              .data(intf.data),
              .data_out(intf.data_out)
              );
              
              
 always #5 clk = ~clk;
 
 initial begin
 rst = 1;
 #5;
 rst = 0;
 end
 
 endmodule             
