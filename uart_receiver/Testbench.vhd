library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

entity Testbench is
end entity;
architecture Behave of Testbench is
  component UARTReceiver is
  port (
    clk, reset: in std_logic;
    data_in: in std_logic;
    data_out: out std_logic_vector(7 downto 0)
  );
  end component;

  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal data_in: std_logic := '0';
  signal data_out: std_logic_vector(7 downto 0) := (others => '0');

  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin
      ret_val := lx;
      return(ret_val);
  end to_string;

  function to_std_logic_vector(x: bit_vector) return std_logic_vector is
    alias lx: bit_vector(1 to x'length) is x;
    variable ret_var : std_logic_vector(1 to x'length);
  begin
     for I in 1 to x'length loop
        if(lx(I) = '1') then
           ret_var(I) :=  '1';
        else
           ret_var(I) :=  '0';
  end if;
     end loop;
     return(ret_var);
  end to_std_logic_vector;

  function to_std_logic(x: bit) return std_logic is
      variable ret_val: std_logic;
  begin
      if (x = '1') then
        ret_val := '1';
      else
        ret_val := '0';
      end if;
      return(ret_val);
  end to_std_logic;

begin
  clk <= not clk after 104166.66 ns; -- assume 10ns clock.

  process
    variable err_flag : boolean := false;

  begin
    wait until clk = '1';
    reset <= '0';
    wait;
  end process;

  dut: UARTReceiver
  port map (
    clk => clk,
    reset => reset,
    data_in => data_in,
    data_out => data_out
  );
end Behave;