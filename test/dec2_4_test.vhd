
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity dec2_4_test is

end dec2_4_test;

architecture test of dec2_4_test is

component dec2_4
port(s0,s1,en : in std_logic;
y0,y1,y2,y3 : out std_logic);
end component;

for dec2_4_1: dec2_4 use entity work.dec2_4(structural);
signal s01,s11,en1,y01,y11,y21,y31: std_logic;

procedure print_output is
   variable out_line: line;

   begin
--   write (out_line, string'(" din1:"));
--   write (out_line, din1);
----   write (out_line, string'(" en1:"));
----   write (out_line, en1);
--   write (out_line, string'(" rw_en1:"));
--   write (out_line, rw_en1);
--   writeline(output, out_line);
--   write (out_line, string'(" dout:"));
--   write (out_line, dout1);
--   writeline(output, out_line);
end print_output;

begin

dec2_4_1 : dec2_4 port map (s01,s11,en1,y01,y11,y21,y31);


io_process: process
   variable out_line: line;
   
begin
       
s01 <= '1';
s11 <= '1';
en1 <= '0';

wait for 10 ns;

s01 <= '0';
s11 <= '0';
en1 <= '1';

wait for 10 ns;

s01 <= '0';
s11 <= '1';
en1 <= '1';

wait for 10 ns;	  

s01 <= '1';
s11 <= '0';
en1 <= '1';

wait for 10 ns;

s01 <= '1';
s11 <= '1';
en1 <= '1';

wait for 10 ns;

print_output;

end process;
	
end test;

