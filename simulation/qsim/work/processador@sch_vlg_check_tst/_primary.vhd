library verilog;
use verilog.vl_types.all;
entity processadorSch_vlg_check_tst is
    port(
        dadoULA         : in     vl_logic_vector(7 downto 0);
        estado          : in     vl_logic_vector(2 downto 0);
        PC              : in     vl_logic_vector(7 downto 0);
        pOut            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end processadorSch_vlg_check_tst;
