library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Flipflops.all;

entity Sequence_generator_stru_dataflow is
port (reset,clock: in std_logic;
    y:out std_logic_vector(2 downto 0));
end entity Sequence_generator_stru_dataflow;

architecture struct of Sequence_generator_stru_dataflow is 
    signal D :std_logic_vector(2 downto 0); -- D flip flop inputs
    signal Q:std_logic_vector(2 downto 0);  -- D flip flop outputs
begin

-- write the eqations in dataflow  e.g z=a+bc written z<= a or (b and c)
D(2) <= Q(2) xnor (Q(1) xor Q(0));

D(1) <= (Q(2) and (not Q(0))) or ((not Q(2)) and (not Q(1)));

D(0) <= (Q(0) and (not Q(2))) or (Q(2) and Q(1));
                                                                                                      
y(2 downto 0) <= Q(2 downto 0);                                                                                    

--Q0
dff_0  : dff_reset port map(D => D(0), clock => clock, reset => reset, Q => Q(0)); 

--Q1
dff_1  : dff_set port map(D => D(1), clock => clock, set => reset, Q => Q(1));

--Q2
dff_2  : dff_set port map(D => D(2), clock => clock, set => reset, Q => Q(2));
end struct;     