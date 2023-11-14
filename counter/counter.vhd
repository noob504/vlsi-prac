use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity counter is
    Port ( clk,rst : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (7 downto 0));
end counter;

architecture Behavioral of counter is
signal tmp: std_logic_vector(23 downto 0);
signal sclk,srst : std_logic;
signal yt:std_logic_vector(7 downto 0);

begin
process(clk,rst)
begin
if clk='1' and clk'event then
if rst='1' then 
tmp <= x"000000";
srst <= '1';
sclk <= '0';

else 
tmp <= tmp + 1;

if tmp(23) = '1' then 
srst <= '0';
end if ;
sclk <= tmp(22);
end  if;
end if;
end process;

process(sclk,srst)
begin
if sclk ='1' and sclk'event then 
if srst='1' then 
yt <= x"00";
 else 
 yt <= yt + 1;
 end if;
 end if;
 end process;
 y <= yt; 
end Behavioral;