`define BFM_IF intf.BFM.bfm_cb

class counter_bfm;
  
  counter_trans trans;
  mailbox gen2bfm;
  virtual counter_intf intf;
  int no_transactions;
  
  function new(virtual counter_intf intf,mailbox gen2bfm);
    this.intf = intf;
    this.gen2bfm = gen2bfm;
  endfunction
  
  
  task reset;
    wait(intf.reset);
    $display("Reset Initiated");
    `BFM_IF.load <= 0;
    `BFM_IF.up_down <= 0;
    `BFM_IF.data_in <= 0;
    `BFM_IF.data_out <= 0;
    wait(!intf.reset);
    $display("Reset finished");
  endtask
  
    
  task main;
    forever begin
      counter_trans trans;
      gen2bfm.get(trans);
      $display("\t Transaction No. = %0d",no_transactions);
      @(posedge intf.clk);
      `BFM_IF.load <= trans.load;
      `BFM_IF.up_down <= trans.up_down;
      `BFM_IF.data_in <= trans.data_in;
      trans.data_out = `BFM_IF.data_out;
    $display("----------------------------------------------");
    $display("\t load = %0b, \t data_in = %0b, \t up_down = %0b, \t data_out = %0b",trans.load,trans.data_in,trans.up_down,`BFM_IF.data_out);
    $display("----------------------------------------------");
    @(posedge intf.clk);
      no_transactions++;
    end
  endtask
  
endclass
