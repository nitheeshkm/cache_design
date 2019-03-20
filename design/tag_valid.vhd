-- Entity: tag_valid
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;

entity tag_valid is 
port ( din :  in std_logic_vector(3 downto 0);
       blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7 : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(3 downto 0));
end tag_valid;

architecture structural of tag_valid is

component cache_4b
port ( din :  in std_logic_vector(3 downto 0);
       en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(3 downto 0));
end component;


for cache_4b_0, cache_4b_1, cache_4b_2, cache_4b_3, cache_4b_4, cache_4b_5, cache_4b_6, cache_4b_7 : cache_4b use entity work.cache_4b(structural);

begin

cache_4b_0 : cache_4b port map(din, blk_en0,rw_en,dout);
cache_4b_1 : cache_4b port map(din, blk_en1,rw_en,dout);
cache_4b_2 : cache_4b port map(din, blk_en2,rw_en,dout);
cache_4b_3 : cache_4b port map(din, blk_en3,rw_en,dout);
cache_4b_4 : cache_4b port map(din, blk_en4,rw_en,dout);
cache_4b_5 : cache_4b port map(din, blk_en5,rw_en,dout);
cache_4b_6 : cache_4b port map(din, blk_en6,rw_en,dout);
cache_4b_7 : cache_4b port map(din, blk_en7,rw_en,dout);

end structural;