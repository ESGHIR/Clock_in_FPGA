library ieee;
 use ieee.std_logic_1164.all;
 USE ieee.numeric_std.ALL;  
 use ieee.std_logic_unsigned.all;
 
 entity Letter_Selection_Logic is 
port(
SW : in std_logic_vector(2 downto 0 ) ;
b1,b2,b3,b4 : out integer 
 );
end entity ;

architecture SIM of Letter_Selection_Logic  is
begin 
process(SW)
	begin		
case SW is            -- 5 wait 0.5s & 15 wait 1.5s & 0 wait 0s
			when "000" => b1<=5;b2<=15;b3<=0;b4<=0;--A
			when "001" => b1<=15;b2<=5;b3<=5;b4<=5;--B
			when "010" => b1<=15;b2<=5;b3<=15;b4<=5;--C
			when "011" => b1<=15;b2<=5;b3<=5;b4<=0;--D
			when "100" => b1<=5;b2<=0;b3<=0;b4<=0;--E
			when "101" => b1<=5;b2<=5;b3<=15;b4<=5;--F
			when "110" => b1<=15;b2<=15;b3<=5;b4<=0;--G
			when "111" => b1<=5;b2<=5;b3<=5;b4<=5;--H
		end case;
end process;
end SIM ;