module counter(clk,reset,up_down,data_in,load,data_out);
  
  input clk;
  input reset;
  input up_down;
  input load;
  input [3:0] data_in;
  output reg [3:0] data_out;


always @(posedge clk) begin
  if(reset)
    data_out <= 0;
  else if(load)
    data_out <= data_in;
  else if(up_down)
    data_out <= data_out + 1;
  else
    data_out <= data_out - 1;
  end
  
endmodule