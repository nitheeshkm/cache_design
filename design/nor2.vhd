library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nor2 is
port(input1 :in std_logic;
     input2 : in std_logic;
     output : out std_logic);
end nor2;

architecture structural of nor2 is

begin

output <= input1 nor input2;

end structural;
