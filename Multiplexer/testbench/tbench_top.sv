module tbench_top;
  
  bit clk;
  bit reset;
  
  intf vif(clk,reset);
  test t1(vif);
  mux dut(.clk(vif.clk),
          .reset(vif.reset),
          .a(vif.a),
          .b(vif.b),
          .c(vif.c),
          .d(vif.d),
          .sel(vif.sel),
          .y(vif.y)
          );
          
 
 always #5 clk = ~clk;
 
 initial begin
 reset = 1;
 #5 reset = 0;
 end
 
 endmodule          
