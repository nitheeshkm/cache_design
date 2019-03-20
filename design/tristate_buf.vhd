library STD;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tristate_buf is

  Port ( A    : in  STD_LOGIC; 
         EN   : in  STD_LOGIC;    
         Y    : out STD_LOGIC);    
end tristate_buf;

architecture structural of tristate_buf is

component tx
  port ( sel   : in std_logic;
       selnot: in std_logic;
       input : in std_logic;
       output:out std_logic);
end component;

component inverter
port (input : in std_logic;
output : out std_logic);
end component;

for all : tx use entity work.tx(structural);
for all : inverter use entity work.inverter(structural);

signal EN_b:std_logic;
begin

inv_1 : inverter port map (EN, EN_b);
tx_1 : tx port map (EN, EN_b,A,Y);
--Y <= A when (EN = '1') else 'Z';
 
end structural;
