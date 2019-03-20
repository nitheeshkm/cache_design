-- Entity: cache cell
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;

entity cache_cell is 
port ( din :  in std_logic;
       en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic);
end cache_cell;

architecture structural of cache_cell is

component Dlatch
port (   d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qb : out std_logic); 
end component;

component tx
port (   sel   : in std_logic;
         selnot: in std_logic;
         input : in std_logic;
         output:out std_logic);
end component;

component and2
port(input1 : in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end component;

component inverter
port (
    input    : in  std_logic;
    output   : out std_logic);
end component;


for Dlatch_1 : Dlatch use entity work.Dlatch(structural);
for tx_1 : tx use entity work.tx(structural);
for inv_1,inv2 : inverter use entity work.inverter(structural);
for and2_1, and2_2 : and2 use entity work.and2(structural);

signal r_en, r_enb, w_en,rw_en_inv, temp1, temp2: std_logic;

begin
and2_1 : and2 port map(rw_en, en, r_en);
inv_1 : inverter port map(r_en, r_enb);
inv2  : inverter port map(rw_en,rw_en_inv);
and2_2 : and2 port map(rw_en_inv, en, w_en);
Dlatch_1 : Dlatch port map(din, w_en,temp1,temp2);
tx_1 : tx port map(r_en, r_enb,temp1,dout);
end structural;