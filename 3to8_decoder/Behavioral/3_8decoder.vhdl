library ieee;
use ieee.std_logic_1164.all;

entity decoder3to8  is
  port(A: in std_logic_vector(2 downto 0); E: in std_logic;
       Y: out std_logic_vector(7 downto 0));
end entity decoder3to8;

architecture Struct of decoder3to8 is

    function bintodec(A: in std_logic_vector(2 downto 0))
        return integer is
            variable op : integer := 0;
        begin
            if A(0) = '1' then
                op := op + 1; 
            end if;

            if A(1) = '1' then
                op := op + 2;
            end if;

            if A(2) = '1' then
                op := op + 4;
            end if;
		return op;
    end bintodec;

begin
decoder3to8 : process(A, E)
begin
    Y <= "00000000";
    if (E = '1') then
        Y(bintodec(A)) <= '1';
    end if;
    
end process ;
end Struct;