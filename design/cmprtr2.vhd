--
-- Entity: cmprtr2
-- Architecture : structural
-- Author: n67
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cmprtr2 is
  port (
    input1   : in  std_logic_vector(3 downto 0);
    input2   : in  std_logic_vector(2 downto 0);
    eql : out std_logic);
end cmprtr2;

architecture structural of cmprtr2 is

component xnor2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

component and3
port (
    input1   : in  std_logic;
    input2   : in  std_logic;
	input3   : in  std_logic;
    output   : out std_logic);
end component;

component and2
port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;
  

for and3_1 : and3 use entity work.and3(structural);
for xnor2_1,xnor2_2,xnor2_3 : xnor2 use entity work.xnor2(structural);
for and2_1 : and2 use entity work.and2(structural);

signal t1,t2,t3,t4 : std_logic;

begin

xnor2_1 : xnor2 port map (input1(0),input2(0),t1);
xnor2_2 : xnor2 port map (input1(1),input2(1),t2);
xnor2_3 : xnor2 port map (input1(2),input2(2),t3);
and3_1  : and3 port map (t1,t2,t3,t4);
and2_1 : and2 port map (t4, input1(3), eql);

end structural;

