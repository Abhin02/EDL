library std;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.UARTComponents.all;
entity TopLevel is
  port (
    clk, reset: in std_logic;
    data_in: in std_logic;
    debug: out std_logic_vector(7 downto 0);
    CS, WE, OE: out std_logic;
    address: out std_logic_vector(14 downto 0);
    io: inout std_logic_vector(7 downto 0);
    output_data: out std_logic_vector(7 downto 0);
    read_data: in std_logic
  );
end entity TopLevel;

architecture Mixed of TopLevel is
  signal data_ready: std_logic;
  signal uart_out: std_logic_vector(7 downto 0);
begin
    ram: SMC
    port map (
      io => io,
      output_data => output_data,
      input_data => uart_out,
      OE => OE,
      WE => WE,
      CS => CS,
      address => address,
      clk => clk,
      reset => reset,
      read_data => read_data,
      data_ready => data_ready
    );

    uart: UARTReceiver
    port map (
      clk => clk,
      reset => reset,
      data_in => data_in,
      data_out => uart_out,
      debug => debug,
      data_ready => data_ready
    );

end Mixed;