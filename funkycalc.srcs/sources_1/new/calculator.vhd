----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.07.2017 07:30:46
-- Design Name: 
-- Module Name: calculator - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calculator is
    Port ( clk : in STD_LOGIC;
           leftIn   : in STD_LOGIC_VECTOR (7 downto 0);
           rightIn  : in STD_LOGIC_VECTOR (7 downto 0);
           leftOut  : out STD_LOGIC_VECTOR (7 downto 0);
           rightOut : out STD_LOGIC_VECTOR (7 downto 0);
           seg      : out STD_LOGIC_VECTOR (6 downto 0);
           an       : out STD_LOGIC_VECTOR (3 downto 0));
end calculator;

architecture Behavioral of calculator is

    signal s_leftArg   : STD_LOGIC_VECTOR(7 downto 0);
    signal s_rightArg  : STD_LOGIC_VECTOR(7 downto 0);
    signal s_answer    : STD_LOGIC_VECTOR(8 downto 0);
    signal s_toDisplay : STD_LOGIC_VECTOR(8 downto 0);

    COMPONENT argument
    PORT(
        clk     : in  STD_LOGIC;
        input   : in  STD_LOGIC_VECTOR(7 downto 0);
        display : out STD_LOGIC_VECTOR(7 downto 0);
        output  : out STD_LOGIC_VECTOR(7 downto 0)
    );
    END COMPONENT;
    
    COMPONENT bitAdderWithCarry
    PORT(
        leftArg  : in  STD_LOGIC_VECTOR(7 downto 0);
        rightArg : in  STD_LOGIC_VECTOR(7 downto 0);
        output   : out STD_LOGIC_VECTOR(8 downto 0)
    );
    END COMPONENT;
    
    COMPONENT displayController
    PORT(
        clk         : in  STD_LOGIC;
        input       : in  STD_LOGIC_VECTOR (8 downto 0);
        anodeSelect : out STD_LOGIC_VECTOR (3 downto 0);
        segments    : out STD_LOGIC_VECTOR (6 downto 0)
    );
    END COMPONENT;
    
    COMPONENT displayDelay
    PORT(
        clk    : in  STD_LOGIC;
        input  : in  STD_LOGIC_VECTOR (8 downto 0);
        output : out STD_LOGIC_VECTOR (8 downto 0)
    );
    END COMPONENT;

begin

    leftArg: argument PORT MAP(
        clk      => clk,
        input    => leftIn,
        display  => leftOut,
        output   => s_leftArg
    );
    
    rightArg: argument PORT MAP(
        clk      => clk,
        input    => rightIn,
        display  => rightOut,
        output   => s_rightArg
    );
    
    mainAdder: bitAdderWithCarry PORT MAP(
        leftArg  => s_leftArg,
        rightArg => s_rightArg,
        output   => s_answer
    );
    
    mainDelay: displayDelay PORT MAP(
        clk   => clk,
        input  => s_answer,
        output => s_toDisplay
    );
    
    mainDisplay: displayController PORT MAP(
        clk         => clk,
        input       => s_toDisplay,
        anodeSelect => an,
        segments    => seg
    );

end Behavioral;
