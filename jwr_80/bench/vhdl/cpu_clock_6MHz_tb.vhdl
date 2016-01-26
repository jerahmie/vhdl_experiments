library ieee;
use ieee.std_logic_1164.all;

entity clk_6MHz_tb is
end clk_6MHz_tb;

architecture behavioral of clk_6MHz_tb is
  component cpu_clock_6MHz
    port(
      clk_in : in std_logic;
      reset : in std_logic;
      clk_out : out std_logic);
  end component;

  -- Inputs
  signal clk_in : std_logic := '0';
  signal reset : std_logic := '0';
  -- Ouputs
  signal clk_out : std_logic;
  constant clk_in_t : time := 20 ns;    -- 50 MHz clock period
    
begin
  -- Instance of unit under test
  uut: cpu_clock_6MHz port map(
    clk_in => clk_in,
    reset => reset,
    clk_out => clk_out
    );
  
  -- Clock definition
  clock_process : process
    begin
      clk_in <= '0';
      wait for clk_in_t / 2;
      clk_in <= '1';
      wait for clk_in_t / 2;
    end process;
  
  -- Processing
  stimuli : process
    begin
      reset <= '1';  
      wait for 100 ns;
      reset <= '0';
      wait;
    end process;
end behavioral;
