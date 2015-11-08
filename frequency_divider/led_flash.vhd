----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:13 11/06/2015 
-- Design Name: 
-- Module Name:    led_flash - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_flash is
    Port ( btn : in  STD_LOGIC;
           led : out  STD_LOGIC;
           clk_in : in  STD_LOGIC);
end led_flash;

architecture Behavioral of led_flash is
  -- System Library Components
  component IBUFG
    port (
      I : in STD_LOGIC;
      O : out STD_LOGIC);
  end component;

  component clk_1
    port (
      clk_in : in STD_LOGIC;
      reset  : in STD_LOGIC;
      clk_out : out STD_LOGIC);
    end component;

	signal reset : STD_LOGIC;
--	signal led_out : STD_LOGIC;
--	signal clk_in : STD_LOGIC;
begin

  U1: IBUFG port map ( I => btn, O => reset );
  U2: clk_1 port map ( clk_in => clk_in, reset => reset, clk_out => led );
  
end Behavioral;

