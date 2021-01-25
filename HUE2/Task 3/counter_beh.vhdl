library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
  port(
    CLK         : in   std_logic;
    RST         : in   std_logic;
    Enable      : in   std_logic; 
    SyncLoadInput   : in   std_logic;
    AsyncClear   : in   std_logic;
    Input       : in   std_logic_vector((6-1) downto 0);  
    Output      : out  std_logic_vector((6-1) downto 0)
  );
end counter;

architecture behavior of counter is

begin

p_counter: process (CLK, RST, Enable, SyncLoadInput, AsyncClear, Input)
variable v_count : integer := 0;

begin

if AsyncClear = '1' then
  v_count := 0;
elsif (rising_edge(CLK)) then
  if Enable = '1' then
  if RST = '1' then
        v_count := 0; -- value gets updated with next clk cycle
    elsif SyncLoadInput = '1' then
      v_count := To_integer(Unsigned(Input));
    else
      v_count := v_count + 1;
    end if;
  end if;
end if;

Output <= std_logic_vector(to_unsigned(v_count, Output'length));
      
end process p_counter;

end behavior;