library verilog;
use verilog.vl_types.all;
entity processador is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pINPUT          : in     vl_logic_vector(7 downto 0);
        dadoMemoria     : out    vl_logic_vector(15 downto 0);
        enderecoMemoria : out    vl_logic_vector(7 downto 0);
        pOUTPUT         : out    vl_logic_vector(7 downto 0);
        SelJMP          : out    vl_logic;
        SelDesv         : out    vl_logic;
        Wr              : out    vl_logic;
        selDtWr         : out    vl_logic;
        dadoWr          : out    vl_logic_vector(7 downto 0);
        addRegWr        : out    vl_logic_vector(2 downto 0);
        addR1           : out    vl_logic_vector(2 downto 0);
        addR2           : out    vl_logic_vector(2 downto 0);
        R1              : out    vl_logic_vector(7 downto 0);
        R2              : out    vl_logic_vector(7 downto 0);
        LdOUTPUT        : out    vl_logic;
        ResultULA       : out    vl_logic_vector(7 downto 0);
        estado          : out    vl_logic_vector(2 downto 0)
    );
end processador;
