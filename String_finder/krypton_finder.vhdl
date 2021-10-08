library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity krypton is
port(inp:in std_logic_vector(4 downto 0);
        reset,clock:in std_logic;
        outp: out std_logic);
end krypton;

architecture rch of krypton is

---------------Define state type here-----------------------------
type state is (rst,s1,s2,s3,s4,s5,s6);      
---------------Define signals of state type-----------------------
signal y_present, y_next: state:= rst;

begin
clock_proc: process(clock,reset)
begin
    if(clock='1' and clock' event) then
        if (reset = '1') then
            y_present <= rst; 
        else
            y_present <= y_next; 
        end if;
    end if;
end process;

state_transition_proc: process(inp,y_present)
variable dec: integer;
begin
		dec:= to_integer(unsigned(inp));
    case y_present is
        when rst =>
            if(dec = 11) then   --k
                y_next <= s1;
            else
                y_next <= rst; 
            end if;

        when s1 => 
            if(dec = 18) then   --r
                y_next <= s2;
            else
                y_next <= s1; 
            end if;

        when s2 => 
            if(dec = 25) then   --y
                y_next <= s3;
            else
                y_next <= s2; 
            end if;

        when s3 => 
            if(dec = 16) then   --p
                y_next <= s4;
            else
                y_next <= s3; 
            end if;

        when s4 => 
            if(dec = 20) then   --t
                y_next <= s5;
            else
                y_next <= s4; 
            end if;

        when s5 => 
            if(dec = 15) then   --o
                y_next <= s6;
            else
                y_next <= s5; 
            end if;

        when s6 => 
            if(dec = 14) then   --n
                y_next <= rst;
            else
                y_next <= s6; 
            end if;
    end case;
end process;

outp_proc: process(y_present, y_next)
begin
    if (y_next = rst and y_present = s6) then
        outp <= '1';

    else
        outp <= '0';
	
    end if;

end process;
end rch;