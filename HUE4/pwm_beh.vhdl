library IEEE;
use IEEE.std_logic_1164.all;

architecture behavior of pwm is

begin

process(CLK)

variable counter : integer := 0;

begin 

if (rising_edge(CLK)) then 
	-- CLK mit frequenz 50 MHz = 20 ns T
    O <= '1';
    
    -- Nach 5000 Clock Cycles * Lastzyklus switch
    -- PWM mit T = 100ms, f = 10 kHz, duty cycle 44%
    if (counter = 5000) then
        counter := 0;
    -- (5000*0.44) = 2200
    elsif (counter > 2200) then
    	O <= '0';
    end if;
    
    counter := counter + 1;

end if;

end process;

end behavior;
