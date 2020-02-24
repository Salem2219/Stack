library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:=0.1 ns;
  signal clk: std_logic:='0';
  signal rst, en: std_logic;
  signal empty : std_logic_vector(0 downto 0);
  signal I : std_logic_vector(2 downto 0);
  signal din, top: std_logic_vector (7 downto 0);
  component toplevel
    port (clk, rst, en : in std_logic;
    I : in std_logic_vector(2 downto 0);
    din : in std_logic_vector(7 downto 0);
    empty : out std_logic_vector(0 downto 0);
    top : out std_logic_vector(7 downto 0));
  end component ;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    en <= '1';
    I <= "000", "001" after 0.2 ns;
    din <= "00000100"; --4
    dut: toplevel port map(clk,rst,en,I,din,empty,top);
  end behav;