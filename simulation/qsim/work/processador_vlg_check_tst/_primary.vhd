library verilog;
use verilog.vl_types.all;
entity processador_vlg_check_tst is
    port(
        LdOUTPUT        : in     vl_logic;
        R1              : in     vl_logic_vector(7 downto 0);
        R2              : in     vl_logic_vector(7 downto 0);
        ResultULA       : in     vl_logic_vector(7 downto 0);
        SelDesv         : in     vl_logic;
        SelJMP          : in     vl_logic;
        Wr              : in     vl_logic;
        addR1           : in     vl_logic_vector(2 downto 0);
        addR2           : in     vl_logic_vector(2 downto 0);
        addRegWr        : in     vl_logic_vector(2 downto 0);
        dadoMemoria     : in     vl_logic_vector(15 downto 0);
        dadoWr          : in     vl_logic_vector(7 downto 0);
        enderecoMemoria : in     vl_logic_vector(7 downto 0);
        estado          : in     vl_logic_vector(2 downto 0);
        pOUTPUT         : in     vl_logic_vector(7 downto 0);
        selDtWr         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end processador_vlg_check_tst;
