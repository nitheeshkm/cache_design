library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dec3_8 is
port(s0,s1,s2: in std_logic;
y0,y1,y2,y3,y4,y5,y6,y7 : out std_logic);
end dec3_8;

architecture structural of dec3_8 is

component dec2_4
port(s0,s1,en : in std_logic;
y0,y1,y2,y3 : out std_logic);
end component;

--component and2
--port(input1 : in std_logic;
--     input2 : in std_logic;
--     output : out std_logic);
--end component;

component inverter
 port (
   input    : in  std_logic;
   output   : out std_logic);
end component;

for dec2_4_1,dec2_4_2 : dec2_4 use entity work.dec2_4(structural);
--for and2_1, and2_2 : and2 use entity work.and2(structural);
for inv_1 : inverter use entity work.inverter(structural);

signal s2b, en1,en2 :std_logic;

begin
inv_1 :inverter port map(s2, s2b);
--and2_1 :and2 port map(s2b, en, en1);
--and2_2 :and2 port map(s2, en, en2);

dec2_4_1 : dec2_4 port map(s0=>s0,s1=>s1,en=>s2,y0=>y0,y1=>y2,y2=>y4,y3=>y6); 
dec2_4_2 : dec2_4 port map(s0=>s0,s1=>s1,en=>s2b,y0=>y1,y1=>y3,y2=>y5,y3=>y7); 

end structural;