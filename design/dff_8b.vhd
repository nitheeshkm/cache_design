--
-- Entity: dff
-- Architecture : structural
-- Author: n67
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff_8b is                      
  port ( d   : in  std_logic_vector(7 downto 0);
         clk : in  std_logic;
         q   : out std_logic_vector(7 downto 0)); 
end dff_8b;                          

architecture structural of dff_8b is 

component dff                     
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic); 
end component;

for all : dff use entity work.dff(structural);      

begin
  
dff_0 : dff port map(d(0),clk,q(0));    
dff_1 : dff port map(d(1),clk,q(1));    
dff_2 : dff port map(d(2),clk,q(2));    
dff_3 : dff port map(d(3),clk,q(3));    
dff_4 : dff port map(d(4),clk,q(4));    
dff_5 : dff port map(d(5),clk,q(5));    
dff_6 : dff port map(d(6),clk,q(6));    
dff_7 : dff port map(d(7),clk,q(7));      

                             
end structural;  