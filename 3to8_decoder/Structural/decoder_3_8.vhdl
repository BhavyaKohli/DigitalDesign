library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity decoder3to8  is
  port(A: in std_logic_vector(2 downto 0); E: in std_logic;
       Y: out std_logic_vector(7 downto 0));
end entity decoder3to8;

architecture Struct of decoder3to8 is
	component decoder2to4  is
		port(I: in std_logic_vector(1 downto 0); E: in std_logic;
				 O: out std_logic_vector(3 downto 0));
	end component;
	
	signal inA2, inA2andE, A2andE: std_logic;
	-- inA2 = inverse of A2, inA2andE = inverse of A2 (and) E, A2andE = A2 (and) E

begin
  -- gates
	in2: INVERTER port map (A => A(2), Y => inA2);
	
	aA2cE: AND_2 port map (A => inA2, B => E, Y => inA2andE);
	aA2E: AND_2 port map (A => A(2), B => E, Y => A2andE);
	
  -- 2to4 decoders
  dec1: decoder2to4
		port map (I(1) => A(1), 
							I(0) => A(0), 
							E => inA2andE, 
							O(3) => Y(3), 
							O(2) => Y(2), 
							O(1) => Y(1), 
							O(0) => Y(0));
							
	dec0: decoder2to4
		port map (I(1) => A(1), 
							I(0) => A(0), 
							E => A2andE, 
							O(3) => Y(7), 
							O(2) => Y(6), 
							O(1) => Y(5), 
							O(0) => Y(4));	
	
end Struct;