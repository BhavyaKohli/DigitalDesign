library ieee;
use ieee.std_logic_1164.all;
library work;

use work.Gates.all;

entity MUX  is
  port (I: in std_logic_vector(5 downto 0); Y: out std_logic);
end entity  MUX;

architecture Struct of MUX is
  signal s1c, s0c, a3, a2, a1, a0: std_logic;
	
begin
  -- component instances
  not1: INVERTER port map (A => I(1), Y => s1c);
	not0: INVERTER port map (A => I(0), Y => s0c);
	
  and0: AND_3 port map (A => I(2), B => s1c, C => s0c, Y => a0);
  and1: AND_3 port map (A => I(3), B => s1c, C => I(0), Y => a1);
	and2: AND_3 port map (A => I(4), B => I(1), C => s0c, Y => a2);
	and3: AND_3 port map (A => I(5), B => I(1), C => I(0), Y => a3);

  -- final sum.
  o1: OR_4 port map (A => a0, B => a1, C => a2, D => a3, Y => Y);
	
end Struct;
