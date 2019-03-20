library STD;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tristate_buf_8b is

  Port ( A    : in  STD_LOGIC_VECTOR(7 downto 0); 
         EN   : in  STD_LOGIC;    
         Y    : out STD_LOGIC_VECTOR(7 downto 0));    
end tristate_buf_8b;

architecture structural of tristate_buf_8b is

component tristate_buf  
  Port ( A    : in  STD_LOGIC;
         EN   : in  STD_LOGIC;    
         Y    : out STD_LOGIC);    
end component;

for all : tristate_buf use entity work.tristate_buf(structural);

begin
tristate_buf_0 : tristate_buf port map(A(0),EN,Y(0));
tristate_buf_1 : tristate_buf port map(A(1),EN,Y(1));
tristate_buf_2 : tristate_buf port map(A(2),EN,Y(2));
tristate_buf_3 : tristate_buf port map(A(3),EN,Y(3));
tristate_buf_4 : tristate_buf port map(A(4),EN,Y(4));
tristate_buf_5 : tristate_buf port map(A(5),EN,Y(5));
tristate_buf_6 : tristate_buf port map(A(6),EN,Y(6));
tristate_buf_7 : tristate_buf port map(A(7),EN,Y(7));
end structural;
