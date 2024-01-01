library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity la4 is
 port 
 ( P, G: in std_logic_vector(3 downto 0);
   C: out std_logic_vector(3 downto 0);
   C0: in std_logic;
   C4: out std_logic;
   P_03,G_03: inout std_logic
 );
end entity; 

architecture dataflow of la4 is
 signal isig: std_logic_vector(13 downto 0);
begin
 C(0) <= C0;
----------------------------------------- CARRY 1 ----------------------------------------
 n1: NAND2
 port map( A => P(0), B => C(0), Y => isig(0));
 n2: INV
 port map( A => G(0), Y => isig(1));
 n3: NAND2
 port map( A => isig(0), B => isig(1), Y => C(1));
---------------------------------------- CARRY 2 ------------------------------------------
 n4: NAND3
 port map( A => C(0), B => P(1), C => P(0), Y => isig(2));
 n5: NAND2
 port map( A => G(0), B => P(1), Y => isig(3));
 n6: INV
 port map( A => G(1), Y => isig(4));
 n7: NAND3
 port map( A => isig(2), B => isig(3), C => isig(4), Y => C(2));
 -----------------------------------------CARRY 3 ------------------------------------------------
 n8: NAND4
 port map( A => P(2), B => P(1), C => P(0), D => C(0), Y => isig(5));
 n9: NAND3
 port map( A => G(0), B => P(2), C => P(1), Y => isig(6));
 n10: NAND2
 port map( A => G(1), B => P(2), Y => isig(7));
 n11: INV
 port map( A => G(2), Y => isig(8));
 n12: NAND4
 port map( A => isig(5), B => isig(6), C => isig(7), D => isig(8), Y => C(3));
---------------------------------------- CARRY 4 --------------------------------------------------
 n13: INV
 port map( A => G_03, Y => isig(9));
 n14: NAND3
 port map( A => isig(11), B => isig(12), C => isig(13), Y => G_03);
 n15: NAND3
 port map( A => G(1), B => P(2), C => P(3), Y => isig(12));
 n16: NAND2
 port map( A => G(2), B => P(3), Y => isig(11));
 n17: NAND4
 port map( A => G(0), B => P(3), C => P(2), D => P(1), Y => isig(13));
 n18: NAND2
 port map( A => isig(9), B => isig(10), Y => C4);
 n19: NAND2
 port map( A => P_03, B => C0, Y => isig(10));
 n20: AND4
 port map( A => P(3), B => P(2), C => P(1), D => P(0), Y => P_03);
end architecture;


