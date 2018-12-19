interface counter_intf(input logic clk,reset);

logic load;
logic [3:0] data_in;
logic up_down;
logic [3:0] data_out;

clocking bfm_cb @(posedge clk);
default input #1 output #1;
output load;
output data_in;
output up_down;
input data_out;
endclocking

clocking monitor_cb @(posedge clk);
default input #1 output #1;
input load;
input data_in;
input up_down;
input data_out;
endclocking

modport BFM (clocking bfm_cb,input clk,reset);
modport MONITOR (clocking monitor_cb,input clk,reset);

endinterface
