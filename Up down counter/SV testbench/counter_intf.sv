interface counter_intf(input logic clk,rst);
  
  logic load;
  logic updown;
  logic [3:0] data;
  logic [3:0] data_out;
  
  
  clocking bfm_cb @(posedge clk);
    default input #1 output #1;
    output load;
    output updown;
    output data;
    input data_out;
  endclocking
  
  clocking monitor_cb @(posedge clk);
    default input #1 output #1;
    input load;
    input updown;
    input data;
    input data_out;
  endclocking
  
  modport BFM (clocking bfm_cb,input clk,rst);
  modport MONITOR (clocking monitor_cb,input clk,rst);
  
endinterface
