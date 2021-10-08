library ieee;
use ieee.std_logic_1164.all;
library work;

use work.Gates.all;

entity bit_shifter is
	port(L: in std_logic; A: in std_logic_vector(7 downto 0); B: in std_logic_vector(2 downto 0);
			 Y: out std_logic_vector(7 downto 0));
end entity bit_shifter;

architecture Struct of bit_shifter is
	component MUX is
	 port (I: in std_logic_vector(1 downto 0); S: in std_logic; Y: out std_logic);
	end component MUX;
	
	signal r0, s4, s2, s1: std_logic_vector(7 downto 0);
	
begin
	-- reverser 0
	rev0: reverse_8bit port map (A => A, L => L, R => r0);
	
	-- right shift by 4
	n4_bit : for i in 0 to 7 generate
		lsb4: if i < 4 generate
			b4: MUX port map(I(0) => r0(i), I(1) => r0(i+4), S => B(2), Y => s4(i));
    end generate lsb4;

    msb4: if i > 3 generate
			b4: MUX port map(I(0) => r0(i), I(1) => '0', S => B(2), Y => s4(i));
    end generate msb4;

	end generate ;
	
	-- right shift by 2
	n2_bit : for i in 0 to 7 generate
		lsb2: if i < 6 generate
			b2: MUX port map(I(0) => s4(i), I(1) => s4(i+2), S => B(1), Y => s2(i));
    end generate lsb2;

    msb2: if i > 5 generate
			b2: MUX port map(I(0) => s4(i), I(1) => '0', S => B(1), Y => s2(i));
    end generate msb2;

	end generate ;
	
	-- right shift by 1
	n1_bit : for i in 0 to 7 generate
		lsb1: if i < 7 generate
			b1: MUX port map(I(0) => s2(i), I(1) => s2(i+1), S => B(0), Y => s1(i));
    end generate lsb1;

    msb1: if i > 6 generate
			b1: MUX port map(I(0) => s2(i), I(1) => '0', S => B(0), Y => s1(i));
    end generate msb1;

	end generate ;
	
	-- reverser 1
	rev1: reverse_8bit port map(A => s1, L => L, R => Y);
	
end Struct;