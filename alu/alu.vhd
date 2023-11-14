library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity alu is
    Port ( areg,breg : in STD_LOGIC_VECTOR (3 downto 0);
           cin,al : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           dout : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end alu;

architecture Behavioral of alu is
signal at  ,bt,dt:std_logic_vector(4 downto 0);

begin
at<='0'&areg;
bt<='0'&breg;
process(at,bt,cin,al,op)
begin

if al='0' then
case op is
when "00" => dt<=at+bt;
when "01" => dt<=at+bt+cin;
when "10" => dt<=at-bt;
when "11" => dt<=at-bt-cin;
when others =>null;
end case;

else
case op is
when "00" => dt<=at and bt;
when "01" => dt<=at or bt;
when "10" => dt<=at xor bt;
when "11" => dt<= not at;
when others =>null;
end case;
end if;
end process;

cout<=dt(4);
dout<=dt(3 downto 0);

end Behavioral;