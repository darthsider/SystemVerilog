class counter_bfm;
  
  virtual counter_intf intf;
  mailbox gen2bfm;
  int no_transactions;
  
  function new(virtual counter_intf intf,mailbox gen2bfm);
    this.intf = intf;
    this.gen2bfm = gen2bfm;
  endfunction
  
  task reset;
    wait(intf.rst);
    $display("Reset Initiated");
    intf.bfm_cb.load <= 0;
    intf.bfm_cb.updown <= 0;
    intf.bfm_cb.data <= 0;
    intf.bfm_cb.data_out <= 0;
    wait(!intf.rst);
    $display("Reset finished");
  endtask
  
  
  task main;
    forever begin
    counter_trans trans;
    gen2bfm.get(trans);
    $display("Transaction No. = %0d", no_transactions);
    intf.bfm_cb.load <= trans.load;
    intf.bfm_cb.updown <= trans.updown;
    intf.bfm_cb.data <= trans.data;
    repeat(2)@(posedge intf.clk);
    trans.data_out = intf.bfm_cb.data_out;
    trans.display();
    no_transactions++;
  end
endtask


endclass   