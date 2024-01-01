library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity cla32_tb is
end entity;
architecture tb of cla32_tb is
component cla32 is
 port
 ( A, B: in std_logic_vector(31 downto 0);
   S:out std_logic_vector(31 downto 0);
   Cin: in std_logic;
   P3_32, G3_32, Cout_32: out std_logic
  );
end component;
 signal A, B: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
 signal S: std_logic_vector(31 downto 0);
 signal Cin: std_logic:='0';
 signal P3_32, G3_32, Cout_32: std_logic;
begin
 
uut: cla32
 port map ( A => A, B => B, S => S, Cin => Cin, P3_32 => P3_32, G3_32 => G3_32, Cout_32 => Cout_32);
 A <= "01001110001000000100111000101100" , "00000010000000000000000000000101" after 3ns;
 B <= "00100111000000000010011100000000" , "00001000000000000000000000001010" after 5ns;
 Cin<='1','0' after 3ns;

 timeBomb: process
 begin
  wait for 30ns;
  assert false
   report"simulation ended by SP at" &time'image(now)
   severity failure;
 end process;
end tb;
