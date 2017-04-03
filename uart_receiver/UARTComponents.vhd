library std;
library ieee;
use ieee.std_logic_1164.all;

package UARTComponents is

  -- Most documentation for components have been given with the
  -- entity specification.

  component DataRegister is
  generic (data_width:integer);
  port (Din: in std_logic_vector(data_width-1 downto 0);
        Dout: out std_logic_vector(data_width-1 downto 0);
        clk, enable, reset: in std_logic);
  end component DataRegister;

  component DataRegisterSp is
  generic (data_width:integer);
  port (Din: in std_logic_vector(data_width-1 downto 0);
        Dout: out std_logic_vector(data_width-1 downto 0);
        clk, enable, reset: in std_logic);
  end component DataRegisterSp;

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

  component IncrementBlock is
  generic (data_width:integer);
  port (
    input: in std_logic_vector(data_width-1 downto 0);
    output: out std_logic_vector(data_width-1 downto 0)
  );
  end component IncrementBlock;

  component UARTReceiver is
  port (
    clk, reset: in std_logic;
    -- This is a single bit input, the UART wave
    data_in: in std_logic;
    -- After decoding 10 bits, a byte is output on this port
    data_out: out std_logic_vector(7 downto 0);
    -- This port is for solely debugging purposes
    debug: out std_logic_vector(7 downto 0);
    -- A flag indicating a change in `data_out`
    data_ready: out std_logic
  );
  end component UARTReceiver;

  component UARTReceiverControl is
  port (
    -- This is a single bit input, the UART wave
    data_in: in std_logic;
    -- Takes in pulses from UARTTicker at half the baud period
    tick_half: in std_logic;
    -- Takes in pulses from UARTTicker at bad
    tick: in std_logic;
    -- Flag indicating that all 10 bits have been received
    received: in std_logic;
    clk, reset: in std_logic;
    -- Signals the Datapath to shift in another input
    -- It works like a shift register
    shift_in: out std_logic;
    -- A flag indicating a change in `data_out`
    data_ready: out std_logic;
    -- Signal to move shift register's bits to output port
    dout_enable: out std_logic;
    -- Signal to reset the UARTTicker back to 0
    tick_reset: out std_logic
  );
  end component;

  component UARTReceiverData is
  port (
    data_in: in std_logic;
    tick_half: out std_logic;
    tick: out std_logic;
    debug: out std_logic_vector(7 downto 0);
    received: out std_logic;
    clk, reset: in std_logic;
    shift_in: in std_logic;
    dout_enable: in std_logic;
    tick_reset: in std_logic;
    data_out: out std_logic_vector(7 downto 0)
  );
  end component;

  component SMC is
  port(
    io: inout std_logic_vector(7 downto 0);
    output_data: out std_logic_vector(7 downto 0);
    input_data: in std_logic_vector(7 downto 0);
    OE, WE, CS: out std_logic;
    address: out std_logic_vector(14 downto 0);
    clk, reset: in std_logic;
    read_data: in std_logic;
    sample_rate: in std_logic;
    data_ready: in std_logic;
    debug: out std_logic_vector(7 downto 0)
    );
  end component SMC;

  component SMCData is
  port(
    io: inout std_logic_vector(7 downto 0);
    output_data: out std_logic_vector(7 downto 0);
    input_data: in std_logic_vector(7 downto 0);
    OE, WE, CS: out std_logic;
    debug: out std_logic_vector(7 downto 0);
    write_wait: out std_logic;
    read_wait: out std_logic;
    address: out std_logic_vector(14 downto 0);
    clk, reset: in std_logic;
    -- The set of CS/OE/WE control signals in next clock cycle
    CONTROL_IN: in std_logic_vector(2 downto 0);
    addr_select: in std_logic_vector(2 downto 0);
    io_select, output_select, output_enable: in std_logic;
    write_addr_enable, read_addr_enable: in std_logic;
    limit_control: in std_logic_vector(5 downto 0);
    count: in std_logic_vector(2 downto 0)
  );
