library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	component vowel is
     port(a, b, c, d: in std_logic; Y: out std_logic);
   end component;
begin
   add_instance: vowel 
			port map (
					-- order of inputs a b c d
					a => input_vector(3),
					b => input_vector(2),
					c => input_vector(1),
					d => input_vector(0),

          -- order of outputs Y
					Y => output_vector(0));

					
end DutWrap;

