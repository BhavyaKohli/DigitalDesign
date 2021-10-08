library ieee;
use ieee.std_logic_1164.all;
library work;

use work.Gates.all;

entity MUX_4bit  is
  port (A, B, C, D: in std_logic_vector(3 downto 0);
				S: in std_logic_vector(1 downto 0); 
				Y: out std_logic_vector (3 downto 0));
end entity  MUX_4bit;

architecture Struct of MUX_4bit is
	component MUX is
		port (I: in std_logic_vector(5 downto 0); Y: out std_logic);
	end component;

begin
	mux3: MUX port map (I(5) => D(3),
											I(4) => C(3),
											I(3) => B(3),
											I(2) => A(3),
											I(1) => S(1),
											I(0) => S(0),
											Y => Y(3));
											
	mux2: MUX port map (I(5) => D(2),
											I(4) => C(2),
											I(3) => B(2),
											I(2) => A(2),
											I(1) => S(1),
											I(0) => S(0),
											Y => Y(2));
	
	mux1: MUX port map (I(5) => D(1),
											I(4) => C(1),
											I(3) => B(1),
											I(2) => A(1),
											I(1) => S(1),
											I(0) => S(0),
											Y => Y(1));
	
	mux0: MUX port map (I(5) => D(0),
											I(4) => C(0),
											I(3) => B(0),
											I(2) => A(0),
											I(1) => S(1),
											I(0) => S(0),
											Y => Y(0));
end Struct;
	