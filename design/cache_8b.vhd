-- Entity: cache cell 8b
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;

entity cache_8b is 
port ( din :  in std_logic_vector(7 downto 0);
       en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end cache_8b;

architecture structural of cache_8b is

component cache_4b
port ( din :  in std_logic_vector(3 downto 0);
       en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(3 downto 0));
end component;

for all: cache_4b use entity work.cache_4b(structural);

begin

cache_4b_0 : cache_4b port map(din(3 downto 0),en,rw_en,dout(3 downto 0));
cache_4b_1 : cache_4b port map(din(7 downto 4),en,rw_en,dout(7 downto 4));

--cache_cell_0 : cache_cell port map(din(0),en,rw_en,dout(0));
--cache_cell_1 : cache_cell port map(din(1),en,rw_en,dout(1));
--cache_cell_2 : cache_cell port map(din(2),en,rw_en,dout(2));
--cache_cell_3 : cache_cell port map(din(3),en,rw_en,dout(3));
--cache_cell_4 : cache_cell port map(din(4),en,rw_en,dout(4));
--cache_cell_5 : cache_cell port map(din(5),en,rw_en,dout(5));
--cache_cell_6 : cache_cell port map(din(6),en,rw_en,dout(6));
--cache_cell_7 : cache_cell port map(din(7),en,rw_en,dout(7));

end structural;