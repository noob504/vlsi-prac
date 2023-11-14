library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity fifo is
    Port ( din : in STD_LOGIC_VECTOR (3 downto 0);
           dout : out STD_LOGIC_VECTOR (3 downto 0);
           rw,rst,clk : in STD_LOGIC);
end fifo;

architecture Behavioral of fifo is
type mem is array (0 to 3) of std_logic_vector(3 downto 0);
signal add: std_logic_vector(1 downto 0);
signal a:mem;
begin

process(clk, rst)
begin

if clk='1' and clk'event then
if rst='1' then
add<="00";
else
if rw='0' then
case add is
when "00" => a(0)<= din;
when "01" => a(1)<= din;
when "10" => a(2)<= din;
when "11" => a(3)<= din;
when others => null;
end case;
add <= add+1;

else
case add is
when "00" => dout <= a(0);
when "01" => dout <= a(1);
when "10" => dout <= a(2);
when "11" => dout <= a(3);
when others => null;
end case;
add<= add+1;

end if;
end if;
end if;
end process;

end Behavioral;