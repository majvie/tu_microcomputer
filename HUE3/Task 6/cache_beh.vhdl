library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behavior of cache is

constant CACHE_LENGTH : integer := 21;
type array_t is array (integer range <>) of std_logic_vector (10-1 downto 0);

begin

process(clk, addr, en_read)

variable memory : array_t (0 to CACHE_LENGTH-1);

variable input_index : integer;
variable input_tag : integer;
variable current_tag : integer;

begin

-- Hardcoding the memory for simplicity
memory(0) := "1111001010";
memory(1) := "1111001110";
memory(2) := "1011001111";
memory(3) := "1010011100";
memory(4) := "1001001101";
memory(5) := "1001000101";
memory(6) := "1100010001";
memory(7) := "1011010100";
memory(8) := "1000011100";
memory(9) := "1010110001";
memory(10) := "1110011001";
memory(11) := "1011110101";
memory(12) := "1011000111";
memory(13) := "1111000000";
memory(14) := "1101010100";
memory(15) := "1111010111";
memory(16) := "1011000111";
memory(17) := "1011010100";
memory(18) := "1111111100";
memory(19) := "1101100110";
memory(20) := "1101010100";
---

if (falling_edge(clk)) then
    
    input_index := to_integer(unsigned(addr(4 downto 0)));
    input_tag := to_integer(unsigned(addr(7 downto 5)));
    
    -- Checking size
    if (input_index > CACHE_LENGTH-1 or en_read = '0') then
    	data <= (others => 'Z');
        ch_cm <= '0';
    else
    
      -- Trying to read
      current_tag := to_integer(unsigned(memory(input_index)(9 downto 7)));
      if (current_tag = input_tag) then
          data <= memory(input_index)(6 downto 0);
          ch_cm <= '1';
      else
          data <= (others => 'Z');
          ch_cm <= '0';
      end if;	
    end if;
end if;
    
end process;

end behavior;