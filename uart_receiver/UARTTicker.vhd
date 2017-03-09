library ieee;
use ieee.std_logic_1164.all;
library work;
use work.UARTComponents.all;
entity UARTTicker is
  port (
    clk, reset: in std_logic;
    tick: out std_logic;
    tick_half: out std_logic;
    tick_reset: in std_logic
  );
end entity UARTTicker;

architecture Struct of UARTTicker is
  signal limit1, limit2, increment: std_logic;
begin

  CP: UARTTickerControl
  port map (
    limit1 => limit1,
    limit2 => limit2,
    increment => increment,
    tick => tick,
    tick_reset => tick_reset,
    reset => reset,
    clk => clk
  );

  DP: UARTTickerData
  port map (
    limit1 => limit1,
    limit2 => limit2,
    increment => increment,
    reset => reset,
    tick_half => tick_half,
    clk => clk
  );
end Struct;

library ieee;
use ieee.std_logic_1164.all;
entity UARTTickerControl is
  port (
    -- These are signals to the datapath
    increment: out std_logic;
    -- These signals are from the datapath
    limit1, limit2: in std_logic;
    clk, reset: in std_logic;
    tick_reset: in std_logic;
    tick: out std_logic
  );
end entity;
architecture Behave of UARTTickerControl is
  type FsmState is (S0, S1, S2, S3, S4);
  signal state : FsmState;
begin
  -- This process decides the control signals
  process(state, limit1, limit2, reset)
    variable nincrement: std_logic;
    variable ntick: std_logic;
  begin
    nincrement := '0';
    ntick := '0';
    case state is
      when S0 =>
        nincrement := '1';
        ntick := '0';
      when S1 =>
        if limit1 = '1' then
          nincrement := '0';
          ntick := '1';
        else
          nincrement := '1';
          ntick := '0';
        end if;
      when S2 =>
        if limit1 = '1' then
          nincrement := '0';
          ntick := '1';
        else
          nincrement := '1';
          ntick := '0';
        end if;
      when S3 =>
        if limit2 = '1' then
          nincrement := '0';
          ntick := '1';
        else
          nincrement := '1';
          ntick := '0';
        end if;
      when S4 =>
        nincrement := '0';
        ntick := '0';
    end case;

    if reset = '1' then
      increment <= '0';
      tick <= '0';
    else
      increment <= nincrement;
      tick <= ntick;
    end if;
  end process;
  -- This process decides the next state of FSM
  process(state, clk, reset, limit1, limit2, tick_reset)
    variable nstate: FsmState;
  begin
    nstate := S0;
    case state is
      when S0 =>
        -- In this state, the counters are reset
        nstate := S1;
      when S1 =>
        -- In this state, the counter increments to limit1
        if limit1 = '1' then
          nstate := S2;
        else
          nstate := S1;
        end if;
      when S2 =>
        -- In this state, the counter increments to limit1
        if limit1 = '1' then
          nstate := S3;
        else
          nstate := S2;
        end if;
      when S3 =>
        -- In this state, the counter increments to limit2
        if limit2 = '1' then
          nstate := S0;
        else
          nstate := S3;
        end if;
      when S4 =>
        -- tick reset stage
        nstate := S0;
    end case;
    if tick_reset = '1' then
      nstate := S4;
    end if;
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
library work;
use work.UARTComponents.all;
entity UARTTickerData is
  port (
    increment: in std_logic;
    limit1, limit2: out std_logic;
    tick_half: out std_logic;
    clk, reset: in std_logic
  );
end entity;

architecture Mixed of UARTTickerData is
  -- The values of 50000000/9600 - 1 and 50000000/9600 + 1 - 1
  signal L1: std_logic_vector(12 downto 0) := "1010001010111";
  signal L2: std_logic_vector(12 downto 0) := "1010001011000";
  --signal L1: std_logic_vector(12 downto 0) := "0101000101011";
  --signal L2: std_logic_vector(12 downto 0) := "0101000101100";
  --signal HALF: std_logic_vector(12 downto 0) := "0010100010110";
  signal HALF: std_logic_vector(12 downto 0) := "0101000101100";
  signal CONST_0: std_logic_vector(12 downto 0) := (others => '0');

  signal COUNT: std_logic_vector(12 downto 0);
  signal COUNT_in: std_logic_vector(12 downto 0);
  signal INC_OUT: std_logic_vector(12 downto 0);

  signal count_enable: std_logic;
begin
    -- predicate
  limit1 <= '1' when (COUNT = L1) else '0';
  limit2 <= '1' when (COUNT = L2) else '0';
  tick_half <= '1' when (COUNT = HALF) else '0';

  incr: Increment13 port map (input => COUNT, output => INC_OUT);

  count_enable <= '1';
  COUNT_in <= INC_OUT when increment = '1' else CONST_0;
  count_reg: DataRegister
            generic map (data_width => 13)
            port map (Din => COUNT_in,
                      Dout => COUNT,
                      Enable => count_enable,
                      reset => reset,
                      clk => clk);
end Mixed;