library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity buff is
port(input : in std_logic;
output : out std_logic);
end buff;

architecture structural of buff is

begin
output<= input;
end structural;
