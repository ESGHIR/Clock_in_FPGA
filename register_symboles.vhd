library ieee;
 use ieee.std_logic_1164.all;
 USE ieee.numeric_std.ALL;  
 use ieee.std_logic_unsigned.all;
 
 entity register_symboles is 
port(
e1,e2,e3,e4 : out integer ; --DATA
Enable , load : in std_logic ; -- Enable memorisation || load charger 
s1,s2,s3,s4 : in integer );

end entity ;

architecture SIM of register_symboles is
begin

process(load)
begin
if load = '1' then --memorisation 
e1 <= s1;
e4 <= s4;
e2 <= s2;
e3 <= s3 ;
end if;
end process;

end architecture ;