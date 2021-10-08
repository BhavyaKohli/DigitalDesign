library ieee;
use ieee.std_logic_1164.all;
library work;

use work.Gates.all;

entity MUX  is
  port (I: in std_logic_vector(1 downto 0); S: in std_logic; Y: out std_logic);
end entity  MUX;

architecture Struct of MUX is
  signal sc, a1, a0: std_logic;
	
begin
  -- component instances
  not0: INVERTER port map (A => S, Y => sc);
	
  and0: AND_2 port map (A => I(0), B => sc, Y => a0);
  and1: AND_2 port map (A => I(1), B => S, Y => a1);

  -- final sum.
  o1: OR_2 port map (A => a0, B => a1, Y => Y);
	
end Struct;
