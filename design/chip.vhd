library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity chip is
port (
      cpu_add    : in  std_logic_vector(7 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	     : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(7 downto 0));
end chip;

architecture structural of chip is

component nand2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;

for all :nand2 use entity work.nand2(structural);

--component nor2
--port(input1 : in std_logic;
--     input2 : in std_logic;
--     output : out std_logic);
--end component;
--for all :nor2 use entity work.nor2(structural);

component buff  
port(input : in std_logic;
     output : out std_logic);
end component;
for all :buff use entity work.buff(structural);

component tristate_buf_8b  
  Port ( A    : in  STD_LOGIC_VECTOR(7 downto 0); 
         EN   : in  STD_LOGIC;    
         Y    : out STD_LOGIC_VECTOR(7 downto 0));    
end component;
for all :tristate_buf_8b use entity work.tristate_buf_8b(structural);

component encoder4_2  
port( i1 : in std_logic; --LSB
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic; --MSB
      o2 : out std_logic);
end component;
for all :encoder4_2 use entity work.encoder4_2(structural);

component mux2x1
 port( A  : in  std_logic;
       B  : in  std_logic;
       sel: in  std_logic;
       output   : out std_logic);
end component;
for all :mux2x1 use entity work.mux2x1(structural);

component mux2x1_8b  
  port (
    A  : in  std_logic_vector(7 downto 0);
    B  : in  std_logic_vector(7 downto 0);
    sel: in  std_logic;
    X   : out std_logic_vector(7 downto 0));
end component;
for all :mux2x1_8b use entity work.mux2x1_8b(structural);

--component xor2  
--  port(
--  input1 : in std_logic; 
--  input2 : in std_logic;
--  output : out std_logic);
--end component;
--for all :xor2 use entity work.xor2(structural);

-----------------------------------State Machine Init ------------------------------------------
component and2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;

component dff
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic); 
end component;

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
----------------------------------------------------------------------------------------------------------------------------------------------------------------
for all : dff use entity work.dff(structural);
for all : and2 use entity work.and2(structural);
for all : inverter use entity work.inverter(structural);
for all : or2 use entity work.or2(structural);

signal t1,t2,q,t3,start_b,r_m_st,s0_en,s1_en,s2_en,s3_en,s4_en,s5_en,s6_en,s7_en,s8_en,s9_en,s10_en,s11_en,s12_en,s13_en,s14_en,s15_en,s16_en,s17_en,s18_en:std_logic;
signal r_h_st,s1_en_rh,w_m_st,s1_en_wm,s2_en_wm,w_h_st,s1_en_wh,s2_en_wh,t4,t5,t6,s2_en_rh,s3_en_wm,s3_en_wh:std_logic;
signal reset_b,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25 : std_logic;
------------------------------------State Machine Init end  ------------------------------------------------
--------------------------------------------Registers----------------------------------------
component dff_8b                      
  port ( d   : in  std_logic_vector(7 downto 0);
        clk : in  std_logic;
        q   : out std_logic_vector(7 downto 0)); 
end component;


for all: dff_8b use entity work.dff_8b(structural);       

---------------------------------------------Registers END---------------------------------------

------------------------------------------------tie high/Low------------------------------------

