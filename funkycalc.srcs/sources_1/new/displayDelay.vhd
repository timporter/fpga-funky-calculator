----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.07.2017 23:05:20
-- Design Name: 
-- Module Name: displayDelay - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity displayDelay is
    Port ( clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (8 downto 0);
           output : out STD_LOGIC_VECTOR (8 downto 0));
end displayDelay;

architecture Behavioral of displayDelay is
    signal s_count  : STD_LOGIC_VECTOR(20 downto 0);
    signal s_output : STD_LOGIC_VECTOR(8 downto 0);
begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
            s_count <= s_count + 1;
            if (s_count(20 downto 0) = 0) then
                if (s_output > input) then
                    s_output <= s_output - 1;
                elsif (s_output < input) then
                    s_output <= s_output + 1;
                end if;
            end if;
        end if;
        
        output <= s_output;
        
    end process;

end Behavioral;
