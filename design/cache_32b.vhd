-- Entity: cache cell 32b
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;

entity cache_32b is 
port ( din :  in std_logic_vector(7 downto 0);
       by_en0,by_en1,by_en2,by_en3 :in std_logic;
       blk_en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end cache_32b;

architecture structural of cache_32b is

component cache_8b
port ( din :  in std_logic_vector(7 downto 0);
       en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end component;

component and2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;

for and2_1, and2_2, and2_3, and2_4 : and2 use entity work.and2(structural);
for cache_8b_1, cache_8b_2, cache_8b_3, cache_8b_4 : cache_8b use entity work.cache_8b(structural);

signal t1,t2,t3,t4: std_logic;
begin

and2_1 : and2 port map(by_en0, blk_en, t1);
and2_2 : and2 port map(by_en1, blk_en, t2);
and2_3 : and2 port map(by_en2, blk_en, t3);
and2_4 : and2 port map(by_en3, blk_en, t4);

cache_8b_1 : cache_8b port map(din,t1,rw_en,dout);
cache_8b_2 : cache_8b port map(din,t2,rw_en,dout);
cache_8b_3 : cache_8b port map(din,t3,rw_en,dout);
cache_8b_4 : cache_8b port map(din,t4,rw_en,dout);

end structural;