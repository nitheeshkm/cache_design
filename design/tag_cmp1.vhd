library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tag_cmp1 is
port(t14,t15,t16,t17,t18,t19,t20,t21: in std_logic;
     mem2,mem3,mem4 : inout std_logic;
     write_cache : out std_logic
     );
end tag_cmp1;

architecture structural of tag_cmp1 is

component or2
port(
    input1    : in  std_logic;
    input2 : in std_logic;
    output   : out std_logic);
end component;

for all : or2 use entity work.or2(structural);

signal mem1,write_cache0,write_cache1 : std_logic;

begin

or2_mem1 : or2 port map(t14,t15,mem1);
or2_mem2 : or2 port map(t17,t16,mem2);
or2_mem3 : or2 port map(t18,t19,mem3);
or2_mem4 : or2 port map(t20,t21,mem4);
or2_byte0 : or2 port map(input1=>mem2,input2=>mem1,output=>write_cache0);
or2_byte1 : or2 port map(input1=>mem3,input2=>mem4,output=>write_cache1);
or2_byte : or2 port map(write_cache0, write_cache1,write_cache);

end structural;
