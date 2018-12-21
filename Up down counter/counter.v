module counter(clk,rst,load,updown,data,data_out);


input clk;
input rst;
input load;
input updown;
input [3:0] data;
output reg [3:0] data_out;


always @(posedge clk) begin
  if(rst)
    data_out <= 0;
  else if(load)
    data_out <= data;
  else if(updown)
    data_out <= data_out + 1;
  else 
    data_out <= data_out - 1;
  end
  
endmodule