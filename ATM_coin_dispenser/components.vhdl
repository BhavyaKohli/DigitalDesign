library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX_2 is
	port (I: in std_logic_vector (1 downto 0); S: in std_logic; Y: out std_logic);
end entity MUX_2;

architecture mux of MUX_2 is
	signal sc, a0, a1: std_logic;

begin
	inv: INVERTER port map (A => S, Y => sc);

	and0: AND_2 port map (A => sc, B => I(0), Y => a0);
	and1: AND_2 port map (A => S, B => I(1), Y => a1);

	or0: OR_2 port map (A => a0, B => a1, Y => Y);
end mux; 

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity OR_7 is
	port (A: in std_logic_vector(5 downto 0); B: in std_logic; Y: out std_logic);
end entity OR_7;

architecture or7 of OR_7 is
	signal o11, o12, o13, o21, o22: std_logic;

begin
	or1: OR_2 port map (A => A(5), B => A(4), Y => o11);
	or2: OR_2 port map (A => A(3), B => A(2), Y => o12);
	or3: OR_2 port map (A => A(1), B => A(0), Y => o13);

	or4: OR_2 port map (A => o11, B => o12, Y => o21);
	or5: OR_2 port map (A => o13, B => B, Y => o22);

	or6: OR_2 port map (A => o21, B => o22, Y => Y);
end or7;