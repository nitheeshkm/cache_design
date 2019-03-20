
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cac_dec_sgn is
port(cpu_rd_wrn_reg_b,write_cache,s18_en,t25,s1_en_rh : in std_logic;
      output_en,rw_cache1 :out std_logic);
end cac_dec_sgn;

architecture structural of cac_dec_sgn is


component inverter
 port (
    input    : in  std_logic;
    output   : out std_logic);
end component;

component or2
port(
    input1    : in  std_logic;
    input2 : in std_logic;
    output   : out std_logic);
end component;

for all : inverter use entity work.inverter(structural);
for all : or2 use entity work.or2(structural);

signal cpu_op_en,rw_cache,rw_cache_en : std_logic;

begin

or2_13 :or2 port map(cpu_rd_wrn_reg_b,write_cache,cpu_op_en);
inv_cacheOUT : inverter port map(cpu_op_en,output_en);
or2_14 : or2 port map(write_cache,s18_en,rw_cache);
or2_15 : or2 port map(rw_cache,t25,rw_cache_en);
or2_RH : or2 port map(s1_en_rh,rw_cache_en,rw_cache1);

end structural;
