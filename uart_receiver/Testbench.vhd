library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;

entity Testbench is
end entity;
architecture Behave of Testbench is
  component TopLevel is
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
  end component TopLevel;

  signal clk, clk2: std_logic := '0';
  signal reset: std_logic := '1';
  signal data_in: std_logic := '1';
  signal CS: std_logic := '1';
  signal WE: std_logic := '1';
  signal OE: std_logic := '1';
  signal read_data: std_logic := '0';
  signal address: std_logic_vector(14 downto 0) := (others => '0');
  signal io: std_logic_vector(7 downto 0) := (others => 'Z');
  signal output_data: std_logic_vector(7 downto 0) := (others => '0');

  signal data_out: std_logic_vector(7 downto 0) := (others => '0');
  signal debug: std_logic_vector(7 downto 0) := (others => '0');

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
  clk2 <= not clk2 after 52083.33 ns; -- assume 10ns clock.
  clk <= not clk after 10 ns;
  process
    File INFILE: text open read_mode is "UART_Test.txt";
    variable input_vector1: bit_vector (0 downto 0) := "0";
    variable INPUT_LINE: Line;
    variable err_flag : boolean := false;

  begin
    wait until clk2 = '1';
    reset <= '0';
     while not endfile(INFILE) loop
      wait until clk2 = '1';
      readLine (INFILE, INPUT_LINE);
      read (INPUT_LINE, input_vector1);
      data_in <= to_stdlogicvector(input_vector1)(0);
      wait until clk2 = '0';
    end loop;
  end process;

  dut: TopLevel
  port map (
    clk => clk,
    reset => reset,
    data_in => data_in,
    CS => CS,
    OE => OE,
    WE => WE,
    debug => debug,
    address => address,
    io => io,
    output_data => output_data,
    read_data => read_data
  );
end Behave;