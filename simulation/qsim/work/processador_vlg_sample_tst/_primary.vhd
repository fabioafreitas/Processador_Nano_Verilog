library verilog;
use verilog.vl_types.all;
entity processador_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        pINPUT          : in     vl_logic_vector(7 downto 0);
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end processador_vlg_sample_tst;
