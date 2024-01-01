library ieee;
use ieee.std_logic_1164.all;
entity AND2 is 
 generic (delay: time := 0ps);
 port
 ( A, B: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of AND2 is
begin
 Y <= A and B after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity AND3 is
 generic (delay: time:= 0ps);
 port
 ( A, B, C: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of AND3 is
begin
 Y <= A and B and C after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity AND4 is
 generic (delay: time:= 0ps);
 port
 ( A, B, C, D: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of AND4 is
begin
 Y <= A and B and C and D after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity INV is
 generic (delay: time:= 0ps);
 port
 ( A: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of INV is
begin
 Y <= not A after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity NAND2 is
 generic (delay: time:= 0ps);
 port
 ( A, B: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of NAND2 is
begin
 Y <= not (A and B) after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity NAND3 is
 generic (delay: time:= 0ps);
 port
 ( A, B, C: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of NAND3 is
begin
 Y <= not (A and B and C) after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity NAND4 is
 generic (delay: time:= 0ps);
 port
 ( A, B, C, D: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of NAND4 is
begin
 Y <= not (A and B and C and D) after delay;
end dataflow;

--

library ieee;
use ieee.std_logic_1164.all;
entity NAND5 is
 generic (delay: time:= 0ps);
 port
 ( A, B, C, D, E: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of NAND5 is
begin
 Y <= not (A and B and C and D and E) after delay;
end dataflow;

--


library ieee;
use ieee.std_logic_1164.all;
entity XOR2 is
 generic (delay: time:= 0ps);
 port
 ( A, B: in std_logic;
   Y: out std_logic
 );
end entity;
architecture dataflow of XOR2 is
begin
 Y <= (A xor B) after delay;
end dataflow;







