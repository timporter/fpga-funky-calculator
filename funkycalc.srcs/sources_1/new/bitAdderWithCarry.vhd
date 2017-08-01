----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.07.2017 07:51:41
-- Design Name: 
-- Module Name: adder - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bitAdderWithCarry is
    Port ( leftArg  : in  STD_LOGIC_VECTOR (7 downto 0);
           rightArg : in  STD_LOGIC_VECTOR (7 downto 0);
           output   : out STD_LOGIC_VECTOR (8 downto 0));
end bitAdderWithCarry;

architecture Behavioral of bitAdderWithCarry is
begin 
    process(rightArg, leftArg)
    begin
        output <= ('0' & rightArg) + ('0' & leftArg);
    end process;

end Behavioral;
