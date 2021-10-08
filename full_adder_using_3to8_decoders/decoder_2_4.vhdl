library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity decoder2to4  is
  port(I: in std_logic_vector(1 downto 0); E: in std_logic;
       O: out std_logic_vector(3 downto 0));
end entity decoder2to4;

architecture Struct of decoder2to4 is
	signal inI0, inI1: std_logic;
begin
  -- inverters
  in1: INVERTER
		port map (A => I(1), Y => inI1);
	in0: INVERTER
		port map (A => I(0), Y => inI0);

  -- and gates
  a3: AND_3
		port map (A => I(1), B => I(0), C => E, Y => O(3));
	a2: AND_3
		port map (A => I(1), B => inI0, C => E, Y => O(2));
	a1: AND_3
		port map (A => inI1, B => I(0), C => E, Y => O(1));
	a0: AND_3
		port map (A => inI1, B => inI0, C => E, Y => O(0));
		
end Struct;