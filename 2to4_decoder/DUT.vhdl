-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
   component decoder2to4 is
     port(A: in std_logic_vector(1 downto 0); E: in std_logic;
          Y: out std_logic_vector(3 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: decoder2to4
			port map (
					-- order of inputs A(vec) E
					A(1) => input_vector(2),
					A(0) => input_vector(1),
					E => input_vector(0),
	
          -- order of outputs Y(vec)
					Y(3) => output_vector(3),
					Y(2) => output_vector(2),
					Y(1) => output_vector(1),
					Y(0) => output_vector(0));

end DutWrap;

