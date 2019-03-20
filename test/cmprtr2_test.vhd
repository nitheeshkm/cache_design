library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cmprtr2_test is

end cmprtr2_test;

architecture test of cmprtr2_test is

component cmprtr2
  port (
    input1   : in  std_logic_vector(2 downto 0);
    input2   : in  std_logic_vector(2 downto 0);
    eql : out std_logic);
end component; 

for cmprtr2_1: cmprtr2 use entity work.cmprtr2(structural);

signal input11, input21 : std_logic_vector(2 downto 0);
signal eql1 : std_logic; 

procedure print_output is
   variable out_line: line;

   begin
   write (out_line, string'(" input11:"));
   write (out_line, input11);
   write (out_line, string'(" input21:"));
   write (out_line, input21);
   writeline(output, out_line);
   write (out_line, string'(" eql1:"));
   write (out_line, eql1);
   writeline(output, out_line);
end print_output;

begin

cmprtr2_1 : cmprtr2 port map (input11,input21,eql1);

io_process: process
   variable out_line: line;
   
begin

input11 <= "101";
input21 <= "101";

wait for 10 ns;
print_output;

input11 <= "101";
input21 <= "111";

wait for 10 ns;
print_output;

end process;
	
end test;
