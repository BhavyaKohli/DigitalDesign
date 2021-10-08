library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity decoder2to4  is
  port(A: in std_logic_vector(1 downto 0); E: in std_logic;
       Y: out std_logic_vector(3 downto 0));
end entity decoder2to4;

architecture Struct of decoder2to4 is
	signal inA0, inA1: std_logic;
begin
  -- inverters
  in1: INVERTER
		port map (A => A(1), Y => inA1);
	in0: INVERTER
		port map (A => A(0), Y => inA0);

  -- and gates
  a3: AND_3
		port map (A => A(1), B => A(0), C => E, Y => Y(3));
	a2: AND_3
		port map (A => A(1), B => inA0, C => E, Y => Y(2));
	a1: AND_3
		port map (A => inA1, B => A(0), C => E, Y => Y(1));
	a0: AND_3
		port map (A => inA1, B => inA0, C => E, Y => Y(0));
		
end Struct;