-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(17 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
   component MUX_4bit is
     port(A, B, C, D: in std_logic_vector(3 downto 0);
					S: in std_logic_vector(1 downto 0);
         	Y: out std_logic_vector(3 downto 0));
   end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: MUX_4bit
			port map (
					-- order of inputs D, C, B, A, S1, S0, Y
					D(3) => input_vector(17),
					D(2) => input_vector(16),
					D(1) => input_vector(15),
					D(0) => input_vector(14),
					C(3) => input_vector(13),
					C(2) => input_vector(12),
					C(1) => input_vector(11),
					C(0) => input_vector(10),
					B(3) => input_vector(9),
					B(2) => input_vector(8),
					B(1) => input_vector(7),
					B(0) => input_vector(6),
					A(3) => input_vector(5),
					A(2) => input_vector(4),
					A(1) => input_vector(3),
					A(0) => input_vector(2),
					S(1) => input_vector(1),
					S(0) => input_vector(0),
          
					-- order of outputs Y
					Y(3) => output_vector(3),
					Y(2) => output_vector(2),
					Y(1) => output_vector(1),
					Y(0) => output_vector(0));
					
end DutWrap;

