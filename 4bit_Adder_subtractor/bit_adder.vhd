library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity bitadder  is
  port(A,B: in std_logic_vector(3 downto 0); M: in std_logic;
       S: out std_logic_vector(3 downto 0); Cout: out std_logic);
end entity bitadder;

architecture Struct of bitadder is
  signal x0, x1, x2, x3, c01, c12, c23: std_logic;
begin
  -- xor gates
  xor0: XOR_2 port map (A => B(0), B => M, Y => x0);
  xor1: XOR_2 port map (A => B(1), B => M, Y => x1);
  xor2: XOR_2 port map (A => B(2), B => M, Y => x2);
  xor3: XOR_2 port map (A => B(3), B => M, Y => x3);
  
  -- cascaded full adders
  fa0: FULL_ADDER port map (A => x0, B => A(0), Cin => M, S => S(0), C => c01);
  fa1: FULL_ADDER port map (A => x1, B => A(1), Cin => c01, S => S(1), C => c12);
  fa2: FULL_ADDER port map (A => x2, B => A(2), Cin => c12, S => S(2), C => c23);
  fa3: FULL_ADDER port map (A => x3, B => A(3), Cin => c23, S => S(3), C => Cout);
	
end Struct;