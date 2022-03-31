library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bit_2compteur is
	port(clk,R,Enable:in std_logic;
			dashes,dots : out std_logic;
			Q:out std_logic_vector(1 downto 0) := (others =>'0'));
end entity;

architecture SIM of bit_2compteur is
signal X:std_logic_vector(1 downto 0);
begin
	process(clk,R,Enable)
	begin
		if(R='0')then
			X<=(others =>'0');
	elsif (Enable = '1') then 
		if( clk='1' and clk'event) then
			X <= X + '1';
		end if;
		end if;
		Q <= X ;
	end process;
	process(X)
begin 
if( X = 1 ) then 
dots <= '1' ; 
else dots <= '0' ;
end if ;
if( X = 3 ) then 
dashes <= '1' ; 
else dashes <= '0' ;
end if ;
end process ; 
end SIM;