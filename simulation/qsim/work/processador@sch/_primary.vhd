library verilog;
use verilog.vl_types.all;
entity processadorSch is
    port(
        dadoULA         : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        RST             : in     vl_logic;
        estado          : out    vl_logic_vector(2 downto 0);
        PC              : out    vl_logic_vector(7 downto 0);
        pOut            : out    vl_logic_vector(7 downto 0)
    );
end processadorSch;
