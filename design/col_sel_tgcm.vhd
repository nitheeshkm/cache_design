library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity col_sel_tgcm is
Port ( blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7,reset,reset_b:in std_logic;
       cpu_add_reg : in std_logic_vector(2 downto 0);
       din : out std_logic_vector(3 downto 0);
       blk_en0_o,blk_en1_o,blk_en2_o,blk_en3_o,blk_en4_o,blk_en5_o,blk_en6_o,blk_en7_o : out std_logic
      );
end col_sel_tgcm;

architecture structural of col_sel_tgcm is

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

component buff  
port(input : in std_logic;
     output : out std_logic);
end component;
for all :buff use entity work.buff(structural);

component nor2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;
for all :nor2 use entity work.nor2(structural);

signal tag0,tag1,tag2 : std_logic;

begin

or2_8 : or2 port map(blk_en0,reset,blk_en0_o);
or2_9 : or2 port map(blk_en1,reset,blk_en1_o);
or2_10 : or2 port map(blk_en2,reset,blk_en2_o);
or2_11 : or2 port map(blk_en3,reset,blk_en3_o);
or2_12 : or2 port map(blk_en4,reset,blk_en4_o);
or2_5 : or2 port map(blk_en5,reset,blk_en5_o);
or2_6 : or2 port map(blk_en6,reset,blk_en6_o);
or2_7 : or2 port map(blk_en7,reset,blk_en7_o);

inv_13 : inverter port map(cpu_add_reg(2), tag2);
inv_14 : inverter port map(cpu_add_reg(1), tag1);
inv_15 : inverter port map(cpu_add_reg(0), tag0);

nor2_1 : nor2 port map(reset,tag2, din(2));
nor2_2 : nor2 port map(reset,tag1, din(1));
nor2_3 : nor2 port map(reset,tag0, din(0));
buff_1 : buff port map(reset_b,din(3));

end structural;
