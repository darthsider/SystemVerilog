library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        up_down         : in     vl_logic;
        data_in         : in     vl_logic_vector(3 downto 0);
        load            : in     vl_logic;
        data_out        : out    vl_logic_vector(3 downto 0)
    );
end counter;
