--///////////////////////////////////////////////////////////////////////////

-- @ Soumyajit Langal (WEL IITB)
-- The skeleton code for Mid-Semester EE214. 

--///////////////////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity atm is
-- port declaration
	port (M: in std_logic_vector (7 downto 0); P, A: out std_logic_vector (1 downto 0); B: out std_logic; C: out std_logic_vector (5 downto 0));
end entity atm;

architecture struct of atm is

component MUX_2 is
  port (I: in std_logic_vector(1 downto 0); S: in std_logic; Y: out std_logic);
end component MUX_2;

component OR_7 is
	port (A: in std_logic_vector(5 downto 0); B: in std_logic; Y: out std_logic);
end component OR_7;

component div is
generic(
			N : integer:=8; -- operand width
			NN : integer:=16 -- result width
        );
port (
			Nu: in std_logic_vector(N-1 downto 0);-- Nu (read numerator) is dividend
			D: in std_logic_vector(N-1 downto 0);-- D (read Denominator) is divisor
			RQ: out std_logic_vector(NN-1 downto 0)--upper N bits of RQ will have remainder and lower N bits will have quotient
) ;
end component;

signal RQ1, RQ2: std_logic_vector(15 downto 0);
signal p10, p0, p00, p1: std_logic;
signal hundred: std_logic_vector(7 downto 0) := "01100100";
signal fifty: std_logic_vector(7 downto 0) := "00110010";

begin
	div1: div port map (Nu => M, D => hundred, RQ => RQ1);
	div2: div port map (Nu => RQ1(15 downto 8), D => fifty, RQ => RQ2);

	--RQ1 contains A(8 bit) and R1, RQ2 contains B and C (8 bit)
	--a = A1 A0, b = B0, c = C5 C4 C3 C2 C1 C0
	
	orp1_1: OR_2 port map (A => RQ1(0), B => RQ1(1), Y => p10);
	orp1_2: OR_2 port map (A => p10, B => RQ2(0), Y => p1);
	
	orp0: OR_7 port map (A => RQ2(13 downto 8), B => p10, Y => p0);

	mux1: MUX_2 port map (I(1) => '0', I(0) => p0, S => p1, Y => p00);

	-- did not account for one case, and the following mux is not present in the handwritten design
	mux2: MUX_2 port map (I(1) => p10, I(0) => p00, S => p10, Y => P(0));
	
	P(1) <= p1;
	A <= RQ1(1 downto 0);
	B <= RQ2(0);
	C <= RQ2(13 downto 8);
end struct;
