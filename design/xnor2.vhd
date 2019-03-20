library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xnor2 is
  port(
  input1 : in std_logic; 
  input2 : in std_logic;
  output : out std_logic);
end xnor2;

architecture structural of xnor2 is 

component inverter
port(input : in std_logic;
     output : out std_logic);
end component;

component xor2
port(
  input1 : in std_logic; 
  input2 : in std_logic;
  output : out std_logic);
end component;


for inv_1 : inverter use entity work.inverter(structural);
for xor2_1 : xor2 use entity work.xor2(structural);

signal temp1:std_logic;

begin

xor2_1 : xor2 port map(input1, input2, temp1);
inv_1 : inverter port map(temp1, output);

  
end structural;
