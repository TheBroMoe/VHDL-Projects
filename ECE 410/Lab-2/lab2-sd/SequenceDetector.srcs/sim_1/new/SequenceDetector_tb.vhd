----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2018 09:40:08 AM
-- Design Name: 
-- Module Name: SequenceDetector_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SequenceDetector_tb is
--  Port ( );
end SequenceDetector_tb;

architecture Behavioral of SequenceDetector_tb is

component SequenceDetector is
    Port
    (
        clk     : in STD_LOGIC;
        Data_In : in STD_LOGIC;              --swt(0) as Data_In
        Clk_Btn : in STD_LOGIC;              --btn(0) used as clock
        sw      : in STD_LOGIC_VECTOR(3 DOWNTO 0);
        led6_r  : out STD_LOGIC;
        led     : out STD_LOGIC_VECTOR (3 DOWNTO 0)      
    );
end component;

component clock_divider is
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

signal clk,Data_In,Clk_Btn, clk_out: STD_LOGIC;
signal led6_r: STD_LOGIC;
signal led: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal sw: STD_LOGIC_VECTOR(3 DOWNTO 0);

constant clock_period: time:=500ps;



begin
    sd1: SequenceDetector Port Map
         (
            clk=>clk,
            Data_In=>Data_In,
            Clk_Btn=>Clk_Btn,
            sw=>sw,
            led6_r=>led6_r,
            led=>led      
         );
   divider: clock_divider port map(   
            clk=>clk,
            reset=>'0',
            clk_out=>clk_out
        );
            
   clock: process
          begin
                    clk <='0';
                    wait for clock_period/2;
                    clk <='1';
                    wait for clock_period/2;
          end process;
    
    simulation: process
    begin
    --Sequence "01101"    
        wait for 1.5ns;
--        Data_In<='0';           --Data bit='0'
--        wait for 3 ns;

--        Data_In<='1';           --Data bit='1'
--        wait for 3 ns;
        
--        Data_In<='1';           --Data bit='1'
--        wait for 3 ns;

--        Data_In<='0';           --Data bit='0'
--        wait for 3 ns;

--        Data_In<='1';           --Data bit='0'
--        wait for 3 ns;

    --Sequence "1010011"    
        Data_In<='1';           --Data bit='1'
        wait for 3 ns;


        Data_In<='0';           --Data bit='0'
        wait for 3 ns;


        Data_In<='1';           --Data bit='1'
        wait for 3 ns;

        Data_In<='0';           --Data bit='0'
        wait for 3 ns;

        Data_In<='0';           --Data bit='0'
        wait for 3 ns;

        Data_In<='1';           --Data bit='1'
        wait for 3 ns;

        Data_In<='1';           --Data bit='1'
        wait for 3 ns;

        Data_In<='0';           --Data bit='0' (Go to S0)
        wait for 3 ns;

        
    end process;
    
end Behavioral;
