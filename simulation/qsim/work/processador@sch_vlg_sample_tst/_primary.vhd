library verilog;
use verilog.vl_types.all;
entity processadorSch_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        RST             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end processadorSch_vlg_sample_tst;
