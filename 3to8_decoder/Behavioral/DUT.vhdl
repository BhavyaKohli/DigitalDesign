library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
      component decoder3to8 is
     port(A: in std_logic_vector(2 downto 0); E: in std_logic;
          Y: out std_logic_vector(7 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: decoder3to8 
			port map (
					-- order of inputs A(vec) E
					A => input_vector(3 downto 1),
					E => input_vector(0),
	
          -- order of outputs Y(vec)
					Y => output_vector);
					
end DutWrap;

