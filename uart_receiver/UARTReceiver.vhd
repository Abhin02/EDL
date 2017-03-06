library std;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.UARTComponents.all;
entity UARTReceiver is
  port (
    clk, reset: in std_logic;
    data_in: in std_logic;
    data_out: out std_logic_vector(7 downto 0);
    debug: out std_logic_vector(7 downto 0);
    data_ready: out std_logic
  );
end entity UARTReceiver;

architecture Struct of UARTReceiver is
  signal shift_in, tick_reset, tick_half, tick, received: std_logic;
  signal data_ready_signal: std_logic;
  signal clk_slow: std_logic;
begin
  data_ready <= data_ready_signal;
  cl: ClockDivider
  port map (
    clk => clk,
    reset => reset,
    clk_slow => clk_slow
  );
  CP: UARTReceiverControl
  port map (
    data_in => data_in,
    tick_half => tick_half,
    tick => tick,
    reset => reset,
    clk => clk,
    shift_in => shift_in,
    data_ready => data_ready_signal,
    tick_reset => tick_reset,
    received => received
  );

  DP: UARTReceiverData
  port map (
    reset => reset,
    debug => debug,
    tick_half => tick_half,
    tick => tick,
    clk => clk,
    shift_in => shift_in,
    data_ready => data_ready_signal,
    tick_reset => tick_reset,
    data_out => data_out,
    data_in => data_in,
    received => received
  );
end Struct;


library ieee;
use ieee.std_logic_1164.all;
use work.UARTComponents.all;
entity UARTReceiverControl is
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
end entity;
architecture Behave of UARTReceiverControl is
  type FsmState is (S0, S1, S2, S3, S4);
  signal state : FsmState;
begin
  -- This process decides the control signals
  process(state, reset, data_in, tick_half, tick, received)
    variable nshift_in: std_logic;
    variable ndata_ready: std_logic;
    variable ntick_reset: std_logic;
  begin
    nshift_in := '0';
    ndata_ready := '0';
    ntick_reset := '0';
    case state is
      when S0 =>
        nshift_in := '0';
        ndata_ready := '0';
        ntick_reset := '0';
      when S1 =>
        nshift_in := '0';
        ndata_ready := '0';
        if data_in = '1' then
          -- Since we want to start the ticker
          ntick_reset := '1';
        else
          ntick_reset := '0';
        end if;
      when S2 =>
        ndata_ready := '0';
        if tick_half = '1' then
          nshift_in := '1';
          ntick_reset := '1';
        else
          nshift_in := '0';
          ntick_reset := '0';
        end if;
      when S3 =>
        if received = '1' and tick = '1' then
          ndata_ready := '0';
          nshift_in := '1';
          ntick_reset := '1';
        elsif received = '0' and tick = '1' then
          ndata_ready := '0';
          nshift_in := '1';
          ntick_reset := '1';
        else
          ndata_ready := '0';
          nshift_in := '0';
          ntick_reset := '0';
        end if;
      when S4 =>
        ndata_ready := '1';
        nshift_in := '0';
        ntick_reset := '1';
    end case;

    if reset = '1' then
      shift_in <= '0';
      data_ready <= '0';
      -- This has been done since we want to feedforward tick reset
      tick_reset <= '1';
    else
      shift_in <= nshift_in;
      data_ready <= ndata_ready;
      tick_reset <= ntick_reset;
    end if;
  end process;

  -- This process decides the next state of FSM
  process(state, clk, reset, data_in, tick_half, tick, received)
    variable nstate: FsmState;
  begin
    nstate := S0;
    case state is
      when S0 =>
        -- This is the reset state
        nstate := S1;
      when S1 =>
        -- In this state, the receiver waits for UART
        if data_in = '0' then
          -- Received an input, begin UART sequence
          nstate := S2;
        else
          nstate := S1;
        end if;
      when S2 =>
        -- In this state, the counter increments till it hits T/2
        -- This is done for clock synchronization
        if tick_half = '1' then
          nstate := S3;
        else
          nstate := S2;
        end if;
      when S3 =>
        -- In this state, the counter samples every T seconds
        if tick = '1' and received = '1' then
          nstate := S4;
        else
          nstate := S3;
        end if;
      when S4 =>
        nstate := S1;
    end case;
    -- Creating the latch
    if (clk'event and clk = '1') then
      if (reset = '1') then
        state <= S0;
      else
        state <= nstate;
      end if;
    end if;
  end process;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
use work.UARTComponents.all;
entity UARTReceiverData is
  port (
    data_in: in std_logic;
    tick_half: out std_logic;
    debug: out std_logic_vector(7 downto 0);
    tick: out std_logic;
    received: out std_logic;
    clk, reset: in std_logic;
    shift_in: in std_logic;
    data_ready: in std_logic;
    tick_reset: in std_logic;
    data_out: out std_logic_vector(7 downto 0)
  );
end entity;

architecture Mixed of UARTReceiverData is
  signal SHIFT_OUT: std_logic_vector(9 downto 0);
  signal SHIFT: std_logic_vector(9 downto 0);
  signal COUNT_IN: std_logic_vector(3 downto 0);
  signal COUNT: std_logic_vector(3 downto 0);
  signal INC_OUT: std_logic_vector(3 downto 0);
  signal CONST_0: std_logic_vector(3 downto 0) := "0000";
  -- Taken as 9 since UART is assumed to have no parity bit
  signal LIMIT: std_logic_vector(3 downto 0) := "1001";
  signal count_enable: std_logic;
begin
  tc: UARTTicker
      port map (
        clk => clk,
        reset => reset,
        tick => tick,
        tick_half => tick_half,
        tick_reset => tick_reset
      );

  incr: Increment4 port map (input => COUNT, output => INC_OUT);
  COUNT_in <= CONST_0 when (COUNT = LIMIT) else INC_OUT;

  received <= '1' when (COUNT = LIMIT) else '0';
  count1: DataRegister
           generic map (data_width => 4)
           port map (Din => COUNT_IN,
                     Dout => COUNT,
                     Enable => shift_in,
                     reset => reset,
                     clk => clk);
  debug(7 downto 0) <= SHIFT_OUT(8 downto 1);
  shift_r: DataRegister
           generic map (data_width => 10)
           port map (Din => SHIFT,
                     Dout => SHIFT_OUT,
                     Enable => shift_in,
                     reset => reset,
                     clk => clk);

  dout: DataRegister
        generic map (data_width => 8)
        port map (Din => SHIFT_OUT(8 downto 1),
                  Dout => data_out,
                  Enable => data_ready,
                  reset => reset,
                  clk => clk);
  SHIFT(8 downto 0) <= SHIFT_OUT(9 downto 1);
  SHIFT(9) <= data_in;

end Mixed;