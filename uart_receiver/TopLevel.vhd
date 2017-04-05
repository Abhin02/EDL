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
    debug1: out std_logic_vector(7 downto 0);
    CS, WE, OE: out std_logic;
    address: out std_logic_vector(14 downto 0);
    io: inout std_logic_vector(7 downto 0);
    output_data: out std_logic_vector(7 downto 0);
    read_data: in std_logic;
    sample_rate: in std_logic;
    sync_pulse: out std_logic;
    dac1: out std_logic;
    dac2: out std_logic
  );
end entity TopLevel;

architecture Mixed of TopLevel is
  signal data_ready: std_logic;
  signal clk_slow: std_logic := '0';
  signal uart_out: std_logic_vector(7 downto 0);
  signal output_signal: std_logic_vector(7 downto 0);
  signal old_output: std_logic_vector(7 downto 0);
  signal done: std_logic;
  signal sync_pulse_signal: std_logic;
  signal iq_sample: std_logic;
  signal dac: std_logic;
  signal clk_signal: std_logic;
begin
    clk_signal <= clk;
    dac1 <= clk_signal;
    dac2 <= not clk_signal;
    output_data <= output_signal;
    sync_pulse <= sync_pulse_signal;
    -- The process given below is used to output the synchronization pulse
    process(clk, output_signal, reset, done, sync_pulse_signal)
      variable nsync_pulse: std_logic;
      variable ndone: std_logic;
    begin
      nsync_pulse := sync_pulse_signal;
      ndone := done;
      if (old_output /= output_signal) then
        if done = '0' then
          nsync_pulse := '1';
          ndone := '1';
        else
          nsync_pulse := '0';
          ndone := '1';
        end if;
      else
        ndone := done;
        nsync_pulse := sync_pulse_signal;
      end if;
      if (clk'event and clk = '1') then
        if (reset = '1') then
          sync_pulse_signal <= '0';
          old_output <= (others => '0');
          done <= '0';
        else
          sync_pulse_signal <= nsync_pulse;
          old_output <= output_signal;
          done <= ndone;
        end if;
      end if;
    end process;

    clk_div: ClockDivider
    port map (
      reset => reset,
      clk => clk,
      clk_slow => clk_slow
    );

    process(clk, iq_sample, reset, dac)
      variable n_dac: std_logic := '0';
    begin
      n_dac := dac;
      if (iq_sample = '1') then
        n_dac := not n_dac;
      end if;
      if (clk'event and clk = '1') then
        if (reset = '1') then
          dac <= '0';
        else
          dac <= n_dac;
        end if;
      end if;
    end process;

    ram: SMC
    port map (
      io => io,
      output_data => output_signal,
      input_data => uart_out,
      OE => OE,
      WE => WE,
      CS => CS,
      address => address,
      clk => clk,
      reset => reset,
      read_data => read_data,
      data_ready => data_ready,
      debug => debug1,
      sample_rate => sample_rate,
      iq_sample => iq_sample
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