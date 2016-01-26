-------------------------------------------------------------------------------
-- cpu_clock_6MHz.vhd
-- Generates the cpu clock from D2 10 MHz clock
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpu_clock_6MHz is
  port ( clk_in : in std_logic;
         reset : in std_logic;
         clk_out : out std_logic);
end cpu_clock_6MHz;

architecture behavioral of cpu_clock_6MHz is
  signal temporal : std_logic := '0';
  -- signal d, dInc, dN : std_logic_vector(27 downto 0);
  signal d, dInc, dN : integer;

begin  
  -- counter process
  count1: process(d)
    begin
      if (d < 0) then
        dInc <= 6;
      else
        dInc <= 6-25;
      end if;
    end process;

  dN <= d + dInc;

  frequency_divider : process(reset, clk_in)
    begin
      if reset = '1' then
			temporal <= '0';
			d <= 6-50;
		elsif rising_edge(clk_in) then
			d <= dN;
			if (d >= 0) then
				temporal <= not(temporal);
			end if;
      end if;
    end process;
    clk_out <= temporal;
	 
end behavioral;
