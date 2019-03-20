library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nand2 is
port(input1 :in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end nand2;

architecture structural of nand2 is

begin

output <= input1 nand input2;

end structural;
