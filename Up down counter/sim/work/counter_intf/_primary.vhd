library verilog;
use verilog.vl_types.all;
entity counter_intf is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end counter_intf;
