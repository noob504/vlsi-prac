library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity display is
    Port ( clk,rst : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (7 downto 0);
           sw1 : out STD_LOGIC_VECTOR (3 downto 0));
end display;

architecture Behavioral of display is
signal tmp : STD_LOGIC_VECTOR (23 downto 0);
signal sclk,srst : STD_LOGIC;
signal sw : STD_LOGIC_VECTOR (1 downto 0);

begin
process(clk,rst)
begin
if clk='1' and clk'event then
if rst='1' then
tmp <=x"00000";
srst<='1';
sclk<='0';

else
tmp<=tmp+1;
if tmp(23)='1' then
srst <= '0';
end if;
sclk <= tmp(22);
end if;
end if;
end process;


process(sclk,srst)
begin
if sclk='1' and sclk'event then
if srst='1' then
sw <="00";

else

case sw is
when "00" => data <= "11111001"; sw1 <= "1110";
when "01" => data <= "10100100"; sw1 <= "1101";
when "10" => data <= "10110000"; sw1 <= "1011";
when "11" => data <= "10011001"; sw1 <= "0111";
when others => null;
end case;

sw<= sw+1;
end if;
end if;
end process;

end Behavioral;