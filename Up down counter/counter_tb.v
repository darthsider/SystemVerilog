`include "counter.v"

module counter_tb;
  
  reg clk;
  reg rst;
  reg [3:0] data;
  reg load;
  reg updown;
  wire [3:0] data_out;
  
  counter dut(clk,rst,updown,data,load,data_out);


initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin
  rst = 1;
  #10;
  rst = 0;
end

initial begin
  load = 1;
  data = 4'b1100;
  #50;
  load = 0;
  rst = 1;
  #10;
  rst = 0;
  updown = 1;
  #100;
  rst = 1;
  #10;
  rst = 0;
  updown = 0;
  #100;
  $stop;
end

endmodule
