library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity cla16 is
 port
 ( A, B: in std_logic_vector(15 downto 0);
   S:out std_logic_vector(15 downto 0);
   Cin: in std_logic;
   P3_16, G3_16, Cout_16: out std_logic
  );
end entity;
architecture dataflow of cla16 is
signal Cout: std_logic_vector(3 downto 0);
signal Clook: std_logic_vector(3 downto 0);
signal P_03, G_03: std_logic_vector(3 downto 0);
signal iG,iP,iC:std_logic_vector(3 downto 0);
signal iG1,iP1,iC1:std_logic_vector(7 downto 4);
signal iG2,iP2,iC2:std_logic_vector(11 downto 8);
signal iG3,iP3,iC3:std_logic_vector(15 downto 12);
begin
Clook(0)<=Cin;
--------------------------------------------------------------------------------------------------
gen1: for i in 3 downto 0 generate
  pf1:pfa
    port map(A=>A(i),B=>B(i),C=>iC(i),G=>iG(i),S=>S(i),P=>iP(i));
end generate gen1;

la1:la4
    port map(P=>iP,G=>iG,C=>iC,C0=>Cin,C4=>Cout(0),P_03=>P_03(0),G_03=>G_03(0));
---------------------------------------------------------------------------------------------------
gen2: for i in 7 downto 4 generate
  pf2:pfa
    port map(A=>A(i),B=>B(i),C=>iC1(i),G=>iG1(i),S=>S(i),P=>iP1(i));
end generate gen2;

la2:la4
    port map(P=>iP1,G=>iG1,C=>iC1,C0=>Clook(1),C4=>Cout(1),P_03=>P_03(1),G_03=>G_03(1));
-------------------------------------------------------------------------------------------------------
gen3: for i in 11 downto 8 generate
  pf3:pfa
    port map(A=>A(i),B=>B(i),C=>iC2(i),G=>iG2(i),S=>S(i),P=>iP2(i));
end generate gen3;

la3:la4
    port map(P=>iP2,G=>iG2,C=>iC2,C0=>Clook(2),C4=>Cout(2),P_03=>P_03(2),G_03=>G_03(2));
-----------------------------------------------------------------------------------------------------------
gen4: for i in 15 downto 12 generate
  pf4:pfa
    port map(A=>A(i),B=>B(i),C=>iC3(i),G=>iG3(i),S=>S(i),P=>iP3(i));
end generate gen4;

la_4:la4
    port map(P=>iP3,G=>iG3,C=>iC3,C0=>Clook(3),C4=>Cout(3),P_03=>P_03(3),G_03=>G_03(3));
---------------------------------------------------------------------------------------------------------------
la5:la4
    port map(P=>P_03,G=>G_03,C=>Clook,C0=>Cin,C4=>Cout_16,P_03=>P3_16,G_03=>G3_16);
end dataflow;