library std;
library ieee;
use ieee.std_logic_1164.all;

package UARTComponents is

  component DataRegister is
  generic (data_width:integer);
  port (Din: in std_logic_vector(data_width-1 downto 0);
        Dout: out std_logic_vector(data_width-1 downto 0);
        clk, enable, reset: in std_logic);
  end component DataRegister;

  component UARTTicker is
  port (
    clk, reset: in std_logic;
    tick: out std_logic;
    tick_reset: in std_logic;
    tick_half: out std_logic
  );
  end component;
  component UARTTickerData is
    port (
      increment: in std_logic;
      limit1, limit2: out std_logic;
      tick_half: out std_logic;
      clk, reset: in std_logic
    );
  end component;
  component UARTTickerControl is
    port (
      -- These are signals to the datapath
      increment: out std_logic;
      -- These signals are from the datapath
      limit1, limit2: in std_logic;
      clk, reset: in std_logic;
      tick: out std_logic;
      tick_reset: in std_logic
    );
  end component;

  component Increment13 is
  port (
    input: in std_logic_vector(12 downto 0);
    output: out std_logic_vector(12 downto 0)
  );
  end component Increment13;

  component Increment4 is
  port (
    input: in std_logic_vector(3 downto 0);
    output: out std_logic_vector(3 downto 0)
  );
  end component Increment4;

  component UARTReceiver is
  port (
    clk, reset: in std_logic;
    data_in: in std_logic;
    data_out: out std_logic_vector(7 downto 0)
  );
  end component UARTReceiver;

  component UARTReceiverControl is
  port (
    data_in: in std_logic;
    tick_half: in std_logic;
    tick: in std_logic;
    received: in std_logic;
    clk, reset: in std_logic;
    shift_in: out std_logic;
    data_ready: out std_logic;
    tick_reset: out std_logic
  );
  end component;

  component UARTReceiverData is
  port (
    data_in: in std_logic;
    tick_half: out std_logic;
    tick: out std_logic;
    received: out std_logic;
    clk, reset: in std_logic;
    shift_in: in std_logic;
    data_ready: in std_logic;
    tick_reset: in std_logic;
    data_out: out std_logic_vector(7 downto 0)
  );
  end component;


end package;

library ieee;
use ieee.std_logic_1164.all;
entity DataRegister is
  generic (data_width:integer);
  port (Din: in std_logic_vector(data_width-1 downto 0);
        Dout: out std_logic_vector(data_width-1 downto 0);
        clk, enable, reset: in std_logic);
end entity;
architecture Behave of DataRegister is
begin
  process(clk)
  begin
    if(clk'event and (clk  = '1')) then
      if (reset = '1') then
        Dout <= (others => '0');
      elsif(enable = '1') then
        Dout <= Din;
      end if;
    end if;
  end process;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Increment13 is
port (
  input: in std_logic_vector(12 downto 0);
  output: out std_logic_vector(12 downto 0)
);
end entity Increment13;
architecture Behave of Increment13 is
begin
  output <= std_logic_vector(unsigned(input) + 1);
end Behave;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Increment4 is
port (
  input: in std_logic_vector(3 downto 0);
  output: out std_logic_vector(3 downto 0)
);
end entity Increment4;
architecture Behave of Increment4 is
begin
  output <= std_logic_vector(unsigned(input) + 1);
end Behave;
