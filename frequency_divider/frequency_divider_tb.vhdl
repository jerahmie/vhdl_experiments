library ieee;
use ieee.std_logic_1164.all;

entity clk1_tb is
end clk1_tb;
  
architecture behavior of clk1_tb is
  component clk_1
    port(
      clk_in : in STD_LOGIC;
      reset : in STD_LOGIC;
      clk_out : out STD_LOGIC
      );
    end component;

  -- Inputs
  signal clk_in : STD_LOGIC := '0';
  signal reset : STD_LOGIC := '0';
  -- Outputs
  signal clk_out : std_logic;
  constant clk_in_t : time := 20 ns;

begin
  -- Instance of unit under test
  uut: clk_1 port map (
    clk_in => clk_in,
    reset => reset,
    clk_out => clk_out
    );

  -- Clock definition
  entrada_process : process
    begin
      clk_in <= '0';
      wait for clk_in_t / 2;
      clk_in <= '1';
      wait for clk_in_t /2;
    end process;

    -- Processing.
    stimuli: process
      begin
        reset <= '1';                   -- Initial conditions
        wait for 100 ns;
        reset <= '0';
        wait;
    end process;
end;
