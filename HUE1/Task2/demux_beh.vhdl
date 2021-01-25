library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavior of demux is

begin

with SEL select OUT1 <= IN1 when "000",
						"000000" when others;
with SEL select OUT2 <= IN1 when "001",
						"000000" when others;
with SEL select OUT3 <= IN1 when "010",
						"000000" when others;
with SEL select OUT4 <= IN1 when "011",
						"000000" when others;
with SEL select OUT5 <= IN1 when "100",
						"000000" when others;

end behavior;