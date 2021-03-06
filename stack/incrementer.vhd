library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity incrementer is
    port (x : in std_logic_vector(4 downto 0);
    y : out std_logic_vector(4 downto 0));
end incrementer;

architecture rtl of incrementer is
    signal y_uns : unsigned(4 downto 0);
    begin
        y_uns <= unsigned(x) + 1;
        y <= std_logic_vector(y_uns);
    end rtl;
