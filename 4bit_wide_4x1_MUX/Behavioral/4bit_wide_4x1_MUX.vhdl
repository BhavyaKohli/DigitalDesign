library ieee;
use ieee.std_logic_1164.all;

entity mux_4bit  is
  port (A, B, C, D: in std_logic_vector(3 downto 0);
                S: in std_logic_vector(1 downto 0); 
                Y: out std_logic_vector (3 downto 0));
end entity mux_4bit;

architecture Struct of mux_4bit is

    function mux(A: in std_logic_vector(3 downto 0); S: in std_logic_vector(1 downto 0))
        return std_logic is
            variable op: std_logic;
        begin
            if (S = "00") then
                op := A(0);

             elsif (S = "01") then
                op := A(1);

            elsif (S = "10") then
                op := A(2);
        
            elsif (S = "11") then
                op := A(3);
            end if;
        return op;
    end mux;

begin
mux_4bit : process(A, B, C, D, S)
begin
    Y <= mux(D(3) & C(3) & B(3) & A(3), S) & mux(D(2) & C(2) & B(2) & A(2), S) & mux(D(1) & C(1) & B(1) & A(1), S) & mux(D(0) & C(0) & B(0) & A(0), S);
end process ; 
end Struct;