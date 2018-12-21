class counter_cov;
  
  counter_trans trans = new();
  
  covergroup cov_inst;
  option.per_instance = 1;
  LD:coverpoint trans.load {bins ld = {0,1};}
  UD:coverpoint trans.updown {bins ud = {0,1};}
  DIN:coverpoint trans.data {bins Di = {[0:15]};}
  DO:coverpoint trans.data_out {bins Do = {[0:15]};}
  endgroup 

  function new();
    cov_inst = new;
  endfunction
  
  task main;
    cov_inst.sample();
  endtask

endclass