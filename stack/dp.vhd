library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, t_ld, empty_ld, top_ld, data_wr : in std_logic;
    t_sel : in std_logic_vector(1 downto 0);
    din : in std_logic_vector(7 downto 0);
    empty : out std_logic_vector(0 downto 0);
    top : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
    component comp5 is
        port (a,b : in std_logic_vector(4 downto 0);
        y : out std_logic);
    end component;
    component decrementer is
        port (x : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    component incrementer is
        port (x : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    component mux4_1 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(4 downto 0);
        y: out std_logic_vector(4 downto 0));
    end component;
    component ram_16x8bit is
        port(clk, wr : in std_logic;
        addr : in std_logic_vector(3 downto 0);
        din : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0));
    end component;
    component reg1 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(0 downto 0);
        reg_out: out std_logic_vector(0 downto 0));
    end component;
    component reg5 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(4 downto 0);
        reg_out: out std_logic_vector(4 downto 0));
    end component;
    component reg8 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(7 downto 0);
        reg_out: out std_logic_vector(7 downto 0));
    end component;
    component mux2_1 is
        port (sel: in std_logic;
        a, b: in std_logic_vector(4 downto 0);
        y: out std_logic_vector(4 downto 0));
    end component;
    signal empty_in : std_logic_vector(0 downto 0);
    signal t_in, tplus1, tminus1, t, addr_in : std_logic_vector(4 downto 0);
    signal dout : std_logic_vector(7 downto 0);
    begin
        t_reg : reg5 port map (clk, rst, t_ld, t_in, t);
        t_mux : mux4_1 port map (t_sel, "11111", "00000", tplus1, tminus1, t_in);
        empty_reg : reg1 port map (clk, rst, empty_ld, empty_in, empty);
        empty_comp : comp5 port map (t, "11111", empty_in(0));
        t_adder : incrementer port map (t, tplus1);
        data_ram : ram_16x8bit port map (clk, data_wr, addr_in(3 downto 0), din, dout);
        t_sub : decrementer port map (t, tminus1);
        top_reg : reg8 port map (clk, rst, top_ld, dout, top);
        addr_mux : mux2_1 port map (top_ld, tplus1, t, addr_in);
    end rtl;
    