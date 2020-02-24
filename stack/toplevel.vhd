library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, en : in std_logic;
    I : in std_logic_vector(2 downto 0);
    din : in std_logic_vector(7 downto 0);
    empty : out std_logic_vector(0 downto 0);
    top : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
    component dp is
        port (clk, rst, t_ld, empty_ld, top_ld, data_wr : in std_logic;
        t_sel : in std_logic_vector(1 downto 0);
        din : in std_logic_vector(7 downto 0);
        empty : out std_logic_vector(0 downto 0);
        top : out std_logic_vector(7 downto 0));
    end component;
    component ctrl is
        port (en : in std_logic;
        I : in std_logic_vector(2 downto 0);
        t_ld, empty_ld, top_ld, data_wr : out std_logic;
        t_sel : out std_logic_vector(1 downto 0));
    end component;
    signal t_ld, empty_ld, top_ld, data_wr : std_logic;
    signal t_sel : std_logic_vector(1 downto 0);
    begin
        datapath : dp port map (clk, rst, t_ld, empty_ld, top_ld, data_wr, t_sel, din, empty, top);
        control : ctrl port map (en, I, t_ld, empty_ld, top_ld, data_wr, t_sel);
    end rtl;