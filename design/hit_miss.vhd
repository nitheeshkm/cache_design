--
-- Entity: hit_miss
-- Architecture : structural
-- Author: n67
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity hit_miss is
  port (
    cache_tag_valid   : in  std_logic_vector(3 downto 0);
    cpu_tag   : in  std_logic_vector(2 downto 0);
    cpu_rw  : in std_logic;
    sm_en : in std_logic;
    w_m,r_m,w_h,r_h : out std_logic);
end hit_miss;

architecture structural of hit_miss is

component cmprtr2
  port (
  input1   : in  std_logic_vector(3 downto 0);
  input2   : in  std_logic_vector(2 downto 0);
  eql : out std_logic);
end component;

component dec2_4
  port(s0,s1,en : in std_logic;
  y0,y1,y2,y3 : out std_logic);
end component;

for cmprtr2_1 : cmprtr2 use entity work.cmprtr2(structural);
for dec2_4_1 : dec2_4 use entity work.dec2_4(structural);

signal hit_or_miss : std_logic;

begin

cmprtr2_1 :  cmprtr2 port map(cache_tag_valid, cpu_tag, hit_or_miss);
dec2_4_1 : dec2_4 port map(hit_or_miss, cpu_rw, sm_en,w_m,r_m,w_h,r_h);

end structural;

