library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity busy1 is
port(s0_en,start,t6,reset,q : in std_logic;
     busy : out std_logic
     );
end busy1;

architecture structural of busy1 is

component nor2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;
for all :nor2 use entity work.nor2(structural);

component and2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;
for all :and2 use entity work.and2(structural);

component or2
port(
    input1    : in  std_logic;
    input2 : in std_logic;
    output   : out std_logic);
end component;

for all :or2 use entity work.or2(structural);

signal tbusy2,tbusy1,tbusy3,last_busy : std_logic;

begin

and2_busy1 : and2 port map(s0_en, start, tbusy1);
nor_busy2 : nor2 port map(start,t6, tbusy2);
nor_busy3 : nor2 port map(reset,q,tbusy3);
and2_busy2 : and2 port map(tbusy2, tbusy3,last_busy);
or2_busy3 : or2 port map(tbusy1,last_busy,busy);

end structural;
