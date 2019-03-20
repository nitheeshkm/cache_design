library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder4_2 is
port( i1 : in std_logic; --LSB
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic; --MSB
      o2 : out std_logic);
end encoder4_2;

architecture structural of encoder4_2 is

component or2
port(input1   : in  std_logic;
     input2   : in std_logic;
     output   : out std_logic);
end component;
for all : or2 use entity work.or2(structural);
begin
or2_1 : or2 port map(i3,i2,o1);
or2_2 : or2 port map(i1,i3,o2);
end structural;