---------------------------------------------------tie High/Low END---------------------------------
------------------------------------------------------------------------------------
component cache 
port ( din :  in std_logic_vector(7 downto 0);
       by_en0,by_en1,by_en2,by_en3 :in std_logic;
       blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7 : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end component;

for all : cache use entity work.cache(structural);

component tag_valid   
port ( din :  in std_logic_vector(3 downto 0);
       blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7 : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(3 downto 0));
end component;

for all : tag_valid use entity work.tag_valid(structural);

component dec2_4
port(s0,s1,en : in std_logic;
y0,y1,y2,y3 : out std_logic);
end component;

for all : dec2_4 use entity work.dec2_4(structural);

component dec3_8  
port(s0,s1,s2 : in std_logic;
y0,y1,y2,y3,y4,y5,y6,y7 : out std_logic);
end component;

for all : dec3_8 use entity work.dec3_8(structural);

component hit_miss  
  port (
    cache_tag_valid   : in  std_logic_vector(3 downto 0);
    cpu_tag   : in  std_logic_vector(2 downto 0);
    cpu_rw  : in std_logic;
    sm_en : in std_logic;
    w_m,r_m,w_h,r_h : out std_logic);
end component;

for all : hit_miss use entity work.hit_miss(structural);
-------------------------------------------------------------------------------------
component busy1
port(s0_en,start,t6,reset,q : in std_logic;
     busy : out std_logic
     );
end component;
for all : busy1 use entity work.busy1(structural);

component tag_cmp1
port(t14,t15,t16,t17,t18,t19,t20,t21: in std_logic;
     mem2,mem3,mem4 : inout std_logic;
     write_cache : out std_logic
     );
end component;
for all : tag_cmp1 use entity work.tag_cmp1(structural);

component col_sel_tgcm  
Port ( blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7,reset,reset_b:in std_logic;
       cpu_add_reg : in std_logic_vector(2 downto 0);
       din : out std_logic_vector(3 downto 0);
       blk_en0_o,blk_en1_o,blk_en2_o,blk_en3_o,blk_en4_o,blk_en5_o,blk_en6_o,blk_en7_o : out std_logic
      );
end component;
for all : col_sel_tgcm use entity work.col_sel_tgcm(structural);

component cac_dec_sgn  
port(cpu_rd_wrn_reg_b,write_cache,s18_en,t25,s1_en_rh : in std_logic;
      output_en,rw_cache1 :out std_logic
     );
end component;
for all : cac_dec_sgn use entity work.cac_dec_sgn(structural);

-----------------------------------------------------

signal blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7:std_logic;
signal blk_en0_o,blk_en1_o,blk_en2_o,blk_en3_o,blk_en4_o,blk_en5_o,blk_en6_o,blk_en7_o: std_logic; --,blk1_en0, blk1_en1,blk1_en2,blk1_en3,blk1_en4,blk1_en5,blk1_en6,blk1_en7 
signal cpu_rd_wrn_reg_b,cpu_rd_wrn_reg,tag_en,tag_en0,tag_en1 :  std_logic;
signal cpu_rd_wrn_reg_when_rst,tag2,tag1,tag0: std_logic;
signal w_m,r_m,w_h,r_h : std_logic;
signal cpu_add_reg,cpu_data_reg :std_logic_vector(7 downto 0);
signal hi,lo:std_logic;
signal feedback,t26:std_logic; 
--read from mem
signal mem1,mem2,mem3,mem4,b0,b1:std_logic;
--write  mem to cache
signal write_cache1,write_cache0,write_cache,write_cache_2,write_cache_2_b :std_logic;
signal byte_select : std_logic_vector(1 downto 0);
signal by_en0,by_en1,by_en2,by_en3 :std_logic; 
signal din_cache : std_logic_vector(7 downto 0); --data input for cache 
--cache block
signal s_b,s,cpu_op_en,rw_cache,rw_cache_en,rw_cache1,output_en : std_logic;          
signal dout_cache : std_logic_vector(7 downto 0);
--busy
signal tbusy1,tbusy2,last_busy,tbusy3: std_logic;

--
----temp assigns for test
signal din,dout : std_logic_vector(3 downto 0);
---
------------------------------------------------------------------------------------
begin

-----------------------------------------------State Machine processing-------------------------------------
inv_1 : inverter port map(start,start_b);
inv_2 : inverter port map(reset,reset_b);

or2_1 : or2 port map(t1,feedback,t2);
and2_2 : and2 port map(q,start_b,t1);
dff_1 : dff port map(t2,clk,q);
and2_3 : and2 port map(q,start, t3);
dff_2 : dff port map(t3,clk,s0_en);

--Read Miss--
and2_4 : and2 port map(r_m,s0_en,r_m_st);
dff_3 : dff port map(r_m_st,clk,t7);
and2_8 :and2 port map(reset_b,t7,s1_en);
dff_4  : dff port map(s1_en,clk,t8); 
and2_9 : and2 port map(reset_b,t8,s2_en);
dff_5 : dff port map(s2_en,clk,t9);
and2_10 : and2 port map(reset_b,t9, s3_en);
dff_6 : dff port map(s3_en,clk,t10);
and2_11 : and2 port map(reset_b, t10, s4_en);
dff_7 : dff port map(s4_en,clk,t11);
and2_12 : and2 port map(reset_b,t11, s5_en);
dff_8 : dff port map(s5_en,clk,t12);
and2_13 : and2 port map(reset_b,t12, s6_en);
dff_9 : dff port map(s6_en,clk,t13);
and2_14 : and2 port map(reset_b,t13, s7_en);
dff_10 : dff port map(s7_en,clk,t14);
and2_15 : and2 port map(reset_b,t14, s8_en);
dff_11 : dff port map(s8_en,clk,t15); ---===-=-=-=-
and2_16 : and2 port map(reset_b,t15, s9_en);
dff_12 : dff port map(s9_en,clk,t16);
and2_17 : and2 port map(reset_b,t16, s10_en);
dff_13 : dff port map(s10_en,clk,t17);
and2_18 : and2 port map(reset_b,t17, s11_en);
dff_14 : dff port map(s11_en,clk,t18);
and2_19 : and2 port map(reset_b,t18, s12_en);
dff_15 : dff port map(s12_en,clk,t19);
and2_20 : and2 port map(reset_b,t19, s13_en);
dff_16 : dff port map(s13_en,clk,t20);
and2_21 : and2 port map(reset_b,t20, s14_en);
dff_17 : dff port map(s14_en,clk,t21);
and2_22 : and2 port map(reset_b,t21, s15_en);
dff_18 : dff port map(s15_en,clk,t22);
and2_23 : and2 port map(reset_b,t22, s16_en);
dff_19 : dff port map(s16_en,clk,t23);
and2_24 : and2 port map(reset_b,t23, s17_en);
dff_20 : dff port map(s17_en,clk,s18_en);

--read hit---
and2_5 : and2 port map(s0_en,r_h,r_h_st);
dff_22 : dff port map(r_h_st,clk,s1_en_rh);

--write miss--
and2_6 : and2 port map(s0_en,w_m,w_m_st);
dff_23 : dff port map(w_m_st, clk,t24);
and2_25 : and2 port map(reset_b,t24,s1_en_wm);
dff_24 : dff port map(s1_en_wm,clk,s2_en_wm);

--write hit--
and2_7 : and2 port map(s0_en,w_h,w_h_st);
dff_25 : dff port map(w_h_st, clk,t25);
and2_26 : and2 port map(reset_b,t25,s1_en_wh);
dff_26 : dff port map(s1_en_wh, clk,s2_en_wh);

--feedback--
or2_2 : or2 port map(s18_en,s1_en_rh,t4);
or2_3 : or2 port map(s2_en_wm,s2_en_wh,t5);
or2_4 : or2 port map(t4,t5,t6);
or2_feedback : or2 port map(t6, reset, feedback);
----------------------------------------------State Machine processing end--------------------------------------

------------------------------------------------------------------------------------
------------------------------------------Latch cpu addr,data and rw_sig------------------------------------------
dff_rw_register : dff port map(cpu_rd_wrn,start_b,cpu_rd_wrn_reg);
dff_8b_address_register : dff_8b port map (cpu_add,start_b,cpu_add_reg);
dff_8b_data_register : dff_8b port map(cpu_data,start_b,cpu_data_reg); 
-----------------------------------------------tag compare-------------------------------------
dec3_8_1 : dec3_8 port map (cpu_add_reg(4),cpu_add_reg(3),cpu_add_reg(2),blk_en1, blk_en0,blk_en3,blk_en2,blk_en5,blk_en4,blk_en7,blk_en6);



--or2_8 : or2 port map(blk_en0,reset,blk_en0_o);
--or2_9 : or2 port map(blk_en1,reset,blk_en1_o);
--or2_10 : or2 port map(blk_en2,reset,blk_en2_o);
--or2_11 : or2 port map(blk_en3,reset,blk_en3_o);
--or2_12 : or2 port map(blk_en4,reset,blk_en4_o);
--or2_5 : or2 port map(blk_en5,reset,blk_en5_o);
--or2_6 : or2 port map(blk_en6,reset,blk_en6_o);
--or2_7 : or2 port map(blk_en7,reset,blk_en7_o);

--inv_13 : inverter port map(cpu_add_reg(7), tag2);
--inv_14 : inverter port map(cpu_add_reg(6), tag1);
--inv_15 : inverter port map(cpu_add_reg(5), tag0);


--nor2_1 : nor2 port map(reset,tag2, din(2));
--nor2_2 : nor2 port map(reset,tag1, din(1));
--nor2_3 : nor2 port map(reset,tag0, din(0));
--buff_1 : buff port map(reset_b,din(3));

col_sel_tgcm_1 : col_sel_tgcm port map(blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7,reset,reset_b,cpu_add_reg(7 downto 5),din(3 downto 0),blk_en0_o,blk_en1_o,blk_en2_o,blk_en3_o,blk_en4_o,blk_en5_o,blk_en6_o,blk_en7_o);



inv_12 : inverter port map(cpu_rd_wrn_reg,cpu_rd_wrn_reg_b); 


nand2_rwtag : nand2 port map(reset,rw_cache1,tag_en0);
or2_rwtag : or2 port map(reset, rw_cache1,tag_en1);
nand2_rwtag1 : nand2 port map(tag_en0,tag_en1,tag_en);

tag_valid_1 : tag_valid port map(din,blk_en0_o,blk_en1_o,blk_en2_o,blk_en3_o,blk_en4_o,blk_en5_o,blk_en6_o,blk_en7_o,tag_en,dout);
hit_miss_1 : hit_miss port map(dout,cpu_add_reg(7 downto 5),cpu_rd_wrn_reg,s0_en,w_m,r_m,w_h,r_h); 

-------------------------------------------memory enable -----------------------------------------
tristate_buf_mem : tristate_buf_8b port map(A(7 downto 2)=>cpu_add_reg(7 downto 2),A(1)=>Gnd, A(0)=>Gnd
, EN=>t7, Y=>mem_add);
buf_mem : buff port map(t7,mem_en);   
------------------------------------------------Column Select----------------------------------------------
--or2_mem1 : or2 port map(t14,t15,mem1);
--or2_mem2 : or2 port map(t17,t16,mem2);
--or2_mem3 : or2 port map(t18,t19,mem3);
--or2_mem4 : or2 port map(t20,t21,mem4);

--or2_byte0 : or2 port map(mem2,mem1,write_cache0);
--or2_byte1 : or2 port map(mem3,mem4,write_cache1);
--or2_byte : or2 port map(write_cache0, write_cache1,write_cache); --or2_cacheRow2 tempWcache

tag_cmp1_1 : tag_cmp1 port map(t14,t15,t16,t17,t18,t19,t20,t21,mem2,mem3,mem4,write_cache);
encoder4_2_mem : encoder4_2 port map(mem2, mem3, mem4, b0,b1);

mux2x1_cache0 : mux2x1 port map(b0,cpu_add_reg(1),write_cache,byte_select(0));
mux2x1_cache1 : mux2x1 port map(b1,cpu_add_reg(0),write_cache,byte_select(1));


dec2_4_byte : dec2_4 port map(byte_select(0),byte_select(1),rw_cache1,by_en0,by_en1,by_en2,by_en3); --write_cache instead dec2_4_en
--------------------------------------------------Write to Cache--------------------------------------------
or2_cache_write_en : or2 port map(write_cache,t22, write_cache_2); 
inv_cache : inverter port map(write_cache_2,write_cache_2_b);
mux2x1_8b_cache_write : mux2x1_8b port map(cpu_data_reg,mem_data,write_cache_2_b,din_cache); 
-------------------------------------------------------cache---------------------------------------
--or2_13 :or2 port map(cpu_rd_wrn_reg_b,write_cache,cpu_op_en);
--inv_cacheOUT : inverter port map(cpu_op_en,output_en);
--or2_14 : or2 port map(write_cache,s18_en,rw_cache);
--or2_15 : or2 port map(rw_cache,t25,rw_cache_en);
--or2_RH : or2 port map(s1_en_rh,rw_cache_en,rw_cache1);

cac_dec_sgn_1 : cac_dec_sgn port map(cpu_rd_wrn_reg_b,write_cache,s18_en,t25,s1_en_rh,output_en,rw_cache1);


cache_cache : cache port map(din_cache,by_en0,by_en1,by_en2,by_en3,blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7,output_en,dout_cache);
-------------------------------------------------------Write to CPU---------------------------------------
tristate_buf_cpu : tristate_buf_8b port map (dout_cache,t4,cpu_data);
----------------------------------------------------------BUSY--------------------------

--and2_busy1 : and2 port map(s0_en, start, tbusy1);
--nor_busy2 : nor2 port map(start,t6, tbusy2);
--nor_busy3 : nor2 port map(reset,q,tbusy3);
--and2_busy2 : and2 port map(tbusy2, tbusy3,last_busy);
--or2_busy3 : or2 port map(tbusy1,last_busy,busy);
busy1_1 : busy1 port map(s0_en,start,t6,reset,q,busy);

end structural;
