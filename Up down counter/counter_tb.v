`include "counter.v"

module counter_tb;
  
  reg clk;
  reg reset;
  reg [3:0] data_in;
  reg load;
  reg up_down;
  wire [3:0] data_out;
  
  counter dut(clk,reset,up_down,data_in,load,data_out);


initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin
  reset = 1;
  #10;
  reset = 0;
end

initial begin
  load = 1;
  data_in = 4'b1100;
  #50;
  load = 0;
  reset = 1;
  #10;
  reset = 0;
  up_down = 1;
  #100;
  reset = 1;
  #10;
  reset = 0;
  up_down = 0;
  #100;
  $stop;
end

endmodule