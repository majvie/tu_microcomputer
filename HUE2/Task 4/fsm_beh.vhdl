library IEEE;
use IEEE.std_logic_1164.all;
use work.fsm_pkg.all;

entity fsm is
    port(   
            CLK     : in    std_logic;
            INPUT   : in    std_logic_vector(1 downto 0);
            RST     : in    std_logic := '1';
            OUTPUT  : out   std_logic_vector(1 downto 0);
            STATE   : out   fsm_state
        );
end fsm; 

architecture behavior of fsm is

begin

p_comb: process (CLK, INPUT, RST)

variable state_t : fsm_state := START;

begin
 if (rising_edge(CLK)) then
    -- Includes initial condition
    if RST = '1' then
        state_t := START;
        STATE <= START;
        OUTPUT <= "00";
    else
    
    case state_t is 
        when START =>
            if INPUT = "01" then
                OUTPUT <= "01";
                STATE <= S0;
                state_t := S0;
            end if;
        when S0 =>
            if INPUT = "01" then
                OUTPUT <= "01";
                state_t := S1;
                STATE <= S1;
            elsif INPUT = "11" then
                OUTPUT <= "01";
                STATE <= S2;
                state_t := S2;
            else 
                OUTPUT <= "00";
                STATE <= S0;
            end if;
        when S1 =>
            if INPUT = "00" then
                OUTPUT <= "01";
                STATE <= S1;
            elsif INPUT = "10" then
                OUTPUT <= "00";
                state_t := S2;
                STATE <= S2;
            else 
                OUTPUT <= "00";
                STATE <= S1;
            end if;
        when S2 =>
            if INPUT = "11" then
                OUTPUT <= "11";
                state_t := S0;
                STATE <= S0;
            else 
                OUTPUT <= "00";
                STATE <= S2;
            end if;
    end case;
    end if;
 end if;
      
end process p_comb;

end behavior;
