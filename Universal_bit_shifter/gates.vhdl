library ieee;
use ieee.std_logic_1164.all;

package Gates is
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  component AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component AND_2;

  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND_2;

  component OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component OR_2;

  component NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NOR_2;

  component XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XOR_2;

  component XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XNOR_2;
  
  component AND_3 is
   port (A, B, C: in std_logic; Y: out std_logic);
  end component AND_3;
	
	component OR_4 is
	 port (A, B, C, D: in std_logic; Y: out std_logic);
	end component OR_4;
	
	component MUX_2x1 is
		port (I: in std_logic_vector(1 downto 0); S: in std_logic; Y: out std_logic);
	end component MUX_2x1;
	
	component reverse_8bit is
		port(A: in std_logic_vector(7 downto 0); L : in std_logic; R: out std_logic_vector(7 downto 0));
	end component reverse_8bit;
	
end package Gates;


library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
   port (A: in std_logic; Y: out std_logic);
end entity INVERTER;

architecture Equations of INVERTER is
begin
   Y <= not A;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity AND_2;

architecture Equations of AND_2 is
begin
   Y <= A and B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NAND_2;

architecture Equations of NAND_2 is
begin
   Y <= not (A and B);
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity OR_2;

architecture Equations of OR_2 is
begin
   Y <= A or B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NOR_2;

architecture Equations of NOR_2 is
begin
   Y <= not (A or B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XOR_2;

architecture Equations of XOR_2 is
begin
   Y <= A xor B;
end Equations;
  
library ieee;
use ieee.std_logic_1164.all;
entity XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XNOR_2;

architecture Equations of XNOR_2 is
begin
   Y <= not (A xor B);
end Equations;

library ieee;
use ieee.std_logic_1164.all;
use work.Gates.all;
entity AND_3 is
   port (A, B, C: in std_logic; Y: out std_logic);
end entity AND_3;

architecture Equations of AND_3 is
signal aout: std_logic;

begin
	a1: AND_2 port map (A => A, B => B, Y => aout);
	a2: AND_2 port map (A => aout, B => C, Y => Y);
end Equations;

library ieee;
use ieee.std_logic_1164.all;
use work.Gates.all;
entity OR_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
end entity OR_4;

architecture Equations of OR_4 is
signal s1, s2: std_logic;

begin
	o1: OR_2 port map (A => A, B => B, Y => s1);
	o2: OR_2 port map (A => C, B => D, Y => s2);
	o3: OR_2 port map (A => s1, B => s2, Y => Y);
end Equations;

library ieee;
use ieee.std_logic_1164.all;
use work.Gates.all;

entity reverse_8bit is
	port(A: in std_logic_vector(7 downto 0); L : in std_logic; R: out std_logic_vector(7 downto 0));
end entity reverse_8bit;

architecture Equations of reverse_8bit is
begin
	reverser: for i in 0 to 7 generate
		b4: MUX_2x1 port map(I(0) => A(i), I(1) => A(7-i), S => L, Y => R(i));
  end generate;
	
end Equations;

library ieee;
use ieee.std_logic_1164.all;
use work.Gates.all;

entity MUX_2x1 is
	port(I: in std_logic_vector(1 downto 0); S: in std_logic; Y: out std_logic);
end entity MUX_2x1;

architecture Equations of MUX_2x1 is
	signal sc, a0, a1: std_logic;

begin
	inv: INVERTER port map (A => S, Y => sc);
	
	and0: AND_2 port map (A => sc, B => I(0), Y => a0);
	and1: AND_2 port map (A => S, B => I(1), Y => a1);
	
	or0: OR_2 port map (A => a0, B => a1, Y => Y);

end Equations;