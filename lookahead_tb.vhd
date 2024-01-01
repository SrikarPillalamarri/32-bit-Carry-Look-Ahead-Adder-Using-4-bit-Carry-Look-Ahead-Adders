library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity la4_tb is
end entity;
architecture tb of la4_tb is
component la4 is
 port 
 ( P, G: in std_logic_vector(3 downto 0);
   C: out std_logic_vector(4 downto 0);
   C0: in std_logic
 );
end component;
 signal P, G: std_logic_vector(3 downto 0):= "0000";
 signal C: std_logic_vector(4 downto 0);
 signal C0: std_logic:='0';
begin
 
uut: la4
 port map ( P => P, G => G, C => C, C0 => C0);
 P <= "1010" , "0101" after 3ns;
 G <= "0011" , "1100" after 5ns;
 C0 <= not C0 after 11ns;

 timeBomb: process
 begin
  wait for 30ns;
  assert false
   report"simulation ended by SP at" &time'image(now)
   severity failure;
 end process;
end tb;
