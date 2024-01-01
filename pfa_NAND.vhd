library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity pfa is
 port
 ( A, B, C: in std_logic;
   G, S: out std_logic;
   P: inout std_logic
 );
end entity;
 
architecture dataflow of pfa is
signal p1, p2, p3, g1, s1, s2, s3: std_logic;
begin

-- "P" DECLARATION --

 a1: NAND2
 port map ( A => A, B => B, Y => p1);
 
 a2: NAND2
 port map ( A => A, B => p1, Y => p2);

 a3: NAND2
 port map ( A => p1, B => B, Y => p3);

 a4: NAND2
 port map ( A => p2, B => p3, Y => P); 

-- "G" DECLARATION --

 b1: NAND2
 port map ( A => A, B => B, Y => g1);

 b2: NAND2
 port map ( A => g1, B => g1, Y => G);

-- "S" DECLARATION --

 c1: NAND2
 port map ( A => P, B => C, Y => s1);
 
 c2: NAND2
 port map ( A => P, B => s1, Y => s2);

 c3: NAND2
 port map ( A => s1, B => C, Y => s3);

 c4: NAND2
 port map ( A => s2, B => s3, Y => S);

end architecture;
 
