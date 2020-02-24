library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity mux2_1 is
 port (sel: in std_logic;
 a, b: in std_logic_vector(4 downto 0);
 y: out std_logic_vector(4 downto 0));
end mux2_1;
architecture first of mux2_1 is
begin 
y <= a when sel = '0' else
 b;
end first; 
