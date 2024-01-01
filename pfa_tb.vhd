library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity pfa_tb is
end entity;

architecture tb of pfa_tb is
component pfa is
 port
 ( A, B, C: in std_logic;
   G, S: out std_logic;
   P: inout std_logic
 );
end component;
 
 signal A, B, C: std_logic := '0';
 signal G, S, P: std_logic;
begin

uut: pfa
 port map ( A => A, B => B, C => C, G => G, S => S, P => P);

 A <= not A after 2ns;
 B <= not B after 4ns;
 C <= not C after 8ns;

 timeBomb: process
 begin
  wait for 17ns;
  assert false
   report "simulation ended bu SP at" &time'image(now)
   severity failure;
 end process;
end tb;
