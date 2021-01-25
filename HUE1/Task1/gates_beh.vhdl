library IEEE;
use IEEE.std_logic_1164.all;
use work.IEEE_1164_Gates_pkg.all;

architecture behavior of gates is

signal wire0, wire1, wire2, wire3, wire4 : std_ulogic;
   
begin

G3: XOR3 port map (
    I1 => A,
    I2 => not B,
    I3 => not D,
    O => wire3
);

G2: AND2 port map (
    I1 => C,
    I2 => D,
    O => wire2
);

G1: AND2 port map (
    I1 => C,
    I2 => not D,
    O => wire1
);

G0: AND2 port map (
    I1 => B,
    I2 => C,
    O => wire0
);

G4: XOR4 port map (
    I1 => not wire3,
    I2 => wire2,
    I3 => not wire1,
    I4 => wire0,
    O => wire4
);

O <= NOT(wire4);

end behavior;

