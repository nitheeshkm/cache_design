--
-- Entity: mux2_1b
-- Architecture : structural 
-- Author: n67
-- Created On: 11/1/17 at 22:54
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2x1_8b is
  port (
    A  : in  std_logic_vector(7 downto 0);
    B  : in  std_logic_vector(7 downto 0);
    sel: in  std_logic;
    X   : out std_logic_vector(7 downto 0));
end mux2x1_8b;

architecture structural of mux2x1_8b is
  
component mux2x1
 port( A  : in  std_logic;
       B  : in  std_logic;
       sel: in  std_logic;
       output   : out std_logic);
end component;
	
	
for mux2x1_1,mux2x1_2,mux2x1_3,mux2x1_4,mux2x1_5,mux2x1_6,mux2x1_7,mux2x1_8 : mux2x1 use entity work.mux2x1(structural);

	
begin

mux2x1_1 : mux2x1 port map (A(0),B(0),sel,X(0)); 
mux2x1_2 : mux2x1 port map (A(1),B(1),sel,X(1)); 
mux2x1_3 : mux2x1 port map (A(2),B(2),sel,X(2)); 
mux2x1_4 : mux2x1 port map (A(3),B(3),sel,X(3)); 
mux2x1_5 : mux2x1 port map (A(4),B(4),sel,X(4)); 
mux2x1_6 : mux2x1 port map (A(5),B(5),sel,X(5)); 
mux2x1_7 : mux2x1 port map (A(6),B(6),sel,X(6)); 
mux2x1_8 : mux2x1 port map (A(7),B(7),sel,X(7));

end structural;
