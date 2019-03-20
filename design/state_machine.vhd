--
-- Entity: state machine
-- Architecture : structural
-- Author: n67 
library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;    

entity state_machine is
port(clk : in  std_logic; 
     reset : in std_logic;
	 start : in std_logic;
	 r_m,r_h,w_m,w_h : in std_logic
--	 state0: out std_logic
     );
end state_machine;

architecture structural of state_machine is

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

for all : dff use entity work.dff(structural);
for all : and2 use entity work.and2(structural);
for all : inverter use entity work.inverter(structural);
for all : or2 use entity work.or2(structural);

signal t1,t2,q,t3,start_b,r_m_st,s0_en,s1_en,s2_en,s3_en,s4_en,s5_en,s6_en,s7_en,s8_en,s9_en,s10_en,s11_en,s12_en,s13_en,s14_en,s15_en,s16_en,s17_en,s18_en:std_logic;
signal r_h_st,s1_en_rh,w_m_st,s1_en_wm,s2_en_wm,w_h_st,s1_en_wh,s2_en_wh,t4,t5,t6,s2_en_rh,s3_en_wm,s3_en_wh:std_logic;
signal reset_b,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25 : std_logic;

begin

inv_1 : inverter port map(start,start_b);
inv_2 : inverter port map(reset, reset_b);

or2_1 : or2 port map(t1,reset,t2);
and2_2 : and2 port map(q,start_b,t1);
dff_1 : dff port map(t2,clk,q);
and2_3 : and2 port map(q,start, t3);
dff_2 : dff port map(t3,clk,s0_en);

--Read Miss--
--and2_4 : and2 port map(s0_en,r_m,r_m_st);
dff_3 : dff port map(s0_en,clk,t7);
and2_8 :and2 port map(t7,r_m,s1_en);
dff_4  : dff port map(s1_en,clk,t8); 
and2_9 : and2 port map(t8,reset_b,s2_en);
dff_5 : dff port map(s2_en,clk,t9);
and2_10 : and2 port map(t9, reset_b,s3_en);
dff_6 : dff port map(s3_en,clk,t10);
and2_11 : and2 port map(t10, reset_b, s4_en);
dff_7 : dff port map(s4_en,clk,t11);
and2_12 : and2 port map(t11, reset_b,s5_en);
dff_8 : dff port map(s5_en,clk,t12);
and2_13 : and2 port map(t12, reset_b,s6_en);
dff_9 : dff port map(s6_en,clk,t13);
and2_14 : and2 port map(t13, reset_b,s7_en);
dff_10 : dff port map(s7_en,clk,t14);
and2_15 : and2 port map(t14, reset_b,s8_en);
dff_11 : dff port map(s8_en,clk,t15);
and2_16 : and2 port map(t15, reset_b,s9_en);
dff_12 : dff port map(s9_en,clk,t16);
and2_17 : and2 port map(t16, reset_b,s10_en);
dff_13 : dff port map(s10_en,clk,t17);
and2_18 : and2 port map(t17, reset_b,s11_en);
dff_14 : dff port map(s11_en,clk,t18);
and2_19 : and2 port map(t18, reset_b,s12_en);
dff_15 : dff port map(s12_en,clk,t19);
and2_20 : and2 port map(t19, reset_b,s13_en);
dff_16 : dff port map(s13_en,clk,t20);
and2_21 : and2 port map(t20, reset_b,s14_en);
dff_17 : dff port map(s14_en,clk,t21);
and2_22 : and2 port map(t21, reset_b,s15_en);
dff_18 : dff port map(s15_en,clk,t22);
and2_23 : and2 port map(t22, reset_b,s16_en);
dff_19 : dff port map(s16_en,clk,t23);
and2_24 : and2 port map(t23, reset_b,s17_en);
dff_20 : dff port map(s17_en,clk,s18_en);

--read hit---
and2_5 : and2 port map(s0_en,r_h,r_h_st);
dff_22 : dff port map(r_h_st,clk,s1_en_rh);

--write miss--
and2_6 : and2 port map(s0_en,w_m,w_m_st);
dff_23 : dff port map(w_m_st, clk,t24);
and2_25 : and2 port map(t24,reset_b,s1_en_wm);
dff_24 : dff port map(s1_en_wm,clk,s2_en_wm);

--write hit--
and2_7 : and2 port map(s0_en,w_h,w_h_st);
dff_25 : dff port map(w_h_st, clk,t25);
and2_26 : and2 port map(t25,reset_b,s1_en_wh);
dff_26 : dff port map(s1_en_wh, clk,s2_en_wh);


or2_2 : or2 port map(s18_en,s1_en_rh,t4);
or2_3 : or2 port map(s2_en_wm,s2_en_wh,t5);
or2_4 : or2 port map(t4,t5,t6);

end structural;