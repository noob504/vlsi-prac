library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
    Port ( din : in STD_LOGIC_VECTOR (3 downto 0);
           dsl : in STD_LOGIC;
           dsr : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (3 downto 0);
           rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           mode : in STD_LOGIC_VECTOR (1 downto 0)); 
end shift_reg; 

architecture Behavioral of shift_reg is
signal count:integer:=1;
signal tmp: std_logic:='0';
signal tep: std_logic_vector(3 downto 0);
signal clock_out : std_logic;
begin

p1:process(clk)
begin

if clk='1' and clk'event then
count<= count + 1;
if(count= 25000000)
 then
 tmp <= NOT tmp;
 count <=1;
 end if;
end if;
clock_out <= tmp;
end process p1;

p2:process(clock_out, rst,dsl,dsr, din, mode)
begin

if rst = '1' then
tep <= "0000";
elsif( clock_out='1' and clock_out'event) then
case mode is
when "00" => tep <= din;    --parallel load
when "01" => tep <= dsr & tep(3 downto 1);  --right shift
when "10" => tep <= tep (2 downto 0) & dsl;
when others => null; 
end case;
end if;
end process p2;
q<=tep;

end Behavioral;