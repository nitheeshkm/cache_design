library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dec2_4 is
port(s0,s1,en : in std_logic;
y0,y1,y2,y3 : out std_logic);
end dec2_4;

architecture structural of dec2_4 is

component and3
port(input1 : in std_logic;
     input2 : in std_logic;
     input3 : in std_logic;
     output : out std_logic);
end component;

component inverter
port(input : in std_logic;
     output : out std_logic);
end component;

for inv_1,inv_2 : inverter use entity work.inverter(structural);
for and3_1, and3_2, and3_3, and3_4 : and3 use entity work.and3(structural);

signal s0_b, s1_b : std_logic; 

begin

inv_1 : inverter port map(input=>s0, output=>s0_b);
inv_2 : inverter port map(input=>s1, output=>s1_b);

and3_1 : and3 port map(input1=>s0_b, input2=>s1_b, input3=>en, output=>y0);
and3_2 : and3 port map(input1=>s0_b, input2=>s1, input3=>en, output=>y1);
and3_3 : and3 port map(input1=>s0, input2=>s1_b, input3=>en, output=>y2);
and3_4 : and3 port map(input1=>s0, input2=>s1, input3=>en, output=>y3);

end structural;
