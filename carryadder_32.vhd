library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity cla32 is
 port
 ( A, B: in std_logic_vector(31 downto 0);
   S:out std_logic_vector(31 downto 0);
   Cin: in std_logic;
   P3_32, G3_32, Cout_32: out std_logic
  );
end entity;

architecture dataflow of cla32 is
signal P, G, C: std_logic_vector(3 downto 0);
signal Cout_16_1, Cout_16_2: std_logic;
signal P3_16_1, P3_16_2, G3_16_1, G3_16_2: std_logic;
begin
C(0)<=Cin;
P<='0' & '0' & P3_16_2 & P3_16_1;
G<='0' & '0' & G3_16_2 & G3_16_1;
---------------------------------------------------------------------------------------------------------------

 cla1: cla16
 port map(A=>A(15 downto 0), B=>B(15 downto 0), S=>S(15 downto 0), Cin=>C(0), P3_16=>P3_16_1, G3_16=>G3_16_1, Cout_16=>Cout_16_1);

--------------------------------------------------------------------------------------------------------------

 cla2: cla16
 port map(A=>A(31 downto 16), B=>B(31 downto 16), S=>S(31 downto 16), Cin=>C(1), P3_16=>P3_16_2, G3_16=>G3_16_2, Cout_16=>Cout_16_2);

-----------------------------------------------------------------------------------------------------------------
 la: la4
 port map(P=>P ,G=>G ,C=>C , C0=>Cin , C4=>Cout_32 , P_03=>P3_32 ,G_03=>G3_32 );
end dataflow;