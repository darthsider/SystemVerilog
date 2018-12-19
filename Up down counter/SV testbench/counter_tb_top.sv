module counter_tb_top;
  
  bit clk;
  bit reset;
  
  counter_intf intf(clk,reset);
  counter_test test(intf);
  
  counter dut (.clk(intf.clk),
               .reset(intf.reset),
               .load(intf.load),
               .up_down(intf.up_down),
               .data_in(intf.data_in),
               .data_out(intf.data_out)
               );
               
               
  always #5 clk = ~clk;
  
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
endmodule             
