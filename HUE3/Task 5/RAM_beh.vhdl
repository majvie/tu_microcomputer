library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

architecture Behavioral of RAM is

--subtype word_t is std_logic_vector(9 downto 0) := (others => '0'); ; -- Einzelnes Datum
--type array_t is array(11 downto 0) of word_t; -- Adressen

type RAM is array (integer range <>) of std_logic_vector (10-1 downto 0);
signal memory : RAM (0 to 12-1) := (others=>(others=>'0'));


--signal memory : array_t; -- Instanzierung von memory

begin

process(clk, addr1, addr2, input, output)

variable addr1_v : integer;
variable addr2_v : integer;

begin
if (rising_edge(clk)) then
  addr1_v := to_integer(unsigned(addr1));
    addr2_v := to_integer(unsigned(addr2));
    
    -- Checking validity of input
    if (addr1_v > 5 or addr2_v > 5) then
      output <= (others => 'Z');
    elsif (en_read = '0' and en_write = '0') then 
      output <= (others => 'Z');
        
    else
    
      -- Read
      if (en_read = '1') then
          output(9 downto 0) <= memory(2*addr2_v);
          output(19 downto 10) <= memory(2*addr2_v+1);

      -- Write
      elsif (en_write = '1') then
          output <= (others => 'Z');
          memory(2*addr1_v) <= input(9 downto 0);
          memory(2*addr1_v+1) <= input(19 downto 10);
      end if;
    
    end if;
end if;
    
end process;

end Behavioral;