library ieee;
use ieee.std_logic_1164.all;

entity vowel is
    port (a, b, c, d: in std_logic; Y: out std_logic);
end entity vowel;

architecture Struct of vowel is
		
begin
vowel : process(a, b, c, d)
begin
    Y <= (not d) and ((a and b) xnor c);
end process;
end Struct; 