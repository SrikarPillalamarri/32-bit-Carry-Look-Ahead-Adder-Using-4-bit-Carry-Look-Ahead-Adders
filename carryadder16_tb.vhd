library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity cla16_tb is
end entity;
architecture tb of cla16_tb is
component cla16 is
 port 
 ( A, B: in std_logic_vector(15 downto 0);
   S:out std_logic_vector(15 downto 0);
   Cin: in std_logic;
 --  Cout:out std_logic_vector(3 downto 0);
  -- Clook: inout std_logic_vector(3 downto 0);
  --- P_03, G_03: out std_logic_vector(3 downto 0);
   P3_16, G3_16, Cout_16: out std_logic
 );
end component;
 signal A, B: std_logic_vector(15 downto 0):= "0000000000000000";
 signal S: std_logic_vector(15 downto 0);
 signal Cin: std_logic:='0';
 --signal Cout: std_logic_vector(3 downto 0);
 --signal Clook: std_logic_vector(3 downto 0);
-- signal P_03, G_03: std_logic_vector(3 downto 0);
 signal P3_16, G3_16, Cout_16: std_logic;
begin
 
uut: cla16
 port map ( A => A, B => B, S => S, Cin => Cin, P3_16 => P3_16, G3_16 => G3_16, Cout_16 => Cout_16);
 A <= "0100111000100000" after 3ns;
 B <= "0010011100000000" after 5ns;

 timeBomb: process
 begin
  wait for 30ns;
  assert false
   report"simulation ended by SP at" &time'image(now)
   severity failure;
 end process;
end tb;
