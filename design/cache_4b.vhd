-- Entity: cache cell 8b
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;

entity cache_4b is 
port ( din :  in std_logic_vector(3 downto 0);
       en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(3 downto 0));
end cache_4b;

architecture structural of cache_4b is

component cache_cell
port(		din	: in  std_logic;
			en  : in  std_logic;
			rw_en	: in  std_logic;
			dout	: out std_logic);
end component;

for cache_cell_0, cache_cell_1, cache_cell_2, cache_cell_3 : cache_cell use entity work.cache_cell(structural);

begin

cache_cell_0 : cache_cell port map(din(0),en,rw_en,dout(0));
cache_cell_1 : cache_cell port map(din(1),en,rw_en,dout(1));
cache_cell_2 : cache_cell port map(din(2),en,rw_en,dout(2));
cache_cell_3 : cache_cell port map(din(3),en,rw_en,dout(3));

end structural;