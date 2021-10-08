library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Full_Adder is
  port(A, B, Cin: in std_logic;
			 Cout, S: out std_logic);
end entity Full_Adder;

architecture Struct of Full_Adder is
	
	component decoder3to8  is
		port(A: in std_logic_vector(2 downto 0); E: in std_logic;
				 Y: out std_logic_vector(7 downto 0));
	end component;
	
	signal m: std_logic_vector(7 downto 0);

begin
	dec: decoder3to8
		port map(E => '1',
						 A(2) => Cin,
						 A(1) => B,
						 A(0) => A,
						 
						 Y => m);
	
	o1: OR_4 port map (A => m(1), B => m(2), C => m(4), D => m(7), Y => S);
	o2: OR_4 port map (A => m(3), B => m(5), C => m(6), D => m(7), Y => Cout);

end Struct; 