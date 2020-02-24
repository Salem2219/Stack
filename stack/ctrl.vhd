library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
    port (en : in std_logic;
    I : in std_logic_vector(2 downto 0);
    t_ld, empty_ld, top_ld, data_wr : out std_logic;
    t_sel : out std_logic_vector(1 downto 0));
end ctrl;

architecture rtl of ctrl is
    begin
        process(I, en)
        begin
        if(en ='1') then
            case I is
                when "000" =>
                t_ld <= '1';
                empty_ld <= '0';
                top_ld <= '0';
                data_wr <= '0';
                t_sel <= "00";
                when "001" =>
                t_ld <= '0';
                empty_ld <= '1';
                top_ld <= '0';
                data_wr <= '0';
                t_sel <= "00";
                when "010" =>
                t_ld <= '1';
                empty_ld <= '0';
                top_ld <= '0';
                data_wr <= '1';
                t_sel <= "10";
                when "011" =>
                t_ld <= '1';
                empty_ld <= '0';
                top_ld <= '0';
                data_wr <= '0';
                t_sel <= "11";
                when "100" =>
                t_ld <= '0';
                empty_ld <= '0';
                top_ld <= '1';
                data_wr <= '0';
                t_sel <= "00";
                when others =>
                t_ld <= '0';
                empty_ld <= '0';
                top_ld <= '0';
                data_wr <= '0';
                t_sel <= "00";
            end case;
        else
                t_ld <= '0';
                empty_ld <= '0';
                top_ld <= '0';
                data_wr <= '0';
                t_sel <= "00";
        end if;
        end process;
    end rtl;
