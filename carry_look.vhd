library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity carry is
 port
 ( A, B: in std_logic_vector(3 downto 0);
   S:out std_logic_vector(3 downto 0);
   Cin: in std_logic;
   Cout:out std_logic;
   P_03, G_03: out std_logic
  );
end entity;
architecture dataflow of carry is
signal iG,iP,iC:std_logic_vector(3 downto 0);
begin

gen1: for i in 3 downto 0 generate
  pf1:pfa
    port map(A=>A(i),B=>B(i),C=>iC(i),G=>iG(i),S=>S(i),P=>iP(i));
end generate gen1;

la1:la4
    port map(P=>iP,G=>iG,C=>iC,C0=>Cin,C4=>Cout,P_03=>P_03,G_03=>G_03);
end dataflow;