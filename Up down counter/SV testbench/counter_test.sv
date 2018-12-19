program counter_test(counter_intf intf);
  
  counter_env env;
  
  initial begin
    env = new(intf);
    env.gen.repeat_count = 10;
    env.run();
  end
  
endprogram
