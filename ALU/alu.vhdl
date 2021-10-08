library ieee;
use ieee.std_logic_1164.all;

entity alu_beh is
    generic(
        operand_width : integer:=4;
        sel_line : integer:=2
        );
    port (
        A: in std_logic_vector(operand_width-1 downto 0);
        B: in std_logic_vector(operand_width-1 downto 0);
        sel: in std_logic_vector(sel_line-1 downto 0);
        op: out std_logic_vector((operand_width*2)-1 downto 0)
				);
end alu_beh;

architecture a1 of alu_beh is

    function sub(A: in std_logic_vector(operand_width-1 downto 0); B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
            -- declaring and initializing variables using aggregates 
            variable diff : std_logic_vector(operand_width*2-1 downto 0):= (others=>'0');
            variable carry : std_logic:= '1';
            variable Bc : std_logic_vector(operand_width-1 downto 0);
        begin
            -- Hint: Use for loop to calculate value of "diff" and "carry" variable
            -- Use aggregates to assign values to multiple bits
            Bc:= not B;
            diff(operand_width-1 downto 0):= A;

            for i in 0 to 3 loop
                diff(i):= A(i) xor Bc(i) xor carry;
                carry:= (A(i) and Bc(i)) or (Bc(i) and carry) or (A(i) and carry);
            end loop;

            if carry = '0' then
                diff:= "1111" & diff(3 downto 0);
            end if;

        return diff;
    end sub;

     
    function rolf(A: in std_logic_vector(operand_width-1 downto 0); B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
            variable shift : std_logic_vector((operand_width*2)-1 downto 0):= (others=>'0');
        begin
            shift(operand_width-1 downto 0):= A;
            -- Hint: use for loop to calculate value of shift variable
            -- shift(____ downto _____) & shift(____ downto ______)
            -- to calculate exponent, you can use double asterisk. ex: 2**i
            if B(0) = '1' then
                shift := shift(6 downto 0) & shift(7); 
            end if;

            if B(1) = '1' then
                shift := shift(5 downto 0) & shift(7 downto 6);
            end if;

            if B(2) = '1' then
                shift := shift(3 downto 0) & shift(7 downto 4);
            end if;

        return shift;
    end rolf;
		
begin
alu : process( A, B, sel )
begin
    -- complete VHDL code for various outputs of ALU based on select lines
    -- Hint: use if/else statement
    --
    -- sub function usage :
    --   signal_name <= sub(A,B)
    --   variable_name := sub(A,B)
    --
    -- concatenate operator usage:
    --    "0000"&A 
    if (sel = "00") then
        op <= rolf(A,B);

    elsif (sel = "01") then
        op <= sub(A,B);

    elsif (sel = "10") then
		op <= "00000000";
        for i in 0 to operand_width-1 loop
            op(i) <= A(i) nor B(i);
		end loop;
		
    elsif (sel = "11") then
        op <= rolf(A,"0010");
    end if;
    
end process ; --alu
end a1 ; -- a1
