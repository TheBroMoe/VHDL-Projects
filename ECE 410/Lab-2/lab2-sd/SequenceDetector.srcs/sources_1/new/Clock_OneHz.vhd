----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2018 02:59:44 PM
-- Design Name: 
-- Module Name: Clock_OneHz - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_OneHz is
    Port ( clk : in STD_LOGIC;
           clk_1Hz : out STD_LOGIC);
end Clock_OneHz;

architecture Behavioral of Clock_OneHz is
signal count: unsigned (31 downto 0) := x"00000000";
signal clk_out: std_logic:='0';
begin
    process(clk)
    begin
        if clk'event and clk='1' then
            if(count<40000000) then       --2000000000
                count<=count+1;
--                clk_1Hz<='0';
            else
                count<=(others=>'0');
                clk_out<=not clk_out;
                clk_1Hz<=clk_out;
--                clk_1Hz<='1';
            end if;
        end if;
    
    end process;
    
--    process (clk)
--        begin
--        if clk = '1' and clk'event then
--            if(count<200000000) then       
--                count <= count+1;
--                clock_out<= '0';
--            else
--                count<=(others=>'0');
--                clock_out<= '1';
--            end if;
--            clk_out<=clock_out;
--        end if;
        
end Behavioral;