end component SMCData;

  component SMCControl is
  port(
    clk, reset: in std_logic;
    data_ready: in std_logic;
    read_data: in std_logic;
    sample_rate: in std_logic;
    -- The set of CS/OE/WE control signals in next clock cycle
    CONTROL_IN: out std_logic_vector(2 downto 0);
    write_wait: in std_logic;
    read_wait: in std_logic;
    addr_select: out std_logic_vector(2 downto 0);
    io_select, output_select, output_enable: out std_logic;
    write_addr_enable, read_addr_enable: out std_logic;
    limit_control: out std_logic_vector(5 downto 0);
    count: out std_logic_vector(2 downto 0)
  );
  end component SMCControl;

  component TopLevel is
  port (
    clk, reset: in std_logic;
    data_in: in std_logic;
    debug, debug1: out std_logic_vector(7 downto 0);
    CS, WE, OE: out std_logic;
    address: out std_logic_vector(14 downto 0);
    io: inout std_logic_vector(7 downto 0);
    output_data: out std_logic_vector(7 downto 0);
    read_data: in std_logic;
    sample_rate: in std_logic;
    sync_pulse: out std_logic
  );
  end component TopLevel;

  component ClockDivider is
    port (
        reset: in std_logic;
        clk: in std_logic;
        clk_slow: out std_logic
    );
  end component ClockDivider;

end package;

-- The vanilla data register
-- When `reset` it high, it pushes all zeros to output
library ieee;
use ieee.std_logic_1164.all;
entity DataRegister is
  generic (data_width:integer);
  port (
    Din: in std_logic_vector(data_width-1 downto 0);
    Dout: out std_logic_vector(data_width-1 downto 0);
    clk, enable, reset: in std_logic
  );
end entity;
architecture Behave of DataRegister is
begin
  process(clk)
  begin
    -- This creates a latch
    if(clk'event and (clk  = '1')) then
      if (reset = '1') then
        Dout <= (others => '0');
      elsif(enable = '1') then
        Dout <= Din;
      end if;
    end if;
  end process;
end Behave;

-- A special data register
-- When `reset` it high, it pushes all ones to output
library ieee;
use ieee.std_logic_1164.all;
entity DataRegisterSp is
  generic (data_width:integer);
  port (
    Din: in std_logic_vector(data_width-1 downto 0);
    Dout: out std_logic_vector(data_width-1 downto 0);
    clk, enable, reset: in std_logic
  );
end entity;
architecture Behave of DataRegisterSp is
begin
  process(clk)
  begin
    if(clk'event and (clk  = '1')) then
      if (reset = '1') then
        Dout <= (others => '1');
      elsif(enable = '1') then
        Dout <= Din;
      end if;
    end if;
  end process;
end Behave;

-- A generic increment block that adds 1
-- It treats inputs as unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity IncrementBlock is
generic (data_width:integer);
port (
  input: in std_logic_vector(data_width-1 downto 0);
  output: out std_logic_vector(data_width-1 downto 0)
);
end entity IncrementBlock;
architecture Behave of IncrementBlock is
begin
  output <= std_logic_vector(unsigned(input) + 1);
end Behave;

-- This is a clock divider that divides input clock by 2
library ieee;
use ieee.std_logic_1164.all;
entity ClockDivider is
    port (
        reset: in std_logic;
        clk: in std_logic;
        clk_slow: out std_logic
    );
end entity ClockDivider;
architecture RTL of ClockDivider is
  -- Two states are needed for this FSM
  -- States are alternated after every clock cycle
  -- S0 denotes current `clk_slow` value is 0
  -- S1 denotes current `clk_slow` value is 1
  type FsmState is (S0, S1);
  signal state : FsmState;
begin
    process(clk, reset, state)
      variable nstate: FsmState;
      variable nclk_slow: std_logic;
    begin
      nstate := S0;
      nclk_slow := '0';
      case state is
      when S0 =>
        nstate := S1;
        nclk_slow := '1';
      when S1 =>
        nstate := S0;
        nclk_slow := '0';
      end case;

      clk_slow <= nclk_slow;

      if (clk'event and clk = '1') then
        if (reset = '1') then
          state <= S0;
        else
          state <= nstate;
        end if;
      end if;
    end process;
end RTL;
