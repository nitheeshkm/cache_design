-- Entity: cache cell 32b0
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;

entity cache is 
port ( din :  in std_logic_vector(7 downto 0);
       by_en0,by_en1,by_en2,by_en3 :in std_logic;
       blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7 : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end cache;

architecture structural of cache is

component cache_32b
port ( din :  in std_logic_vector(7 downto 0);
       by_en0,by_en1,by_en2,by_en3 :in std_logic;
       blk_en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end component;

for cache_32b_0, cache_32b_1, cache_32b_2, cache_32b_3, cache_32b_4, cache_32b_5, cache_32b_6, cache_32b_7 : cache_32b use entity work.cache_32b(structural);

begin

cache_32b_0 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en0,rw_en,dout);
cache_32b_1 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en1,rw_en,dout);
cache_32b_2 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en2,rw_en,dout);
cache_32b_3 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en3,rw_en,dout);
cache_32b_4 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en4,rw_en,dout);
cache_32b_5 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en5,rw_en,dout);
cache_32b_6 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en6,rw_en,dout);
cache_32b_7 : cache_32b port map(din, by_en0,by_en1,by_en2,by_en3, blk_en7,rw_en,dout);

end structural;