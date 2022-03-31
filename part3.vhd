library ieee;
 use ieee.std_logic_1164.all;
 USE ieee.numeric_std.ALL;  
 use ieee.std_logic_unsigned.all;
 
 entity part3 is 
port(
key0,key1 : in std_logic; -- key0 ---> stop  & key1 ---> clk
SW : in unsigned(7 downto 0);
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out std_logic_vector(6 downto 0);
seconde,minute,millisec : out unsigned(7 downto 0)
 );
end entity ;

architecture SIM of part3 is
component converter_BCD is 
port(
number : in unsigned(7 downto 0 );
nbr0 : out unsigned(3 downto 0 );
nbr1 : out unsigned(3 downto 0 )
 );
end component ;

component decoder_BCD is 
port(
SW : unsigned(3 downto 0);
HEX: out std_logic_vector(6 downto 0) );
end component ;
signal m,s,ms : unsigned(7 downto 0 );
signal mu,md,su,sd,msu,msd : unsigned(3 downto 0 );
begin 
process(key0,key1,SW)
variable min,sec,msec : integer:=0;
begin
if key0 = '1' then
else if rising_edge(key1) then
msec := msec+1;
if msec > 99 then 
sec := sec + 1 ;
msec := 0;
end if;
if sec > 59 then 
min := min +1 ;
sec := 0;
end if;
min := to_integer(unsigned(SW) );
if min > 59 then
	  min := 0;
end if;
	  end if;
end if;
s <= to_unsigned( sec , 8);
ms <= to_unsigned( msec , 8);
m <= to_unsigned( min , 8);
end process ;
millisec <= ms;
minute <= m;
seconde <= s;
---------convertisseur au BCD-----------------
X0 : converter_BCD port map(s,su,sd);
X1 : converter_BCD port map(ms,msu,msd);
X2 : converter_BCD port map(m,mu,md);
------------Affichage------------------
y0 : decoder_BCD port map(su,HEX3);
y1 : decoder_BCD port map(sd,HEX2);
a0 : decoder_BCD port map(mu,HEX5);
a1 : decoder_BCD port map(md,HEX4);
z0 : decoder_BCD port map(msu,HEX1);
z1 : decoder_BCD port map(msd,HEX0);
end SIM ;