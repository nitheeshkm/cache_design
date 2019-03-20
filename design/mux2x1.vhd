--
-- Entity: mux2_1b
-- Architecture : structural 
-- Author: n67
-- Created On: 11/1/17 at 22:54
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1 is

  port (
    A  : in  std_logic;
    B  : in  std_logic;
    sel: in  std_logic;
    output   : out std_logic
);
end mux2x1;

architecture structural of mux2x1 is
  
	component tx
  port (   sel: in std_logic;
           selnot: in std_logic;
           input : in std_logic;
           output:out std_logic);
	end component;
	
	component inverter
	port( input : in std_logic;
	output : out std_logic);
	end component;
	
--for nand2_1,nand2_2,nand2_3 : nand2 use entity work.nand2(structural);
for inv_1 : inverter use entity work.inverter(structural);	
for all : tx use entity work.tx(structural);
signal t1,t2,t3: std_logic;
	
begin
 
 inv_1 : inverter port map(sel,t1);
 tx_1 : tx port map(sel,t1,A,output);
 tx_2 : tx port map(t1,sel,B,output);
 
-- nand2_1 : nand2 port map(A,sel,t2);
-- nand2_2 : nand2 port map(B,t1,t3);
-- nand2_3 : nand2 port map(t2,t3,output);
	
end structural;
