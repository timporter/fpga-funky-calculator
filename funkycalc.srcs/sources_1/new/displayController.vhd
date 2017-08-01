----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.07.2017 08:12:12
-- Design Name: 
-- Module Name: displayController - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity displayController is
    Port ( clk : in STD_LOGIC;
           input       : in STD_LOGIC_VECTOR (8 downto 0);
           anodeSelect : out STD_LOGIC_VECTOR (3 downto 0);
           segments    : out STD_LOGIC_VECTOR (6 downto 0)
    );
end displayController;

architecture Behavioral of displayController is
    signal s_count : STD_LOGIC_VECTOR(19 downto 0);
    signal s_char  : integer; --STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk)
    begin
        if(clk'event and clk = '1') then
        
            s_count <= s_count + 1;
            if (s_count(18) = '0' and s_count(19) = '0') then
                anodeSelect <= "1110";
                s_char <= to_integer(unsigned(input)) mod 10;
            elsif (s_count(18) = '0' and s_count(19) = '1') then
                anodeSelect <= "1101";
                s_char <= (to_integer(unsigned(input)) mod 100) / 10;
            elsif (s_count(18) = '1' and s_count(19) = '0') then
                anodeSelect <= "1011";
                s_char <= (to_integer(unsigned(input)) mod 1000) / 100;
            elsif (s_count(18) = '1' and s_count(19) = '1') then
                anodeSelect <= "0111";
            end if;
        
            if (not ((s_count(18) = '1') and (s_count(19) = '1'))) then
                case s_char is
                    when 0 =>
                        segments <= not "0111111";
                    when 1 =>
                        segments <= not "0000110";
                    when 2 =>
                        segments <= not "1011011";
                    when 3 =>
                        segments <= not "1001111";
                    when 4 =>
                        segments <= not "1100110";
                    when 5 =>
                        segments <= not "1101101";
                    when 6 =>
                        segments <= not "1111101";
                    when 7 =>
                        segments <= not "0000111";
                    when 8 =>
                        segments <= not "1111111";
                    when 9 =>
                        segments <= not "1101111";
                    when others =>
                        segments <= not "1000001";
                end case;
            else
                case (to_integer(unsigned(input)) mod 6) is
                    when 0 =>
                        segments <= "1111110";
                    when 1 =>
                        segments <= "1111101";
                    when 2 =>
                        segments <= "1111011";
                    when 3 =>
                        segments <= "1110111";
                    when 4 =>
                        segments <= "1101111";
                    when 5 =>
                        segments <= "1011111";
                    when others =>
                        segments <= "1010101";
                end case;
            end if;
            
            
        end if;
    end process;

end Behavioral;
